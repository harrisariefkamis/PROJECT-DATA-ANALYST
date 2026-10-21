![Google Sheets](https://img.shields.io/badge/Google%20Sheets-Advanced-34A853?labelColor=1E293B&logo=googlesheets&logoColor=white)
![Problem Solving](https://img.shields.io/badge/Problem%20Solving-Framework-F59E0B?labelColor=1E293B&logo=target&logoColor=white)
![Statistics](https://img.shields.io/badge/Statistics-Expert-8B5CF6?labelColor=1E293B&logo=scipy&logoColor=white)
![EDA](https://img.shields.io/badge/EDA-Exploratory-EC4899?labelColor=1E293B&logo=plotly&logoColor=white)
# Working with Google Sheets: Extract - Format - Clean

## Modul: Working with Google Sheets
Topik: Extract — Format — Clean

Sumber materi dan contoh:
https://drive.google.com/drive/folders/1raajBQWs8L-hdCAK0Q-pWWoAZi_gYQLy?usp=sharing

## Agenda
1. Data Extraction
   - Import data from CSV
   - Import data from another sheets
2. Data Formatting
   - Number Format
   - Text Format
   - Date Format
   - Conditional Formatting
3. Handling Duplicate Data
   - Various case of duplicate data
   - Handling duplicate data
4. Data Validation
   - What is data validation
   - Creating validation settings

---

## Data Extraction

### Data Extraction from External CSV file (GUI Method)
1. Klik File → Import
2. Jika file berada di Google Drive, pilih tab My Drive lalu file .csv
3. Jika file disimpan di perangkat lokal, pilih Upload → Browse lalu pilih file .csv

Setelah memilih file CSV, akan muncul opsi:
1. Create new spreadsheet → membuat spreadsheet baru
2. Insert new sheets → menambahkan sheet baru pada spreadsheet yang sedang aktif
3. Replace spreadsheet → menggantikan spreadsheet yang sedang aktif
4. Replace current sheet → menggantikan sheet aktif
5. Append to current sheet → menambahkan data ke sheet aktif
6. Replace data at selected cell → menggantikan data pada cell yang ditandai

### Data Extraction from External CSV file (IMPORTDATA)
Selain import melalui GUI, juga bisa menggunakan formula:
=IMPORTDATA("link_file_csv")

Catatan:
- Data yang diekstrak dari IMPORTDATA bersifat linked
- Jika ingin mengubah data hasil import, gunakan Copy → Paste values only

### Data Extraction from Another Sheets (IMPORTRANGE)
Kita juga dapat mengambil data dari spreadsheet lain dengan:
=IMPORTRANGE("url_spreadsheet", "range_data")

Contoh:
=IMPORTRANGE("https://docs.google.com/spreadsheets/...", "Sheet1!A1:F100")

Catatan:
- Data dari IMPORTRANGE juga bersifat linked
- Untuk mengubahnya, gunakan Copy → Paste values only

---

## Data Formatting

### Number Formatting
Google Sheets menyediakan quick formatting:
- Currency
- Percentage
- Number with decimal
- Custom number format

Cara:
- Pilih cell atau range
- Pilih Format → Number
- Atur format yang diinginkan

Catatan:
- Untuk mengubah simbol mata uang dari default $ menjadi Rupiah atau lainnya, gunakan Custom currency

### Date & Time Formatting
Google Sheets juga mendukung:
- Default date format
- Time format
- Custom date and time

Cara:
- Pilih range tanggal
- Pilih Format → Number → Date / Time / Custom date & time

### Text Formatting
Fungsi yang sering dipakai:
- =LOWER() → huruf kecil
- =UPPER() → huruf besar
- =PROPER() → huruf kapital di awal tiap kata
- =CONCATENATE() → menggabungkan teks
- =JOIN() → menggabungkan text dengan delimiter
- =LEFT() → mengambil teks dari kiri
- =RIGHT() → mengambil teks dari kanan
- =TRIM() → menghapus spasi berlebih

### Conditional Formatting
Conditional formatting digunakan untuk mewarnai cell berdasarkan kondisi tertentu.

Tujuan:
- Memudahkan user menemukan data tertentu
- Membantu melihat outlier, value negatif, atau pattern tertentu

Langkah:
1. Pilih range
2. Klik Format → Conditional formatting
3. Masukkan rule, misalnya:
   - cell < 0 → red
   - text contains “A” → blue
4. Atur styling

---

## Duplicate Data

### Pandangan umum
Duplikat data terjadi ketika baris data memiliki nilai yang sama di satu atau beberapa kolom.

### Langkah menghapus duplikat
- Pilih range tabel
- Klik Data → Data cleanup → Remove duplicates
- Centang Data has header row jika tabel memiliki header
- Pilih kolom yang akan diperiksa
- Google Sheets akan mempertahankan baris paling atas dan menghapus data duplikat lainnya

Catatan:
- Sebelum menghapus, lakukan backup data
- Jika duplikat bersifat parsial, pilih kombinasi kolom yang relevan

---

## Data Validation

Data validation berfungsi untuk meminimalkan input yang tidak konsisten.

Cara:
- Pilih range cell
- Klik Data → Data validation
- Pilih Criteria
- Atur rule berdasarkan kebutuhan
- Gunakan advanced options untuk:
  - menolak input yang salah
  - menampilkan warning
  - menampilkan help text
  - mengatur display style

Contoh:
- Segment hanya boleh berisi:
  - Corporate
  - Consumer
  - Home Office

---

## Mini Task

1. Buat worksheet baru lalu extract data raw superstore ke sheet.
2. Ubah format kolom Discount menjadi percentage.
3. Ubah format kolom Sales dan Profit menjadi currency dengan format dollar dan 2 angka di belakang koma.
4. Pada kolom Profit, tandai profit yang negatif dengan warna merah.
5. Ubah data pada kolom Ship_Mode sampai Region dengan Proper Case.
6. Periksa apakah data memiliki duplikat.
7. Pada kolom Segment, terapkan data validation agar hanya menerima:
   - Corporate
   - Consumer
   - Home Office

---

## Kesimpulan
- Google Sheets memudahkan eksekusi proses analisis data secara cepat dan rapi.
- Manajemen data yang baik dimulai dari extract, format, clean, dan validation.
- Dengan teknik yang benar, dataset akan lebih siap dipakai untuk analisis dan dashboard.
