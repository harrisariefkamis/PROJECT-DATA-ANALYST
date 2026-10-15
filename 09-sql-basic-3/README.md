# SQL Basic 3 — DISTINCT, BETWEEN, INSERT, DELETE, ORDER BY, LIMIT, Alias & Careers

## Agenda
- Tips: How to win in the data job market (porto, network, differentiation)
- SELECT DISTINCT
- BETWEEN ... AND
- INSERT INTO (2 cara)
- DELETE FROM (hapus data)
- ORDER BY ASC / DESC
- LIMIT
- Prefix (table.) dan Alias (AS)
- Mini Task (soal) + contoh jawaban

---

## How to win in Data job market (ringkas)
1. Banyak kandidat menawarkan hal yang sama (fresh grads). Sertifikat membantu, tapi bukan pembeda utama.
2. Jangan menawarkan hal yang sama dengan orang lain — cari nilai tambah unik.
3. Lakukan hal yang jarang orang mau lakukan — selesaikan pain point nyata.
4. Mulai seleksi job market sejak belajar:
   - Bangun portfolio: tugas bootcamp, dataset publik (Kaggle, data.world), project pribadi.
   - Kembangkan kemampuan yang relevan.
   - Bangun citra (network & personal brand): bukan sekadar kenal banyak orang, tapi bagaimana image Anda di mata orang lain.

---

## SELECT DISTINCT
Menampilkan nilai unik pada kolom tertentu:
```sql
SELECT DISTINCT city
FROM orders;
```
Jika data: LA, LA, Henderson → hasil: LA, Henderson.

---

## BETWEEN ... AND
Menyaring nilai pada rentang (inklusif):
```sql
SELECT *
FROM orders
WHERE sales BETWEEN 100 AND 200;
```
Ekivalen dengan: sales >= 100 AND sales <= 200.

---

## INSERT INTO
1) Insert dengan mengisi seluruh kolom (sesuai urutan tabel):
```sql
INSERT INTO table_name
VALUES
(row1_col1, row1_col2, ...),
(row2_col1, row2_col2, ...);
```
2) Insert dengan menyebut kolom tertentu:
```sql
INSERT INTO orders (order_id, customer_id, order_date, total_price)
VALUES
('O0001','C001','2018-01-10', 150.00);
```
Gunakan cara kedua untuk lebih aman dan jelas.

---

## DELETE FROM
1) Hapus semua baris tabel:
```sql
DELETE FROM table_name;
```
2) Hapus baris berdasarkan kondisi:
```sql
DELETE FROM orders
WHERE order_date < '2010-01-01';
```
Hati-hati: operasi DELETE tidak mudah dikembalikan kecuali Anda menggunakan transaksi (BEGIN/ROLLBACK/COMMIT) atau backup.

---

## ORDER BY
Mengurutkan hasil query:
```sql
SELECT * FROM orders
ORDER BY sales ASC;   -- menaik

SELECT * FROM orders
ORDER BY sales DESC;  -- menurun

SELECT * FROM orders
ORDER BY region ASC, sales DESC; -- multi-level
```

---

## LIMIT
Membatasi jumlah baris hasil:
```sql
SELECT * FROM orders
ORDER BY order_date DESC
LIMIT 10;  -- 10 baris terbaru
```

---

## Prefix dan Alias (AS)
- Prefix: gunakan `table_name.column` untuk membedakan kolom saat JOIN atau ketika kolom identik di banyak tabel.
- Alias: mengganti nama kolom atau tabel sementara di hasil query:
```sql
SELECT o.order_id AS id, o.customer_name AS nama
FROM orders o
WHERE o.city = 'Los Angeles';
```
Alias `o` untuk `orders` mempersingkat penulisan.

---

## Mini Task
1) Query transaksi yang merugikan saja (profit < 0) yang terjadi di tahun 2018 hingga 2019 di kota Los Angeles, diurutkan dari kerugian terbesar.
2) Query transaksi yang untung saja (profit > 0) yang terjadi pada Q1 2018 di kota Henderson, diurutkan dari keuntungan terbesar.

### Contoh jawaban
1)
```sql
SELECT order_id, order_date, customer_name, city, profit
FROM orders
WHERE city = 'Los Angeles'
  AND profit < 0
  AND EXTRACT(YEAR FROM order_date) BETWEEN 2018 AND 2019
ORDER BY profit ASC; -- kerugian terbesar (nilai negative paling kecil)
```
Catatan: ORDER BY profit ASC akan menampilkan nilai profit negatif yang paling kecil (mis. -1000) di atas; jika ingin menampilkan dari kerugian terbesar ke paling kecil (absolut), gunakan ORDER BY ABS(profit) DESC.

2)
```sql
SELECT order_id, order_date, customer_name, city, profit
FROM orders
WHERE city = 'Henderson'
  AND profit > 0
  AND order_date >= '2018-01-01' AND order_date < '2018-04-01'
ORDER BY profit DESC; -- keuntungan terbesar dulu
```
Atau menggunakan EXTRACT:
```sql
AND EXTRACT(YEAR FROM order_date) = 2018
AND EXTRACT(QUARTER FROM order_date) = 1
```

---

## Tips praktis
- Saat menelusuri nilai waktu, pastikan kolom `order_date` bertipe DATE/TIMESTAMP.
- Untuk performa pada dataset besar, gunakan index di kolom yang sering dipakai di WHERE / JOIN.
- Untuk operasi mass-delete atau update, gunakan transaksi: BEGIN; DELETE ...; SELECT ...; COMMIT; atau ROLLBACK jika perlu.

---

## Next steps
- Modul selanjutnya: SQL Basic 4 — JOINs dan Multi-table Analysis (GROUP BY, agregasi, HAVING, window functions).
- Latihan disarankan: buat query top-N produk per region, analisis cohort sederhana, dan hitung conversion funnel.
