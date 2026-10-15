# Advanced: Script Python untuk cleaning & QA transaksi
# File: 06-data-cleaning/python/advanced_transactions_cleaning.py

import pandas as pd
import numpy as np

# 1. Muat data mentah
input_path = '06-data-cleaning/data/sample_transactions.csv'
df = pd.read_csv(input_path, dtype=str)

# Trim whitespace pada semua nilai string
df = df.applymap(lambda v: v.strip() if isinstance(v, str) else v)

# 2. Parsing timestamp (utc-aware), invalid -> NaT
df['event_time'] = pd.to_datetime(df['event_time'], errors='coerce', utc=True)

# 3. Konversi amount ke numeric
df['amount'] = pd.to_numeric(df['amount'], errors='coerce')

# 4. QA awal: null rates & duplikat
print('Null rate per kolom:')
print(df.isna().mean())

dups_mask = df.duplicated(subset=['tx_id'], keep=False)
if dups_mask.any():
    print('\nDuplikat tx_id ditemukan:')
    print(df.loc[dups_mask, ['tx_id','user_id','event_time','amount','currency']])

# 5. Resolusi duplikat: keep baris dengan completeness tertinggi, tie -> event_time terbaru
cols_for_score = ['user_id','event_time','amount','currency']
df['completeness'] = df[cols_for_score].notna().sum(axis=1)
df = df.sort_values(['tx_id','completeness','event_time'], ascending=[True, False, False])
df = df.drop_duplicates(subset=['tx_id'], keep='first').reset_index(drop=True)

# 6. Konversi mata uang: contoh mapping sederhana (gunakan tabel FX real di produksi)
fx = {'USD': 1.0, 'IDR': 1/15000.0}

def convert_to_usd(row):
    amt = row['amount']
    cur = row.get('currency')
    if pd.isna(amt) or pd.isna(cur):
        return np.nan
    rate = fx.get(cur)
    if rate is None:
        return np.nan
    return amt * rate

df['amount_usd'] = df.apply(convert_to_usd, axis=1)

# 7. Deteksi outlier (IQR per bulan)
df['month'] = df['event_time'].dt.to_period('M')
agg = df.groupby('month')['amount_usd']
q1 = agg.quantile(0.25)
q3 = agg.quantile(0.75)
iqr = q3 - q1
bounds = pd.DataFrame({'q1': q1, 'q3': q3, 'iqr': iqr}).reset_index()
# gabungkan
if not bounds.empty:
    df = df.merge(bounds, left_on='month', right_on='month', how='left')
    df['is_outlier'] = ((df['amount_usd'] < (df['q1'] - 1.5*df['iqr'])) | (df['amount_usd'] > (df['q3'] + 1.5*df['iqr'])))
else:
    df['is_outlier'] = False

print('\nOutlier flags:')
print(df[['tx_id','amount_usd','is_outlier']])

# 8. QA report: daily counts & uniqueness
if df['event_time'].notna().any():
    daily_counts = df.groupby(df['event_time'].dt.date).size().rename('rows').reset_index()
    print('\nDaily counts (recent):')
    print(daily_counts.tail())

print('\nTX unique after dedup:', df['tx_id'].nunique() == len(df))

# 9. Simpan hasil
output_path = '06-data-cleaning/data/sample_transactions_cleaned.csv'
df.to_csv(output_path, index=False)
print(f'Cleaned transactions saved to {output_path}')
