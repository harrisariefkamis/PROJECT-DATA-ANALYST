# SQL for Data Analysis — Agregasi, GROUP BY, HAVING, dan JOIN (Ringkas)

## Tujuan Pembelajaran
Setelah modul ini peserta diharapkan dapat:
- Memahami fungsi agregat dasar: COUNT, SUM, MIN, MAX, AVG.
- Mengelompokkan data dengan GROUP BY dan memfilter agregat menggunakan HAVING.
- Membedakan peran WHERE dan HAVING.
- Mengaplikasikan JOIN sederhana (INNER/LEFT/RIGHT/FULL) pada analisis multi-tabel.
- Menyelesaikan mini task analitis menggunakan SQL.

---

## Agenda
- Fungsi agregat: COUNT, MIN, MAX, SUM, AVG
- GROUP BY — mengelompokkan data
- HAVING — filter hasil agregasi (perbedaan dengan WHERE)
- Contoh penggunaan JOIN singkat (refresher)
- Mini task + jawaban contoh

---

## 1) Fungsi Agregat (ringkas)
```text
Fungsi agregat melakukan operasi pada sekumpulan nilai dan mengembalikan satu nilai:
- COUNT(expr) — hitung jumlah baris / nilai (COUNT(*) atau COUNT(DISTINCT col)).
- SUM(expr) — jumlah total (berguna untuk sales/amount).
- MIN(expr) — nilai minimum.
- MAX(expr) — nilai maksimum.
- AVG(expr) — rata-rata.
```
Contoh:
```sql
SELECT
  COUNT(*) AS banyak_baris,
  COUNT(DISTINCT order_id) AS banyak_order,
  MIN(order_date) AS tanggal_awal,
  MAX(order_date) AS tanggal_akhir,
  SUM(profit) AS total_profit,
  AVG(sales) AS avg_sales
FROM orders;
```

Catatan:
- Gunakan COUNT(DISTINCT ...) untuk menghitung entitas unik.
- Untuk money, gunakan tipe NUMERIC/DECIMAL dalam schema untuk akurasi.

---

## 2) GROUP BY — mengelompokkan data
GROUP BY mengelompokkan baris berdasarkan kolom kategori lalu menerapkan fungsi agregat pada setiap grup.
Contoh per-segmen:
```sql
SELECT
  segment,
  COUNT(DISTINCT order_id) AS banyak_order,
  SUM(sales) AS total_sales,
  AVG(profit) AS avg_profit
FROM orders
GROUP BY segment;
```

Contoh per-tanggal:
```sql
SELECT
  order_date,
  COUNT(DISTINCT order_id) AS banyak_order
FROM orders
GROUP BY order_date
ORDER BY order_date;
```

Peraturan umum:
- Semua kolom non-aggregat di SELECT harus muncul di GROUP BY (atau dipakai dalam fungsi agregat).
- Gunakan alias untuk membuat hasil lebih mudah dibaca.

---

## 3) HAVING vs WHERE
- WHERE: memfilter baris sebelum agregasi (mempengaruhi baris input ke GROUP BY).
- HAVING: memfilter berdasarkan hasil agregasi setelah GROUP BY.
Keduanya dapat digunakan bersama (WHERE → GROUP BY → HAVING).

Contoh:
```sql
SELECT order_id, SUM(sales) AS nilai_order
FROM orders
WHERE segment = 'Consumer'
GROUP BY order_id
HAVING SUM(sales) > 100;
```

---

## 4) JOIN (refresher singkat)
- INNER JOIN: hanya baris yang cocok di kedua tabel.
- LEFT JOIN: semua baris dari kiri, cocok dari kanan atau NULL.
- RIGHT JOIN: semua baris dari kanan, cocok dari kiri atau NULL.
- FULL OUTER JOIN: semua baris dari kedua sisi, NULL bila tidak cocok.

Contoh:
```sql
SELECT o.order_id, c.customer_name, o.sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
```

Gunakan alias tabel (o, c) untuk memperpendek penulisan.

---

## 5) Contoh kasus & query umum
- Total sales per region:
```sql
SELECT region, SUM(sales) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;
```
- Segment dengan profit rata-rata tertinggi (dengan minimal 50 order):
```sql
SELECT segment, AVG(profit) AS avg_profit, COUNT(*) AS cnt
FROM orders
GROUP BY segment
HAVING COUNT(*) >= 50
ORDER BY avg_profit DESC;
```
- Top 10 produk berdasarkan total penjualan:
```sql
SELECT product_name, SUM(sales) AS total_sales
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;
```

---

## 6) Mini Task (latihan)
Kerjakan menggunakan tabel `orders` (atau gabungan dengan `customers` jika perlu):

1. Pastikan setiap nama konsumen hanya berasosiasi ke satu customer_id.
   - Tugas: temukan nama konsumen yang terkait ke >1 customer_id.
   - Hint:
```sql
SELECT customer_name, COUNT(DISTINCT customer_id) AS cnt_ids
FROM orders
GROUP BY customer_name
HAVING COUNT(DISTINCT customer_id) > 1;
```

2. Produk (product_name) apa yang paling best-selling (berdasarkan jumlah unit/quantity dan berdasarkan sales)?
   - Hint (by quantity):
```sql
SELECT product_name, SUM(quantity) AS total_qty
FROM orders
GROUP BY product_name
ORDER BY total_qty DESC
LIMIT 1;
```
   - Hint (by sales):
```sql
SELECT product_name, SUM(sales) AS total_sales
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 1;
```

3. Produk apa yang paling merugikan selama tahun 2017 (total profit paling negatif)?
   - Hint:
```sql
SELECT product_name, SUM(profit) AS total_profit
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2017
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;
```

---

## 7) Best practices singkat
- Pastikan tipe data benar (DATE untuk tanggal, NUMERIC untuk uang).
- Pakai indeks pada kolom yang sering dipakai di WHERE/GROUP BY untuk dataset besar.
- Gunakan LIMIT saat eksplorasi data besar.
- Dokumentasikan asumsi (mis. definisi “best-selling” by qty atau by sales).
- Gunakan EXPLAIN untuk cek performa query bila dataset sangat besar.

---

## 8) Referensi & latihan lanjut
- Lanjutkan ke: JOIN kompleks, window functions (ROW_NUMBER, RANK, SUM() OVER()), CTE.
- Sumber tambahan: dokumentasi PostgreSQL, latihan Kaggle / dataset internal.
