# SQL & PostgreSQL — Pengantar untuk Data Analyst

## Agenda
- Apa itu database dan RDBMS?  
- Apa itu SQL dan mengapa perlu dipelajari?  
- Jenis-jenis SQL commands (DDL, DML, DCL, TCL, DQL)  
- Contoh SQL query sederhana  
- Mengenal PostgreSQL (keunggulan & penggunaan)  
- Tipe data umum di PostgreSQL  
- Membuat database dan tabel (CREATE / DROP)  
- Memanipulasi data dan struktur tabel (INSERT, UPDATE, DELETE, ALTER)  
- Membuat tabel dari file eksternal / praktik dasar  
- Mini task: bangun database kecil untuk toko online

---

## Database & RDBMS — Inti singkat
- Database: kumpulan data yang terorganisir (contoh: data buku perpustakaan, rekening bank).  
- DBMS (Database Management System): software untuk menyimpan, mengelola, dan memanipulasi data (contoh: PostgreSQL, MySQL, MS SQL Server, Oracle).  
- Relational DB: data disimpan dalam tabel; tabel saling berrelasi via kunci (schema).

---

## SQL — apa dan kenapa
- SQL = Structured Query Language — bahasa standar untuk berkomunikasi dengan RDBMS.  
- Dengan SQL kita bisa: membuat DB/tabel, memasukkan data, mengubah data, menghapus data, dan mengambil data (query).  
- Walau sintaks dasar sama, tiap RDBMS bisa punya ekstensi tersendiri.

Contoh sederhana:
SELECT nama_konsumen, alamat FROM tabel_konsumen WHERE deposit = 50000;

---

## Kategori Command SQL
- DDL (Data Definition Language): mengubah struktur DB/tabel  
  - CREATE, ALTER, DROP, TRUNCATE  
- DML (Data Manipulation Language): mengubah isi data  
  - INSERT, UPDATE, DELETE  
- DCL (Data Control Language): mengatur hak akses  
  - GRANT, REVOKE  
- TCL (Transaction Control Language): kelola transaksi  
  - COMMIT, ROLLBACK, SAVEPOINT  
- DQL (Data Query Language): mengambil data  
  - SELECT

---

## Contoh Query Dasar
- SELECT:
  SELECT col1, col2 FROM table WHERE condition ORDER BY col1 DESC LIMIT 10;
- INSERT:
  INSERT INTO orders (id, customer, total) VALUES (1, 'Budi', 150000);
- UPDATE:
  UPDATE orders SET status = 'shipped' WHERE id = 1;
- DELETE:
  DELETE FROM orders WHERE created_at < '2023-01-01';

---

## Mengenal PostgreSQL (singkat)
- Open-source RDBMS, matang, banyak digunakan di industri.  
- Keunggulan: gratis, stabil, scalable, dokumentasi lengkap, komunitas besar.  
- Cocok untuk keahlian jangka panjang (future-proof).

Tips: latihan gunakan psql (CLI) atau GUI seperti pgAdmin / DBeaver.

---

## Tipe Data Umum di PostgreSQL
- INT / INTEGER — bilangan bulat  
- BIGINT — bilangan bulat lebih besar  
- REAL / FLOAT / DOUBLE PRECISION — bilangan riil  
- SERIAL — pseudo-type integer auto-increment  
- BOOLEAN — TRUE / FALSE  
- DATE — tanggal (YYYY-MM-DD)  
- TIMESTAMP — tanggal + waktu  
- CHAR(n) — fixed-length string  
- VARCHAR(n) — variable-length string  
- TEXT — teks panjang tanpa batas praktis

---

## Membuat & Menghapus Database
- Membuat database:
  CREATE DATABASE nama_database;
- Menghapus database:
  DROP DATABASE nama_database;

Di pgAdmin: klik kanan → Create → Database...

---

## Membuat & Menghapus Tabel
- Membuat tabel:
  CREATE TABLE nama_tabel (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(100),
    qty INT,
    price NUMERIC(12,2),
    created_at TIMESTAMP DEFAULT NOW()
  );
- Menghapus tabel:
  DROP TABLE nama_tabel;

---

## Memanipulasi Data (DML)
- INSERT (menambah baris):
  INSERT INTO produk (nama, qty, price) VALUES ('Pena', 100, 2500.00);
- UPDATE (mengubah baris):
  UPDATE produk SET price = price * 1.1 WHERE kategori = 'Alat Tulis';
- DELETE (menghapus baris):
  DELETE FROM produk WHERE id = 10;

---

## Mengubah Struktur Tabel (ALTER)
- Tambah kolom:
  ALTER TABLE orders ADD COLUMN note TEXT;
- Hapus kolom:
  ALTER TABLE orders DROP COLUMN note;
- Ubah tipe kolom:
  ALTER TABLE orders ALTER COLUMN total TYPE NUMERIC(14,2);

---

## Membuat Tabel dari File Eksternal (praktik)
- Cara umum: load CSV ke PostgreSQL via:
  - COPY (server-side) — butuh akses filesystem server:
    COPY orders (col1,col2,...) FROM '/path/to/file.csv' WITH (FORMAT csv, HEADER true);
  - \copy (psql client) — client-side:
    \copy orders(col1,col2,...) FROM '/local/path/file.csv' WITH (FORMAT csv, HEADER true);
  - Tools GUI (pgAdmin / DBeaver) menyediakan import CSV wizard.
- Pastikan tipe kolom cocok dengan nilai pada CSV, dan periksa delimiter / encoding.

---

## Tips Praktik & Troubleshooting
- Gunakan transaksi saat melakukan perubahan massal: BEGIN; ...; COMMIT; (jika error, ROLLBACK).  
- Cek constraints (NOT NULL, UNIQUE, FK) agar data konsisten.  
- Gunakan EXPLAIN untuk memahami rencana eksekusi query saat optimasi.  
- Backup DB secara berkala.

---

## Mini Task — Projek kecil (Tokopaedi)
Konteks: Anda di-hire sebagai Data Analyst untuk Tokopaedi. Bangun DB awal untuk operasional order.

Tugas:
1. Buat database bernama `tokopaedi`.  
   - CREATE DATABASE tokopaedi;
2. Buat tabel `orders` dengan kolom berikut (tentukan tipe yang cocok):
   - order_id (unik)  
   - order_date  
   - customer_id  
   - customer_name  
   - item_id  
   - item_name  
   - quantity  
   - unit_price  
   - total_price  
   - status (contoh: pending, shipped, canceled)  
   - shipping_address  
   - shipping_method  
   - city  
   - postal_code  
   - note (optional)

(Tip: gunakan SERIAL atau BIGINT untuk order_id; NUMERIC/DECIMAL untuk harga; DATE/TIMESTAMP untuk order_date)

3. Masukkan 5 contoh baris data menggunakan INSERT.  
4. Query contoh:
   - Tampilkan 10 order terakhir: SELECT * FROM orders ORDER BY order_date DESC LIMIT 10;  
   - Hitung total penjualan per kota: SELECT city, SUM(total_price) FROM orders GROUP BY city ORDER BY SUM(total_price) DESC;  
   - Temukan order dengan total_price > 1.000.000: SELECT * FROM orders WHERE total_price > 1000000;

5. (Bonus) Import contoh CSV orders ke tabel `orders` menggunakan \copy atau import wizard di GUI.

Catatan instalasi (binary path untuk tools seperti pgAdmin)
- Jika perlu mengatur binary path (pgAdmin / client tools):  
  1. File → Preferences  
  2. Cari “Binary paths”  
  3. Isi path ke folder instalasi PostgreSQL (Windows contohnya):  
     C:\Program Files\PostgreSQL\<versi>\bin

---

## Referensi & Next Steps
- Dokumentasi PostgreSQL: https://www.postgresql.org/docs/  
- Tutorial SQL dasar (SELECT, JOIN, GROUP BY, window functions) — lanjut ke modul berikutnya.  
- Latihan disarankan: buat schema sederhana dan kerjakan kueri untuk menjawab pertanyaan bisnis (penjualan per hari, produk top-selling, retention sederhana).
