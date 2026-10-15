# Beginner Case: Sales Data Cleaning (for beginners)

Goal: Clean a small sales dataset to prepare it for analysis. Tasks cover common beginner-level cleaning steps: loading data, inspecting types, handling missing values, fixing types, removing duplicates, and basic validation.

Sample dataset: `data/sample_sales.csv` (columns: order_id, order_date, customer_name, product, quantity, price, country)

Steps & Example (pandas):

1. Load the data

```python
import pandas as pd
df = pd.read_csv('06-data-cleaning/data/sample_sales.csv')
df.head()
```

2. Inspect data types & missing values

```python
df.info()
df.isna().sum()
```

3. Convert types: parse dates and numeric columns

```python
df['order_date'] = pd.to_datetime(df['order_date'], errors='coerce')
df['quantity'] = pd.to_numeric(df['quantity'], errors='coerce')
df['price'] = pd.to_numeric(df['price'], errors='coerce')
```

4. Handle missing values (example strategies)

- Drop rows where `order_id` or `order_date` is missing
- Fill missing `quantity` with 1 (business rule)
- Fill missing `price` with median price per product

```python
# drop rows with missing order_id or order_date
df = df.dropna(subset=['order_id', 'order_date'])

# fill quantity missing with 1
df['quantity'] = df['quantity'].fillna(1)

# fill price per product
median_price = df.groupby('product')['price'].transform('median')
df['price'] = df['price'].fillna(median_price)
```

5. Remove obvious duplicates

```python
df = df.drop_duplicates(subset=['order_id'], keep='first')
```

6. Create computed columns and validate

```python
df['total'] = df['quantity'] * df['price']
# quick checks
assert (df['quantity'] >= 0).all()
assert (df['price'] >= 0).all()
```

7. Save cleaned data

```python
df.to_csv('06-data-cleaning/data/sample_sales_cleaned.csv', index=False)
```

Hints for learners:
- Use `df.sample(5)` to inspect random rows
- Use `.describe()` to see distribution of numeric fields
- Use value_counts() to inspect categories (e.g., country)


