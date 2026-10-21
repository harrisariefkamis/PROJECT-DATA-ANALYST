![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?labelColor=2D3748&logo=mysql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-4169E1?labelColor=2C3E50&logo=postgresql&logoColor=white)
![DBeaver](https://img.shields.io/badge/DBeaver-Client-382923?labelColor=5A3A22&logo=dbeaver&logoColor=white)
# SQL Basic 4 — Slide Ringkas

## Join & Aggregation
- JOIN: gabungkan tabel berdasarkan kolom relasi
- INNER JOIN: hanya data cocok di kedua tabel
- LEFT JOIN: semua data kiri tetap ditampilkan
- RIGHT JOIN: semua data kanan tetap ditampilkan
- FULL JOIN: semua data dari kedua sisi tetap ditampilkan

## GROUP BY
```sql
SELECT city, COUNT(*) AS total_orders
FROM orders
GROUP BY city;
```

## HAVING
```sql
SELECT city, COUNT(*) AS total_orders
FROM orders
GROUP BY city
HAVING COUNT(*) > 100;
```

## Subquery
```sql
SELECT *
FROM orders
WHERE customer_id IN (
  SELECT customer_id
  FROM customers
  WHERE segment = 'Consumer'
);
```

## Core Takeaway
- JOIN untuk menggabungkan tabel
- GROUP BY untuk ringkasan per kelompok
- HAVING untuk filter hasil agregasi
- Subquery membantu memecah masalah kompleks menjadi step-step yang lebih sederhana

## Mini task
Buat query untuk menghitung:
- total sales per region
- total order dan total profit per segment
- category dengan sales tertinggi di kota Los Angeles
