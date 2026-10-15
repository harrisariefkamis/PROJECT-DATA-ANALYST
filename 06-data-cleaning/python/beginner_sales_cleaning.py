# Beginner: Pandas script untuk membersihkan sample_sales.csv
# File: 06-data-cleaning/python/beginner_sales_cleaning.py

import pandas as pd

# 1. Muat data
input_path = '06-data-cleaning/data/sample_sales.csv'
df = pd.read_csv(input_path)

# 2. Inspect
print('Informasi awal:')
print(df.info())
print('\nMissing per kolom:')
print(df.isna().sum())

# 3. Bersihkan string & parsing tipe
df['order_id'] = df['order_id'].astype(str).str.strip()
df['customer_name'] = df['customer_name'].astype(str).str.strip()
df['product'] = df['product'].astype(str).str.strip()

# parsing tanggal; invalid -> NaT
df['order_date'] = pd.to_datetime(df['order_date'], errors='coerce')
# numeric
df['quantity'] = pd.to_numeric(df['quantity'], errors='coerce')
df['price'] = pd.to_numeric(df['price'], errors='coerce')

# 4. Drop baris tanpa order_id atau order_date (business rule)
df = df[df['order_id'].notna() & df['order_date'].notna()]

# 5. Isi missing quantity dengan 1 (business rule)
df['quantity'] = df['quantity'].fillna(1).astype(int)

# 6. Isi missing price dengan median per product
median_price = df.groupby('product')['price'].transform('median')
df['price'] = df['price'].fillna(median_price)

# 7. Hapus duplikat berdasar order_id (keep pertama)
df = df.drop_duplicates(subset=['order_id'], keep='first')

# 8. Buat kolom total dan validasi cepat
df['total'] = df['quantity'] * df['price']
assert (df['quantity'] >= 0).all(), 'Quantity negatif ditemukan'
assert (df['price'] >= 0).all(), 'Price negatif ditemukan'

# 9. Simpan hasil
output_path = '06-data-cleaning/data/sample_sales_cleaned.csv'
df.to_csv(output_path, index=False)
print(f'Cleaned data saved to {output_path}')
