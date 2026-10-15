# SQL Basic 4 — JOIN, GROUP BY, HAVING, dan Multi-Table Analysis

## Agenda
- Review dasar SQL: SELECT, WHERE, ORDER BY, LIMIT, DISTINCT, INSERT, DELETE
- JOIN: INNER, LEFT, RIGHT, FULL
- GROUP BY & agregasi (COUNT, SUM, AVG, MIN, MAX)
- HAVING untuk filter agregat
- Subquery ringkas
- Studi kasus analisis bisnis multi-table
- Mini task dan latihan soal

---

## 1. Join — koneksi antar tabel
JOIN digunakan untuk menggabungkan dua atau lebih tabel berdasarkan kolom relasi. Bentuk umum:
```sql
SELECT a.col1, b.col2
FROM table_a a
JOIN table_b b
  ON a.id = b.id;
```

### INNER JOIN
Hanya menampilkan baris yang cocok di kedua tabel.
```sql
SELECT o.order_id, c.customer_name, o.sales
FROM orders o
INNER JOIN customers c
  ON o.customer_id = c.customer_id;
```

### LEFT JOIN
Semua baris dari tabel kiri tetap muncul, dan data yang tidak cocok di tabel kanan akan NULL.
```sql
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id;
```

### RIGHT JOIN
Semua baris dari tabel kanan tetap muncul.
```sql
SELECT c.customer_name, o.order_id
FROM customers c
RIGHT JOIN orders o
  ON c.customer_id = o.customer_id;
```

### FULL OUTER JOIN
Menampilkan semua data dari tabel kiri dan kanan, dengan NULL untuk yang tidak cocok.
```sql
SELECT c.customer_name, o.order_id
FROM customers c
FULL OUTER JOIN orders o
  ON c.customer_id = o.customer_id;
```

---

## 2. GROUP BY & Agregasi
Group By membagi hasil menjadi kelompok berdasarkan kolom tertentu, lalu kita bisa menghitung ringkasan untuk setiap kelompok.
```sql
SELECT city, COUNT(*) AS total_orders
FROM orders
GROUP BY city;
```

### Fungsi aggregasi umum
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

Contoh:
```sql
SELECT region, SUM(sales) AS total_sales, AVG(profit) AS avg_profit
FROM orders
GROUP BY region
ORDER BY total_sales DESC;
```

---

## 3. HAVING
HAVING digunakan untuk memfilter hasil agregasi setelah GROUP BY. Berbeda dengan WHERE yang memfilter rows sebelum agregasi.
```sql
SELECT city, COUNT(*) AS total_orders
FROM orders
GROUP BY city
HAVING COUNT(*) > 100
ORDER BY total_orders DESC;
```

---

## 4. Subquery (ringkas)
Subquery adalah query di dalam query.
```sql
SELECT *
FROM orders
WHERE customer_id IN (
  SELECT customer_id
  FROM customers
  WHERE segment = 'Consumer'
);
```

---

## 5. Studi kasus multi-table
### Kasus: Berapa total sales per segment?
```sql
SELECT c.segment, SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.segment
ORDER BY total_sales DESC;
```

### Kasus: produk apa yang paling banyak menjual per region?
```sql
SELECT o.region, o.category, SUM(o.sales) AS total_sales
FROM orders o
GROUP BY o.region, o.category
ORDER BY o.region, total_sales DESC;
```

---

## 6. Praktik cepat: kombinasi JOIN + GROUP BY
```sql
SELECT c.segment,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(o.sales) AS total_sales,
       AVG(o.profit) AS avg_profit
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.segment
ORDER BY total_sales DESC;
```

---

## 7. Mini task
Buat query untuk menjawab pertanyaan berikut:
1. Berapa total sales per region?  
2. Berapa banyak order dan total profit per segment?  
3. Tampilkan customer yang punya total sales > 100000 di tahun 2018.  
4. Tampilkan kategori dengan total sales tertinggi di kota Los Angeles.  

### Contoh jawaban
1)
```sql
SELECT region, SUM(sales) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;
```

2)
```sql
SELECT c.segment,
       COUNT(o.order_id) AS total_orders,
       SUM(o.profit) AS total_profit
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY c.segment
ORDER BY total_profit DESC;
```

3)
```sql
SELECT c.customer_id, c.customer_name, SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
WHERE EXTRACT(YEAR FROM o.order_date) = 2018
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.sales) > 100000
ORDER BY total_sales DESC;
```

4)
```sql
SELECT category, SUM(sales) AS total_sales
FROM orders
WHERE city = 'Los Angeles'
GROUP BY category
ORDER BY total_sales DESC;
```

---

## 8. Tips & best practice
- JOIN harus didasarkan pada kolom relasi yang konsisten dan kompatibel (mis. id).
- Gunakan alias tabel agar query lebih ringkas dan mudah dibaca.
- Untuk filter agregat, gunakan HAVING, bukan WHERE.
- Periksa NULL pada JOIN karena LEFT/RIGHT JOIN bisa menghasilkan NULL.

---

## 9. Next step
- Latihan lanjutan: window functions (ROW_NUMBER, RANK), CTE, dan case study bisnis.
- Setelah modul ini, lanjut ke SQL Advanced / Interview Cases.

