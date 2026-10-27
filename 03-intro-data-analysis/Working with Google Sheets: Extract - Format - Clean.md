# Working with Google Sheets: Extract - Format - Clean

![Google Sheets](https://img.shields.io/badge/Google%20Sheets-Advanced-34A853?labelColor=1E293B&logo=googlesheets&logoColor=white)
![Problem Solving](https://img.shields.io/badge/Problem%20Solving-Framework-F59E0B?labelColor=1E293B&logo=target&logoColor=white)
![Statistics](https://img.shields.io/badge/Statistics-Expert-8B5CF6?labelColor=1E293B&logo=scipy&logoColor=white)
![EDA](https://img.shields.io/badge/EDA-Exploratory-EC4899?labelColor=1E293B&logo=plotly&logoColor=white)

![Level](https://img.shields.io/badge/Level-Pemula-34D399?labelColor=1E293B)
![Topik](https://img.shields.io/badge/Topik-Extract%20%7C%20Format%20%7C%20Clean-3B82F6?labelColor=1E293B)
![Tools](https://img.shields.io/badge/Tools-Google%20Sheets-34A853?labelColor=1E293B&logo=googlesheets&logoColor=white)
![Mini Task](https://img.shields.io/badge/Mini%20Task-7%20Soal-F97316?labelColor=1E293B)

> **Modul:** Working with Google Sheets
> **Topik:** Extract, Format, Clean
> **Sumber materi dan contoh:** [Google Drive folder modul](https://drive.google.com/drive/folders/1raajBQWs8L-hdCAK0Q-pWWoAZi_gYQLy?usp=sharing)

## Daftar Isi

- [Agenda](#agenda)
- [1. Data Extraction](#1-data-extraction)
- [2. Data Formatting](#2-data-formatting)
- [3. Duplicate Data](#3-duplicate-data)
- [4. Data Validation](#4-data-validation)
- [Mini Task](#mini-task)
- [Kesimpulan](#kesimpulan)
- [Referensi dan Sumber](#referensi-dan-sumber)

---

## Agenda

1. **Data Extraction**
   - Import data from CSV
   - Import data from another sheets
2. **Data Formatting**
   - Number Format
   - Text Format
   - Date Format
   - Conditional Formatting
3. **Handling Duplicate Data**
   - Various case of duplicate data
   - Handling duplicate data
4. **Data Validation**
   - What is data validation
   - Creating validation settings

---

## 1. Data Extraction

### 1.1 Import CSV dari file eksternal (GUI)

1. Klik **File → Import**.
2. Jika file ada di Google Drive, pilih tab **My Drive** lalu pilih file `.csv`.
3. Jika file ada di perangkat lokal, pilih **Upload → Browse** lalu pilih file `.csv`.

Setelah memilih file CSV, akan muncul opsi **Import location**:

| Opsi | Fungsi |
|---|---|
| Create new spreadsheet | Membuat spreadsheet baru |
| Insert new sheet(s) | Menambahkan sheet baru pada spreadsheet yang sedang aktif |
| Replace spreadsheet | Menggantikan spreadsheet yang sedang aktif |
| Replace current sheet | Menggantikan sheet aktif |
| Append to current sheet | Menambahkan data ke sheet aktif |
| Replace data at selected cell | Menggantikan data pada cell yang ditandai |

### 1.2 Import CSV dengan `IMPORTDATA`

```text
=IMPORTDATA("link_file_csv")
```

- Format yang didukung adalah `.csv` (comma-separated) dan `.tsv` (tab-separated).
- URL harus lengkap dengan protokol (`http://` atau `https://`) dan diapit tanda kutip, atau berupa referensi ke cell yang berisi URL.
- Data hasil `IMPORTDATA` bersifat **linked**. Jika ingin mengubah datanya, gunakan **Copy → Paste special → Values only**.

### 1.3 Import dari spreadsheet lain dengan `IMPORTRANGE`

```text
=IMPORTRANGE("url_spreadsheet", "range_data")
```

Contoh:

```text
=IMPORTRANGE("https://docs.google.com/spreadsheets/...", "Sheet1!A1:F100")
```

- Pertama kali menarik data dari spreadsheet sumber yang baru, Google Sheets akan meminta izin akses. Klik **Allow access**.
- Data dari `IMPORTRANGE` juga bersifat **linked**. Untuk mengubahnya, gunakan **Copy → Paste special → Values only**.
- Hindari rantai atau siklus `IMPORTRANGE` antar spreadsheet karena bisa memperlambat sheet.

---

## 2. Data Formatting

### 2.1 Number Formatting

Quick formatting yang tersedia:

- Currency
- Percentage
- Number with decimal
- Custom number format

Cara:

1. Pilih cell atau range.
2. Pilih **Format → Number**.
3. Atur format yang diinginkan.

> Untuk mengubah simbol mata uang dari default `$` menjadi Rupiah atau lainnya, gunakan **Custom currency**.

### 2.2 Date & Time Formatting

- Default date format
- Time format
- Custom date and time

Cara: pilih range tanggal, lalu **Format → Number → Date / Time / Custom date and time**.

### 2.3 Text Formatting

| Fungsi | Kegunaan |
|---|---|
| `=LOWER()` | Huruf kecil |
| `=UPPER()` | Huruf besar |
| `=PROPER()` | Huruf kapital di awal tiap kata |
| `=CONCATENATE()` | Menggabungkan teks |
| `=JOIN()` | Menggabungkan teks dengan delimiter |
| `=LEFT()` | Mengambil teks dari kiri |
| `=RIGHT()` | Mengambil teks dari kanan |
| `=TRIM()` | Menghapus spasi berlebih |

### 2.4 Conditional Formatting

Digunakan untuk mewarnai cell berdasarkan kondisi tertentu.

**Tujuan:**

- Memudahkan user menemukan data tertentu
- Membantu melihat outlier, value negatif, atau pattern tertentu

**Langkah:**

1. Pilih range.
2. Klik **Format → Conditional formatting**.
3. Masukkan rule, misalnya:
   - `cell < 0` → merah
   - `text contains "A"` → biru
4. Atur styling, lalu klik **Done**.

**Catatan:**

- Rule dievaluasi sesuai urutan di daftar. Rule pertama yang bernilai benar menentukan format cell.
- Selain rule bawaan, tersedia opsi **Custom formula** untuk kondisi yang lebih kompleks.

---

## 3. Duplicate Data

### Pandangan umum

Duplikat data terjadi ketika baris data memiliki nilai yang sama di satu atau beberapa kolom.

### Langkah menghapus duplikat

1. Pilih range tabel.
2. Klik **Data → Data cleanup → Remove duplicates**.
3. Centang **Data has header row** jika tabel memiliki header.
4. Pilih kolom yang akan diperiksa.
5. Klik **Remove duplicates**. Google Sheets mempertahankan baris paling atas dan menghapus duplikat lainnya.

**Catatan:**

- Lakukan **backup data** sebelum menghapus.
- Jika duplikat bersifat parsial, pilih kombinasi kolom yang relevan.
- Sheets menganggap cell dengan nilai identik tetapi beda huruf besar/kecil, format, atau formula sebagai duplikat.
- Jalankan **Data → Data cleanup → Trim whitespace** terlebih dahulu agar spasi tak terlihat tidak menyembunyikan duplikat.

---

## 4. Data Validation

Berfungsi untuk meminimalkan input yang tidak konsisten.

**Cara:**

1. Pilih range cell.
2. Klik **Data → Data validation → Add rule**.
3. Pilih **Criteria** (misalnya Dropdown).
4. Atur rule sesuai kebutuhan.
5. Gunakan **Advanced options** untuk:
   - menolak input yang salah (**Reject input**)
   - menampilkan peringatan (**Show a warning**)
   - menampilkan help text
   - mengatur display style

**Contoh:** kolom `Segment` hanya boleh berisi:

- Corporate
- Consumer
- Home Office

---

## Mini Task

Gunakan dataset **Superstore** (raw data tersedia di folder Google Drive modul).

- [ ] 1. Buat worksheet baru lalu extract data raw superstore ke sheet.
- [ ] 2. Ubah format kolom `Discount` menjadi **percentage**.
- [ ] 3. Ubah format kolom `Sales` dan `Profit` menjadi **currency** (dollar, 2 angka di belakang koma).
- [ ] 4. Pada kolom `Profit`, tandai profit yang negatif dengan **warna merah**.
- [ ] 5. Ubah data pada kolom `Ship_Mode` sampai `Region` menjadi **Proper Case**.
- [ ] 6. Periksa apakah data memiliki **duplikat**.
- [ ] 7. Pada kolom `Segment`, terapkan **data validation** agar hanya menerima `Corporate`, `Consumer`, dan `Home Office`.

> Tips soal 5: gunakan `=PROPER()` di kolom bantu, lalu salin hasilnya dengan **Paste special → Values only** ke kolom asal.

---

## Kesimpulan

- Google Sheets memudahkan eksekusi proses analisis data secara cepat dan rapi.
- Manajemen data yang baik dimulai dari **extract, format, clean, dan validation**.
- Dengan teknik yang benar, dataset akan lebih siap dipakai untuk analisis dan dashboard.

---

## Referensi dan Sumber

### Sumber materi modul

- [Google Drive folder: materi dan contoh](https://drive.google.com/drive/folders/1raajBQWs8L-hdCAK0Q-pWWoAZi_gYQLy?usp=sharing)

### Dokumentasi resmi Google (Docs Editors Help)

| Topik | Link |
|---|---|
| IMPORTDATA | [support.google.com/docs/answer/3093335](https://support.google.com/docs/answer/3093335) |
| IMPORTRANGE | [support.google.com/docs/answer/3093340](https://support.google.com/docs/answer/3093340) |
| Conditional formatting | [support.google.com/docs/answer/78413](https://support.google.com/docs/answer/78413) |
| Remove duplicates, trim whitespace, split text | [support.google.com/docs/answer/6325535](https://support.google.com/docs/answer/6325535) |
| Data validation / dropdown | [support.google.com/docs/answer/186103](https://support.google.com/docs/answer/186103) |
| Daftar fungsi Google Sheets (LOWER, UPPER, PROPER, TRIM, dll.) | [support.google.com/docs/table/25273](https://support.google.com/docs/table/25273) |

### Dataset latihan

- [Superstore dataset di Kaggle](https://www.kaggle.com/search?q=superstore): cari "Superstore" untuk dataset sejenis jika perlu data tambahan.

### Belajar lanjutan

- [Kaggle Learn](https://www.kaggle.com/learn)
- [PROJECT-DATA-ANALYST (roadmap utama)](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST)

> Link dokumentasi Google (lima baris pertama) sudah dicek lewat pencarian. Link daftar fungsi dan pencarian Kaggle ditulis dari ingatan, jadi cek ulang jika tidak terbuka.
