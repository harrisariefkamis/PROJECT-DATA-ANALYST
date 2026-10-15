# Solusi latihan — Advanced (cleaning & QA)

Berisi fungsi pembersihan dan QA untuk kasus transaksi. Simpan sebagai `06-data-cleaning/solutions/advanced_solutions.py`.

```python
import pandas as pd
import numpy as np

FX_MAP = {'USD': 1.0, 'IDR': 1/15000.0}

def clean_transactions(input_path, output_path):
    df = pd.read_csv(input_path, dtype=str)
    df = df.applymap(lambda v: v.strip() if isinstance(v, str) else v)
    df['event_time'] = pd.to_datetime(df['event_time'], errors='coerce', utc=True)
    df['amount'] = pd.to_numeric(df['amount'], errors='coerce')
    # dedup
    cols = ['user_id','event_time','amount','currency']
    df['completeness'] = df[cols].notna().sum(axis=1)
    df = df.sort_values(['tx_id','completeness','event_time'], ascending=[True, False, False])
    df = df.drop_duplicates(subset=['tx_id'], keep='first').reset_index(drop=True)
    # convert currency
    df['amount_usd'] = df.apply(lambda r: r['amount'] * FX_MAP.get(r['currency'], np.nan) if pd.notna(r['amount']) else np.nan, axis=1)
    # basic QA
    null_rates = df.isna().mean()
    unique_tx = df['tx_id'].nunique() == len(df)
    # save
    df.to_csv(output_path, index=False)
    return df, null_rates, unique_tx

if __name__ == '__main__':
    in_p = '06-data-cleaning/data/sample_transactions.csv'
    out_p = '06-data-cleaning/data/sample_transactions_cleaned_from_solution.csv'
    df, nulls, unique = clean_transactions(in_p, out_p)
    print('Saved cleaned file to', out_p)
    print('Null rates:\n', nulls)
    print('Unique tx after dedup:', unique)
```
