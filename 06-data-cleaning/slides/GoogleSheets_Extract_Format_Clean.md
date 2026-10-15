# Working with Google Sheets: Extract - Format - Clean

## Modul: Working with Google Sheets
Topik: Extract — Format — Clean

Sumber materi dan contoh: https://drive.google.com/drive/folders/1raajBQWs8L-hdCAK0Q-pWWoAZi_gYQLy?usp=sharing

### Agenda
1. Data Extraction
   - Import data from CSV (GUI)  
   - IMPORTDATA (function)  
   - IMPORTRANGE (from other sheets)
2. Data Formatting
   - Number Format (currency, percent, decimal)  
   - Text Format (LOWER, UPPER, PROPER, TRIM, CONCATENATE, JOIN, LEFT, RIGHT)  
   - Date Format (predefined & custom)  
   - Conditional Formatting
3. Handling Duplicate Data
   - Various cases of duplicate data  
   - Remove duplicates (Data → Data cleanup → Remove duplicates)  
4. Data Validation
   - What is data validation and why it matters  
   - Creating validation settings (criteria, advanced options)
5. Mini Task (see exercises)

---

## Data Extraction

A. GUI method (Import CSV)
1. File → Import
2. Jika file ada di Google Drive: tab "My Drive" → pilih file .csv
3. Jika file di perangkat lokal: Upload → Browse → pilih .csv
4. Pilih bagaimana file dimasukkan:
   - Create new spreadsheet  
   - Insert new sheet  
   - Replace spreadsheet  
   - Replace current sheet  
   - Append to current sheet  
   - Replace data at selected cell

Catatan: setelah import via GUI pilih opsi yang aman (sebaiknya Insert new sheet atau Create new spreadsheet jika ingin menjaga data asli).

B. IMPORTDATA (function)
- Sintaks: =IMPORTDATA("https://path/to/file.csv")
- File hasil IMPORTDATA tidak bisa langsung diubah; jika Anda perlu mengubahnya, lakukan Copy → Paste values.

C. IMPORTRANGE (data dari sheet lain)
- Sintaks: =IMPORTRANGE("sheet_url", "sheet_name!A1:Z1000")
- Perlu memberikan izin (Allow access) pada sheet target
- Hasil IMPORTRANGE bersifat linked — gunakan Copy→Paste values bila perlu edit

---

## Data Formatting

A. Number Formatting
- Gunakan toolbar quick format (currency, percent, decimal increase/decrease)
- Untuk mengubah currency default ($) ke IDR atau mata uang lain, gunakan Custom currency
- Pilih range → Format → Number → pilih format yang sesuai

B. Date & Time Formatting
- Pilih range tanggal → Format → Number → Date / Time / Custom date and time
- Gunakan format custom jika perlu menampilkan tanggal dengan style tertentu

C. Text Formatting & Common Functions
- =LOWER(text)  → huruf kecil
- =UPPER(text)  → huruf besar
- =PROPER(text) → kapital setiap awal kata
- =TRIM(text)    → hapus spasi berlebih
- =CONCATENATE(a,b,...) / =CONCAT(a,b) / =JOIN(delim, range)
- =LEFT(text, n) / =RIGHT(text, n)

D. Conditional Formatting
- Menu: Format → Conditional formatting
- Langkah:
  1. Tentukan Apply to range
  2. Buat rule di Format rules (mis. cell < 0)
  3. Pilih Formatting style (warna, bold, dsb.)

Contoh: tandai profit negatif dengan warna merah menggunakan rule "Less than" 0.

---

## Handling Duplicate Data
- Menu: Data → Data cleanup → Remove duplicates
- Langkah:
  1. Pilih range (centang "Data has header row" jika ada)
  2. Pilih kolom yang digunakan untuk mengecek duplikat
  3. Sistem akan mempertahankan baris paling atas dari grup duplikat

Pertimbangan:
- Beberapa duplikat mungkin hanya duplikat parsial (cek kombinasi kolom)
- Simpan cadangan data sebelum menghapus duplikat

---

## Data Validation
- Menu: Data → Data validation
- Tujuan: mencegah input yang tidak konsisten
- Langkah:
  1. Pilih Apply to range
  2. Pilih Criteria (List of items, List from a range, Number, Text, Date, Custom formula, dsb.)
  3. Atur Advanced options: Show warning / Reject input, Help text

Contoh: Validasi kolom Segment sehingga hanya menerima: Corporate, Consumer, Home Office
- Criteria: List of items → "Corporate,Consumer,Home Office"
- Advanced: Reject input (recommended)

---

## Mini Task (Praktik)
1. Buat worksheet baru lalu extract data raw "superstore" dari folder modul ke dalam sheet.  
2. Ubah format data pada kolom `Discount` menjadi percentage.  
3. Ubah format data pada kolom `Sales` dan `Profit` menjadi currency ($) dengan 2 desimal.  
4. Pada kolom `Profit` tandai profit negatif dengan warna merah (conditional formatting).  
5. Ubah data pada kolom `Ship Mode` sampai `Region` menjadi Proper Case (fungsi PROPER).  
6. Periksa apakah data superstore memiliki transaksi duplikat (gunakan Remove duplicates).  
7. Di kolom `Segment` terapkan data validation sehingga data yang masuk adalah salah satu dari: `Corporate`, `Consumer`, `Home Office`.

Simpan hasil pekerjaan pada folder modul: `06-data-cleaning/` → `exercises/google-sheets-mini-task/` (nama file: `answer_<nama>.xlsx` atau `answer_<nama>.gsheet`) dan catat langkah yang Anda lakukan di `answer_<nama>.md`.

---

## Referensi & Resource
- Materi source: RintisKarirImpian slides  
- Folder drive: https://drive.google.com/drive/folders/1raajBQWs8L-hdCAK0Q-pWWoAZi_gYQLy?usp=sharing

