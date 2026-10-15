# SQL for Data Analysis 2 — Subquery, CTE (WITH), JOIN lanjutan, dan Timestamp

## Agenda
- Review: JOIN singkat (INNER / LEFT / RIGHT / FULL)  
- Subquery: lokasi (WHERE, FROM, SELECT) dan contoh penggunaan  
- Mengorganisasi subquery dengan WITH (CTE) dan alias  
- Subquery dalam klausa FROM dan harus memiliki alias  
- Bekerja dengan timestamp: CURRENT_TIME, CURRENT_DATE, NOW(), AGE(), DATE_PART()  
- Q&A / latihan singkat

---

## JOIN — refresher singkat
- INNER JOIN: hanya baris yang cocok di kedua tabel.  
- LEFT JOIN: semua baris dari tabel kiri, nilai tabel kanan NULL bila tidak ada kecocokan.  
- RIGHT JOIN: semua baris dari tabel kanan.  
- FULL OUTER JOIN: gabungan semua baris dari kiri & kanan.

Contoh singkat:
```sql
SELECT o.order_id, c.customer_name, o.sales
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;
```

---

## Apa itu Subquery?
Subquery adalah query yang tertanam di dalam query lain. Subquery membantu memecah masalah kompleks menjadi langkah lebih kecil. Subquery bisa berada di:
- klausa WHERE (untuk filter berbasis hasil query lain)  
- klausa FROM (sebagai "tabel" sementara) — wajib beri alias  
- klausa SELECT (untuk menghitung nilai per baris)

Semua subquery ditempatkan di dalam tanda kurung.

---

## Subquery di klausa WHERE / HAVING
Contoh: temukan konsumen pada segment 'Consumer' dengan total sales lebih besar dari rata-rata total sales konsumen segmen 'Consumer' lainnya.

Langkah:  
1) Hitung total sales per customer (subquery)  
2) Bandingkan dengan rata-rata total sales per customer di segmen Consumer (subquery lain)  

Contoh:
```sql
SELECT customer_id, customer_name, SUM(sales) AS total_sales
FROM orders
WHERE segment = 'Consumer'
GROUP BY customer_id, customer_name
HAVING SUM(sales) > (
  SELECT AVG(sub.total_sales) FROM (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    WHERE segment = 'Consumer'
    GROUP BY customer_id
  ) sub
);
```

Catatan: subquery di HAVING/WHERE seringkali menghasilkan proses yang lebih lambat; pertimbangkan CTE untuk keterbacaan.

---

## Subquery di klausa FROM (tabel sementara)
Subquery di FROM menghasilkan "tabel sementara" sehingga Anda dapat mengolahnya layaknya tabel biasa. Subquery ini harus diberi alias.

Contoh: buat tabel sementara berisi nama konsumen, segment, dan total penjualan per customer, lalu tampilkan hanya konsumen dari segment Consumer.
```sql
SELECT t.customer_id, t.customer_name, t.total_sales
FROM (
  SELECT customer_id, customer_name, segment, SUM(sales) AS total_sales
  FROM orders
  GROUP BY customer_id, customer_name, segment
) t
WHERE t.segment = 'Consumer'
ORDER BY t.total_sales DESC;
```

---

## WITH — Common Table Expression (CTE)
CTE (WITH) membantu menata subquery menjadi blok bernama yang lebih mudah dibaca dan digunakan berulang. Struktur:
```sql
WITH total_per_customer AS (
  SELECT customer_id, customer_name, SUM(sales) AS total_sales
  FROM orders
  GROUP BY customer_id, customer_name
),
avg_consumer AS (
  SELECT AVG(total_sales) AS avg_sales
  FROM total_per_customer t
  JOIN customers c ON t.customer_id = c.customer_id
  WHERE c.segment = 'Consumer'
)
SELECT t.customer_id, t.customer_name, t.total_sales
FROM total_per_customer t
JOIN customers c ON t.customer_id = c.customer_id
JOIN avg_consumer a ON 1=1
WHERE c.segment = 'Consumer' AND t.total_sales > a.avg_sales
ORDER BY t.total_sales DESC;
```

Keuntungan CTE:
- Meningkatkan keterbacaan
- Mempermudah debugging dan pembagian logika
- Dapat digunakan kembali dalam query utama

---

## Subquery di klausa SELECT
Subquery di SELECT biasanya digunakan untuk menghitung nilai per baris relatif terhadap data lain.
Contoh: hitung total sales customer pada kolom tambahan setiap baris:
```sql
SELECT o.order_id,
       o.customer_id,
       o.order_date,
       (
         SELECT SUM(sales)
         FROM orders o2
         WHERE o2.customer_id = o.customer_id
       ) AS customer_total_sales
FROM orders o
LIMIT 50;
```

Perlu hati-hati: subquery di SELECT bisa mahal jika dijalankan per baris untuk dataset besar.

---

## Bekerja dengan Timestamp & Date functions
- CURRENT_TIME: menampilkan jam sekarang (time)  
- CURRENT_DATE: menampilkan tanggal hari ini  
- NOW(): menampilkan timestamp (date + time) dengan timezone  
- AGE(timestamp) / AGE(ts1, ts2): menghitung interval antara dua tanggal  
- DATE_PART(field, source): mengeluarkan bagian tanggal (year, month, day, hour, minute)

Contoh:
```sql
SELECT CURRENT_DATE, CURRENT_TIME, NOW();

SELECT AGE(NOW(), order_date) AS age_since_order
FROM orders
LIMIT 10;

SELECT EXTRACT(YEAR FROM order_date) AS year,
       EXTRACT(QUARTER FROM order_date) AS quarter
FROM orders
LIMIT 10;
```

---

## Performance notes & tips
- Subquery correlated (mengacu ke outer query) dapat menyebabkan query berjalan lambat. Pertimbangkan JOIN atau CTE.  
- Gunakan indeks di kolom yang sering dipakai di JOIN / WHERE untuk meningkatkan performa.  
- Untuk analisis window/temporal besar, pertimbangkan materialized views atau pre-aggregated tables.

---

## Exercises / Mini Tasks
1. Tulis query menggunakan WITH (CTE) untuk membuat tabel sementara `cust_sales` yang berisi `customer_id`, `customer_name`, dan `total_sales`. Gunakan CTE kedua untuk menghitung rata-rata `total_sales` untuk segmen 'Consumer', lalu tampilkan customer Consumer yang total_sales > rata-rata.

2. Buat subquery di SELECT: untuk setiap order, tampilkan `order_id`, `customer_id`, `sales`, dan `customer_total_sales` (total sales per customer). Batasi hasil ke 50 baris.

3. Tampilkan daftar customer yang melakukan transaksi lebih dari N kali pada tahun 2018 (N parameter). Gunakan subquery di FROM atau CTE untuk menghitung frekuensi per customer lalu filter.

4. Tunjukkan contoh penggunaan AGE() untuk menghitung berapa hari sejak setiap order, lalu ambil 10 order yang paling lama usia hari nya.

---

## Referensi singkat
- PostgreSQL documentation: https://www.postgresql.org/docs/  
- Articles: subquery vs join performance, CTE usage patterns

