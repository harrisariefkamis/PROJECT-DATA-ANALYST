# SQL Basic 4 — Practice Questions

## Soal latihan
1. Hitung total sales per region dan urutkan dari terbesar.
2. Tampilkan total order dan total profit per segment.
3. Tampilkan customer dengan total sales > 100000 di tahun 2018.
4. Tampilkan kategori dengan total sales tertinggi di kota Los Angeles.
5. Tampilkan region dengan rata-rata profit positif dan jumlah order > 200.
6. Tampilkan customer yang melakukan transaksi di kota California atau New York dengan segment Consumer.
7. Tampilkan 10 order dengan profit tertinggi di 2018.
8. Ambil customer yang pernah melakukan transaksi di kota Houston tetapi tidak pernah di Los Angeles.

## Jawaban singkat
```sql
-- 1
SELECT region, SUM(sales) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- 2
SELECT c.segment, COUNT(o.order_id) AS total_orders, SUM(o.profit) AS total_profit
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.segment
ORDER BY total_profit DESC;

-- 3
SELECT c.customer_id, c.customer_name, SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE EXTRACT(YEAR FROM o.order_date) = 2018
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.sales) > 100000
ORDER BY total_sales DESC;

-- 4
SELECT category, SUM(sales) AS total_sales
FROM orders
WHERE city = 'Los Angeles'
GROUP BY category
ORDER BY total_sales DESC;

-- 5
SELECT region, AVG(profit) AS avg_profit, COUNT(order_id) AS total_orders
FROM orders
GROUP BY region
HAVING AVG(profit) > 0 AND COUNT(order_id) > 200
ORDER BY avg_profit DESC;

-- 6
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.segment = 'Consumer'
  AND o.city IN ('California', 'New York');

-- 7
SELECT order_id, customer_name, profit
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2018
ORDER BY profit DESC
LIMIT 10;

-- 8
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.city = 'Houston'
AND c.customer_id NOT IN (
  SELECT DISTINCT customer_id
  FROM orders
  WHERE city = 'Los Angeles'
);
```

