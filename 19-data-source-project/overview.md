# Sumber Data untuk Latihan Proyek Data Analyst

Kumpulan referensi ini membantu menemukan dataset publik untuk latihan dan proyek portofolio Data Analyst. Sumbernya mencakup katalog pencarian dataset, repositori machine learning, serta portal data resmi dan riset. Pilih dataset yang sesuai dengan pertanyaan bisnis atau topik proyek, lalu dokumentasikan asal data, periode, definisi kolom, dan ketentuan penggunaannya.

![Data Sources](https://img.shields.io/badge/Data%20Sources-8%20platforms-2F6FEB?style=for-the-badge)
![Open Data](https://img.shields.io/badge/Open%20Data-Check%20license-2DA44E?style=for-the-badge)
![Project Ready](https://img.shields.io/badge/Portfolio-Project%20ideas-8957E5?style=for-the-badge)

## Daftar sumber dataset

### 1. [Google Dataset Search](https://datasetsearch.research.google.com/)

![Google Dataset Search](https://img.shields.io/badge/Google-Dataset%20Search-4285F4?logo=google&logoColor=white)

Mesin pencari untuk menemukan dataset yang diterbitkan oleh universitas, lembaga pemerintah, organisasi, dan situs lainnya. Gunakan kata kunci topik, lokasi, rentang waktu, atau format file untuk menjelajahi katalog yang tersebar di web.

**Cocok untuk:** mencari sumber data awal saat topik proyek belum memiliki portal khusus. Google Dataset Search membantu menemukan dataset, tetapi bukan pemilik atau penjamin kualitas data. Buka situs penerbit asli untuk memeriksa metadata, versi terbaru, metode pengumpulan, dan lisensi.

### 2. [AWS Registry of Open Data](https://registry.opendata.aws/)

![AWS Open Data](https://img.shields.io/badge/AWS-Registry%20of%20Open%20Data-232F3E?logo=amazonaws&logoColor=white)

Katalog dataset publik yang tersedia melalui infrastruktur AWS. Koleksinya mencakup berbagai bidang seperti lingkungan, genomik, citra, dan data geospasial. Sebagian dataset dapat dianalisis langsung di cloud tanpa mengunduh seluruh berkas.

**Cocok untuk:** proyek dengan dataset berukuran besar atau data ilmiah. Sebelum mengakses, periksa halaman dataset untuk format, wilayah, pembaruan, biaya layanan terkait, serta syarat penggunaan. Data yang dapat diakses publik tidak otomatis bebas dari semua batasan lisensi.

### 3. [UCI Machine Learning Repository](https://archive.ics.uci.edu/)

![UCI Machine Learning Repository](https://img.shields.io/badge/UCI-Machine%20Learning%20Repository-006699?style=flat)

Repositori dataset yang banyak digunakan untuk pembelajaran dan eksperimen machine learning. Dataset umumnya disertai informasi ringkas tentang karakteristik data, variabel, dan konteks penggunaannya.

**Cocok untuk:** latihan eksplorasi data, pembersihan, analisis statistik, klasifikasi, dan regresi. Periksa halaman dataset untuk sitasi yang disarankan, struktur berkas, serta lisensi. Catatan: nama repositori yang benar adalah **UCI Machine Learning Repository**.

### 4. [Hugging Face Datasets](https://huggingface.co/datasets)

![Hugging Face Datasets](https://img.shields.io/badge/Hugging%20Face-Datasets-FFD21E?logo=huggingface&logoColor=black)

Hub untuk menemukan dan berbagi dataset, termasuk data teks, gambar, audio, dan data multimodal. Banyak dataset dapat ditelusuri melalui halaman web atau dimuat menggunakan pustaka `datasets`.

**Cocok untuk:** proyek analisis teks, eksplorasi data multimodal, dan latihan pemrosesan dataset dengan Python. Periksa kartu dataset untuk sumber, skema, pembagian data, potensi bias, lisensi, dan batasan penggunaan. Ketentuan dapat berbeda untuk setiap dataset.

### 5. [WHO Data](https://data.who.int/)

![WHO Data](https://img.shields.io/badge/WHO-Health%20Data-0093D5?logo=who&logoColor=white)

Portal data kesehatan global dari World Health Organization (WHO), dengan indikator yang dapat digunakan untuk mempelajari isu kesehatan masyarakat dan membandingkan data lintas negara atau waktu.

**Cocok untuk:** analisis indikator kesehatan, tren, dan perbandingan antarwilayah. Baca definisi indikator, populasi cakupan, satuan, metodologi, dan tanggal pembaruan dengan teliti. Perhatikan bahwa data agregat tidak dapat digunakan untuk menyimpulkan hubungan sebab-akibat atau kondisi individu tanpa analisis yang sesuai.

### 6. [NASA Open Data](https://data.nasa.gov/)

![NASA Open Data](https://img.shields.io/badge/NASA-Open%20Data-0B3D91?logo=nasa&logoColor=white)

Katalog data terbuka NASA yang mencakup berbagai topik terkait sains, penerbangan, antariksa, dan pengamatan Bumi. Ketersediaan format dan dokumentasi bergantung pada dataset masing-masing.

**Cocok untuk:** proyek analisis sains, lingkungan, atau eksplorasi data antariksa. Periksa metadata, satuan, cakupan waktu dan lokasi, metode pengukuran, serta ketentuan atribusi sebelum mengolah atau membagikan hasil.

### 7. [World Bank Open Data](https://data.worldbank.org/)

![World Bank Open Data](https://img.shields.io/badge/World%20Bank-Open%20Data-009FDA?style=flat)

Portal indikator pembangunan dan ekonomi global dari World Bank. Data dapat digunakan untuk melihat indikator antarnegara dan perubahan dari waktu ke waktu; sebagian sumber dan API juga tersedia melalui layanan data World Bank.

**Cocok untuk:** analisis pembangunan, ekonomi, demografi, dan perbandingan antarnegara. Pastikan definisi indikator, satuan, tahun referensi, cakupan negara, serta sumber data yang mendasari indikator dipahami sebelum membuat kesimpulan.

### 8. [Our World in Data](https://ourworldindata.org/)

![Our World in Data](https://img.shields.io/badge/Our%20World%20in%20Data-Research%20%26%20Charts-6B8E23?style=flat)

Platform publikasi riset dan visualisasi data mengenai isu global, termasuk kesehatan, kemiskinan, energi, lingkungan, dan populasi. Artikel dan grafiknya menyediakan konteks serta tautan menuju sumber data.

**Cocok untuk:** mencari topik proyek dan mengeksplorasi indikator global dengan konteks penjelas. Saat menggunakan data, ikuti informasi lisensi dan atribusi yang tercantum pada halaman atau dataset terkait, serta telusuri sumber primer bila tersedia.

## Cara memilih dataset untuk proyek portofolio

1. **Tentukan pertanyaan analisis.** Contoh: bagaimana perubahan indikator kesehatan dari tahun ke tahun, atau kategori kampanye mana yang memiliki performa terbaik?
2. **Periksa relevansi dan cakupan.** Pastikan dataset memiliki variabel, rentang waktu, wilayah, dan jumlah observasi yang memadai untuk menjawab pertanyaan.
3. **Baca dokumentasi dan metadata.** Pahami definisi kolom, satuan, data hilang, metode pengumpulan, frekuensi pembaruan, serta keterbatasan.
4. **Pastikan hak penggunaan.** Tinjau lisensi, atribusi yang diwajibkan, pembatasan penggunaan komersial, dan ketentuan privasi. Jangan berasumsi bahwa semua data yang dapat diunduh bebas digunakan tanpa syarat.
5. **Catat sumber secara transparan.** Simpan nama penerbit, judul dataset, URL halaman dataset, tanggal akses, versi atau tanggal pembaruan, serta lisensi.
6. **Mulai dengan eksplorasi dan pembersihan.** Periksa tipe data, nilai kosong, duplikasi, rentang nilai, dan konsistensi kategori sebelum membuat visualisasi atau menarik kesimpulan.

## Ide penggunaan dalam proyek nyata

- Buat analisis tren dan dashboard indikator kesehatan menggunakan data WHO.
- Bandingkan indikator pembangunan atau ekonomi lintas negara menggunakan World Bank Open Data.
- Telusuri perubahan isu global melalui dataset dan konteks riset Our World in Data.
- Eksplorasi data lingkungan atau sains dari NASA maupun AWS Open Data.
- Gunakan dataset UCI atau Hugging Face untuk latihan analisis terstruktur, teks, dan pemodelan.
- Gunakan Google Dataset Search untuk menemukan sumber primer yang paling sesuai dengan pertanyaan proyek.

## Catatan

Halaman ini merupakan panduan untuk menemukan sumber data, bukan jaminan bahwa setiap dataset pada platform tersebut lengkap, mutakhir, atau bebas batasan. Selalu rujuk halaman dataset asli dan dokumentasi resminya. Dalam portofolio, sertakan sumber data dan jelaskan asumsi serta keterbatasan analisis agar hasil proyek dapat ditinjau dan dipahami dengan baik.
