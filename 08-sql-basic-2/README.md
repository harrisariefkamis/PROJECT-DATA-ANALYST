# SQL Basic 2 — Filter, NULL, dan Operator Logika (PostgreSQL)

## Agenda
- Review: jawaban Mini Task SQL Basic 1 (CREATE TABLE orders)
- Import data dari CSV (pgAdmin / import wizard)
- Memfilter data dengan WHERE
- Mengenal NULL values (IS NULL / IS NOT NULL)
- Operator logika: AND / OR / NOT / IN / NOT IN
- Contoh query & tips praktis
- Mini Task (soal) + jawaban contoh

---

## Jawaban Mini Task SQL Basic 1 (contoh DDL)
Contoh skema tabel `orders` (dari tugas sebelumnya):
```sql
CREATE TABLE orders (
  order_id varchar,
  customer_id varchar,
  postal_code varchar,
  product_id varchar,
  sales float,
  quantity int,
  discount float,
  profit float,
  category varchar,
  subcategory varchar,
  product_name varchar,
  order_date date,
  ship_date date,
  ship_mode varchar,
  customer_name varchar,
  segment varchar,
  country varchar,
  city varchar,
  state varchar,
  region varchar
);
```
Catatan: sesuaikan tipe kolom bila diperlukan (mis. gunakan NUMERIC/DECIMAL untuk monetary).

---

## Import dari CSV (pgAdmin / GUI)
1. Pastikan tabel `orders` sudah ada (atau buat baru sesuai struktur).
2. Di pgAdmin: klik kanan pada tabel `orders` → Import/Export Data.
3. Pilih mode `Import`, klik ikon folder → pilih file `orders.csv`.
4. Atur delimiter (mis. comma), header (true jika ada baris header), encoding.
5. Jalankan import. Jika sukses, tabel akan terisi nilai dari CSV.

Alternatif (psql): gunakan `\copy` dari client:
```sql
\copy orders FROM '/local/path/orders.csv' WITH (FORMAT csv, HEADER true);
```
Catatan: path pada `\copy` adalah path lokal client.

---

## SELECT — Memilih kolom
Sintaks dasar:
```sql
SELECT col1, col2, ...
FROM table_name;
```
Menampilkan semua kolom:
```sql
SELECT * FROM orders;
```

---

## WHERE — Menyaring baris
Gunakan WHERE untuk kondisi:
```sql
SELECT order_id, order_date, customer_name
FROM orders
WHERE customer_name = 'Claire Gute';
```
Perhatian:
- Di PostgreSQL, string dibatasi dengan tanda kutip tunggal: '...'
- Jika nama kolom memiliki spasi atau case sensitif, gunakan tanda kutip ganda: "Order ID"

---

## Operator logika: AND / OR / NOT
Contoh:
- AND (semua kondisi harus TRUE):
```sql
SELECT customer_name
FROM orders
WHERE segment = 'Consumer' AND city = 'Kentucky';
```
- OR (salah satu kondisi True):
```sql
SELECT customer_name
FROM orders
WHERE city = 'California' OR city = 'Kentucky';
```
- NOT (membalik kondisi):
```sql
SELECT * FROM orders
WHERE NOT (city = 'Los Angeles');
```

---

## Operator IN / NOT IN
Menyingkat banyak OR:
```sql
SELECT *
FROM orders
WHERE city IN ('Los Angeles','Houston','Durham','San Francisco','Columbus');
```
Kebalikan:
```sql
SELECT *
FROM orders
WHERE city NOT IN ('Los Angeles','Houston','Durham','San Francisco','Columbus');
```

---

## NULL values: IS NULL / IS NOT NULL
Untuk mengecek nilai kosong:
```sql
SELECT *
FROM orders
WHERE postal_code IS NULL;

SELECT *
FROM orders
WHERE postal_code IS NOT NULL;
```
Catatan: operator perbandingan biasa (=, <, >) tidak berlaku untuk NULL.

---

## Contoh praktis
1. Tampilkan semua pesanan dari segmen Consumer yang membeli meja:
```sql
SELECT DISTINCT customer_name
FROM orders
WHERE segment = 'Consumer' AND product_name ILIKE '%table%';
```
(ILIKE untuk pencarian case-insensitive; sesuaikan kata kunci, mis. 'table' atau 'meja')

2. Tampilkan nama konsumen dari segmen Corporate atau Home Office yang berasal dari Los Angeles dan bertransaksi di tahun 2018:
```sql
SELECT DISTINCT customer_name
FROM orders
WHERE segment IN ('Corporate','Home Office')
  AND city = 'Los Angeles'
  AND EXTRACT(YEAR FROM order_date) = 2018;
```

---

## Mini Task (soal)
Berdasarkan tabel `orders`:
1. Tampilkan nama-nama konsumen segmen Consumer yang pernah membeli meja.
2. Tampilkan nama-nama konsumen dari segmen Corporate dan Home Office yang berasal dari kota Los Angeles dan bertransaksi selama tahun 2018.

Jawaban contoh (lihat bagian Contoh praktis di atas).

---

## Tips & Best Practices
- Gunakan `LIMIT` saat eksplorasi data besar: `SELECT * FROM orders LIMIT 50;`
- Gunakan `EXPLAIN` untuk memahami rencana query jika kinerja penting.
- Saat mencari teks, gunakan `ILIKE '%keyword%'` untuk case-insensitive (Postgres).
- Gunakan indeks pada kolom filter yang sering dipakai (city, order_date, segment) untuk mempercepat query di dataset besar.

---

## Next steps
- Pelajari GROUP BY dan agregasi (COUNT, SUM, AVG) di modul selanjutnya.
- Latihan: temukan top 10 produk berdasarkan total sales; hitung average profit per region.
