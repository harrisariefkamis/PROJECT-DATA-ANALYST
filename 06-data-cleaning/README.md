[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/harrisariefkamis/PROJECT-DATA-ANALYST/blob/main/06-data-cleaning/notebooks/)
[![Python](https://img.shields.io/badge/Python-Pandas-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-Data%20Quality-336791?logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Datasets](https://img.shields.io/badge/Datasets-17%20files-2ea44f?style=flat)](data/)

# 06 Data Cleaning

Folder dataset ini berisi latihan pembersihan data untuk tingkat pemula hingga tingkat profesional. beserta contoh dataset beragam dalam format CSV dan Excel.utamakan understanding data,pelajari struktur datanya lalu gunakan dataset untuk melatih pemeriksaan kualitas data, penanganan nilai kosong dan duplikat, konsistensi tipe data, validasi kategori, serta persiapan data sebelum analisis.

## Materi dan kasus latihan

- [Kasus pemula](beginner_case.md) — mulai dari inspeksi data dan perbaikan masalah umum dengan langkah sederhana.
- [Kasus lanjutan](advanced_case.md) — latihan pemeriksaan kualitas data dan pembersihan dengan pendekatan yang lebih terstruktur.
- `notebooks/` — notebook interaktif untuk menjalankan contoh dan bereksperimen.
- `python/` — skrip Python pendukung.
- `sql/` — contoh atau latihan SQL.
- `solutions/` — solusi pendukung untuk membandingkan pendekatan setelah mencoba sendiri.

## Dataset latihan yang tersedia

Pilih dataset berdasarkan jenis masalah yang ingin dilatih. Keterangan di bawah ini disimpulkan dari nama file; periksa isi dan dokumentasi dataset sebelum menggunakannya atau menarik kesimpulan.

### Dataset untuk latihan dasar dan analisis bisnis

- [sample_sales.csv](data/sample_sales.csv) — dataset penjualan kecil untuk latihan awal dan mengikuti kasus pembersihan.
- [sample_transactions.csv](data/sample_transactions.csv) — data transaksi contoh untuk mengecek konsistensi dan kualitas baris.
- [data_penjualan.csv](data/data_penjualan.csv) — data penjualan untuk latihan validasi nilai dan format.
- [orders.csv](data/orders.csv) — data pesanan yang dapat digunakan untuk memeriksa tanggal, status, dan nilai transaksi.
- [Sample - Superstore.csv](data/Sample%20-%20Superstore.csv) — data Superstore untuk latihan pembersihan sebelum analisis bisnis dan penjualan.
- [Misi EXC-Mini Bootcamp 9-Harris Arief Kamis.csv](data/Misi%20EXC-Mini%20Bootcamp%209-Harris%20Arief%20Kamis.csv) — dataset latihan bootcamp; tinjau kolom dan instruksi terkait sebelum menentukan tugas pembersihannya.
- [marketing_budget.xlsx](data/marketing_budget.xlsx) — file Excel untuk latihan membaca dan memeriksa data anggaran pemasaran.

### Dataset untuk kasus khusus

- [HR_comma_sep.csv](data/HR_comma_sep.csv) — data bertema sumber daya manusia; periksa nilai kategori, kelengkapan, dan konsistensi.
- [new_customer_churn_predictions.csv](data/new_customer_churn_predictions.csv) — data bertema pelanggan/churn untuk latihan memeriksa nilai dan konsistensi atribut.
- [social_media_engagement_dataset.csv](data/social_media_engagement_dataset.csv) — data engagement media sosial untuk pemeriksaan metrik dan format.
- [data flight_delay_analyst.csv](data/data%20flight_delay_analyst.csv) — data keterlambatan penerbangan untuk latihan merapikan tanggal/waktu, nilai numerik, dan kategori terkait.
- [Data-Penduduk-Jakarta.csv](data/Data-Penduduk-Jakarta.csv) — data bertema penduduk Jakarta; perhatikan konsistensi wilayah, kategori, dan format angka.

### Dataset nikel, pelabuhan, dan pasar

- [Dataset Hilirisasi - Tambang Nikel Sul-Mal Final.csv](data/Dataset%20Hilirisasi%20-%20Tambang%20Nikel%20Sul-Mal%20Final.csv) — dataset bertema hilirisasi/tambang nikel Sulawesi–Maluku.
- [Dataset pelabuhan - Maluku.csv](data/Dataset%20pelabuhan%20-%20Maluku.csv) — data pelabuhan bertema wilayah Maluku.
- [Dataset pelabuhan - Sulawesi.csv](data/Dataset%20pelabuhan%20-%20Sulawesi.csv) — data pelabuhan bertema wilayah Sulawesi.
- [Harga-komoditas-nikel-untuk-tiga-bulan-terakhir.csv](data/Harga-komoditas-nikel-untuk-tiga-bulan-terakhir.csv) — data harga komoditas nikel untuk pemeriksaan periode, harga, dan format.
- [Smelter.csv](data/Smelter.csv) — data bertema smelter untuk latihan pemeriksaan atribut dan konsistensi.
- [Stock Market PT.Antam JKT-2005-2021.csv](data/Stock%20Market%20PT.Antam%20JKT-2005-2021.csv) — data pasar saham PT Antam bertema periode 2005–2021.

## Alur kerja yang disarankan

1. **Muat dan inspeksi data.** Periksa ukuran data, nama kolom, tipe data, beberapa baris awal/akhir, dan ringkasan statistik.
2. **Identifikasi masalah kualitas.** Cari nilai kosong, duplikasi, format tanggal tidak konsisten, spasi ekstra, kategori yang berbeda penulisan, dan nilai di luar rentang wajar.
3. **Tentukan aturan pembersihan.** Catat keputusan dan alasannya. Jangan menghapus atau mengisi nilai secara otomatis tanpa memahami konteks kolom.
4. **Bersihkan dan validasi.** Terapkan perbaikan dengan Python/Pandas atau SQL, lalu bandingkan jumlah baris dan nilai penting sebelum serta sesudah perubahan.
5. **Simpan hasil dan dokumentasikan.** Pisahkan data mentah dari data bersih, jelaskan perubahan, dan catat asumsi atau keterbatasan.

## Cara menggunakan

- Mulai dengan [kasus pemula](beginner_case.md) dan dataset contoh yang dirujuk dalam kasus tersebut.
- Buka notebook yang sesuai di `notebooks/` menggunakan Jupyter atau Google Colab. Jika membuka notebook melalui Colab, simpan salinan ke Drive sebelum mengedit.
- Pastikan jalur file cocok dengan lokasi dataset di `data/`; nama file yang memiliki spasi harus ditulis persis seperti di folder.
- Setelah memahami alurnya, pilih dataset lain dari daftar di atas dan buat checklist masalah kualitas data yang ditemukan.
- Coba kerjakan dahulu sebelum melihat solusi yang tersedia.

## Catatan

- Nama file hanya memberi petunjuk awal tentang topik dataset; selalu verifikasi kolom, sumber, cakupan, dan konteks dari isi file.
- Periksa lisensi, privasi, dan izin penggunaan sebelum membagikan dataset atau hasil olahannya.
- Simpan salinan data mentah dan lakukan transformasi pada salinan kerja agar proses dapat ditelusuri.
- Contoh SQL dapat memerlukan penyesuaian sesuai dialek database, termasuk PostgreSQL dan MySQL.
