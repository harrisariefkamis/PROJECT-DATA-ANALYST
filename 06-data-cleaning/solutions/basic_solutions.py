# Solusi latihan — Beginner (cleaning)

Berisi fungsi sederhana yang melakukan pembersihan berdasarkan notebook beginner. Simpan sebagai `06-data-cleaning/solutions/basic_solutions.py`.

```python
import pandas as pd

def clean_sales(input_path, output_path):
    df = pd.read_csv(input_path)
    # trim
    str_cols = df.select_dtypes(include=['object']).columns
    df[str_cols] = df[str_cols].apply(lambda s: s.str.strip())
    # parse
    df['order_date'] = pd.to_datetime(df['order_date'], errors='coerce')
    df['quantity'] = pd.to_numeric(df['quantity'], errors='coerce')
    df['price'] = pd.to_numeric(df['price'], errors='coerce')
    # rules
    df = df.dropna(subset=['order_id','order_date'])
    df['quantity'] = df['quantity'].fillna(1).astype(int)
    df['price'] = df['price'].fillna(df.groupby('product')['price'].transform('median'))
    df = df.drop_duplicates(subset=['order_id'], keep='first')
    df['total'] = df['quantity'] * df['price']
    df.to_csv(output_path, index=False)
    return df

if __name__ == '__main__':
    in_p = '06-data-cleaning/data/sample_sales.csv'
    out_p = '06-data-cleaning/data/sample_sales_cleaned_from_solution.csv'
    df = clean_sales(in_p, out_p)
    print('Saved cleaned file to', out_p)
```
