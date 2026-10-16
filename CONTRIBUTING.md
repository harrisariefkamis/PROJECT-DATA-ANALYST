# 🤝 Panduan Kontribusi (Access-Controlled)

Terima kasih atas minat Anda untuk berkontribusi pada repositori **`PROJECT-DATA-ANALYST`** — *Data Analyst Bootcamp: Modul Praktik, Studi Kasus & Persiapan Karier*.

> ⚠️ **PENTING:** Repositori ini **BUKAN open-source**. Seluruh konten dilindungi hak cipta dan **kontribusi hanya dapat dilakukan oleh pihak yang telah memperoleh izin tertulis** dari pemilik repositori.

---

## 🔐 Kebijakan Akses Kontribusi

### Siapa yang Boleh Berkontribusi?

Hanya pihak berikut yang **diizinkan** mengirim kontribusi:

| Kategori | Persyaratan |
|---|---|
| ✅ **Pemilik repositori** | Haris Arief Kamis (owner) |
| ✅ **Kontributor resmi berizin** | Memiliki **Access Grant Letter** tertulis dari pemilik |
| ✅ **Kolaborator terdaftar** | Ditambahkan sebagai *collaborator* di GitHub oleh pemilik |
| ✅ **Tim bootcamp internal** | Memiliki perjanjian kerja sama (MoU/NDA) dengan pemilik |
| ❌ **Publik umum** | **Tidak diizinkan** tanpa izin tertulis |

### 🚫 Kontribusi Tanpa Izin

Segala bentuk kontribusi tanpa izin tertulis — termasuk **pull request, issue, fork publik, atau duplikasi konten** — **tidak akan diproses** dan dapat dikenai tindakan hukum sesuai ketentuan yang berlaku.

---

## 📝 Prosedur Permintaan Akses Kontribusi

Jika Anda ingin berkontribusi, ikuti alur berikut:

### Langkah 1 — Ajukan Permohonan Akses

Kirim email/permintaan resmi ke pemilik repositori dengan informasi berikut:

| Item | Keterangan |
|---|---|
| **Nama Lengkap** | Sesuai identitas resmi |
| **Afiliasi** | Institusi/perusahaan (jika ada) |
| **Tujuan Kontribusi** | Apa yang ingin Anda kontribusikan & mengapa |
| **Lingkup Kontribusi** | Modul/file yang akan disentuh |
| **Durasi Akses** | Berapa lama akses dibutuhkan |
| **Perjanjian** | Kesediaan menandatangani NDA/Contributor Agreement |

**Kontak pengajuan:**
- 💼 LinkedIn: [https://www.linkedin.com/in/harisariefkamis](https://www.linkedin.com/in/harisariefkamis)
- 📧 Subjek email: `[REQUEST ACCESS] PROJECT-DATA-ANALYST`

### Langkah 2 — Review & Persetujuan

Pemilik repositori akan meninjau permohonan Anda dalam **7–14 hari kerja**. Persetujuan diberikan secara **tertulis** melalui:

- ✉️ Surat Izin Kontribusi (Access Grant Letter), **atau**
- 📃 Contributor Agreement yang ditandatangani kedua pihak, **atau**
- 🎫 Undangan resmi sebagai GitHub *collaborator*

### Langkah 3 — Pelaksanaan Kontribusi

Setelah mendapatkan izin tertulis:

1. Anda akan diberi akses sebagai *collaborator*.
2. Buat branch baru dengan format: `contrib/<username>/<topik>`
3. Ikuti seluruh pedoman di bawah ini.
4. Ajukan **Pull Request** dan tandai sebagai `[AUTHORIZED]` di judulnya.

### Langkah 4 — Review oleh Pemilik

Semua PR dari kontributor berizin tetap melalui **review akhir oleh pemilik**. Pemilik berhak **menolak, merevisi, atau membatalkan** kontribusi tanpa perlu memberikan alasan.

---

## 📋 Pedoman Umum (Untuk Kontributor Berizin)

- **Ikuti urutan belajar** — gunakan folder modul sesuai nomor urut (`01-`, `02-`, dst.).
- **Setiap modul wajib memiliki `README.md`** yang menjelaskan tujuan, materi, dan deliverables.
- **Simpan dataset** di folder `datasets/` dengan dokumentasi sumber & lisensi.
- **Simpan solusi** di folder `solutions/` untuk referensi.
- **Hindari duplikasi** — periksa terlebih dahulu apakah materi serupa sudah ada.

---

## 📂 Struktur Folder Standar

```text
module-name/
├── README.md          # Tujuan, materi, dan deliverables modul
├── datasets/          # Dataset contoh (CSV, JSON, Parquet)
├── notebooks/         # Jupyter Notebook (.ipynb)
├── exercises/         # Latihan & soal praktik
├── solutions/         # Kunci jawaban & pembahasan
├── slides/            # Materi presentasi (opsional)
└── notes/             # Catatan tambahan (opsional)
```

---

## 🏷️ Konvensi Penamaan

### Nama Modul (kebab-case dengan angka dua digit)

```text
01-onboarding
02-secure-first-job
03-intro-data-analysis
04-basic-statistics
05-the-metrics
06-data-formatting-cleansing
07-sql-basic-1
08-sql-basic-2
09-sql-business-analysis
10-sql-for-data-analysis-4
11-sql-interview-case-studies
12-python-basic-project-1
13-python-numpy-pandas
14-python-study-cases
15-data-viz-basic-project-2
16-google-data-studio
17-career-class
```

### Nama File

| Jenis | Format | Contoh |
|---|---|---|
| Dokumentasi | `README.md` | `README.md` |
| Notebook | `NN_topik.ipynb` | `01_data_cleaning.ipynb` |
| SQL | `exercise_NN.sql` | `exercise_01.sql` |
| Dataset | `nama_dataset.csv` | `case_study_sales.csv` |

---

## 💬 Aturan Commit (Conventional Commits)

Format: `<type>(<scope>): <deskripsi>`

| Tipe | Kegunaan |
|---|---|
| `feat` | Menambah materi baru |
| `fix` | Memperbaiki kesalahan |
| `docs` | Update dokumentasi |
| `data` | Menambah/mengubah dataset |
| `refactor` | Restrukturisasi tanpa ubah logika |

Contoh:
```bash
feat(sql-basic-1): add SELECT & WHERE clause exercises
docs(07-sql-basic-1): add module README
```

---

## 🔀 Pull Request (Khusus Kontributor Berizin)

Judul PR **wajib** menyertakan tag `[AUTHORIZED]`:

```text
[AUTHORIZED] feat(sql-basic-1): add exercises
```

### Checklist PR

- [ ] Sudah memiliki izin tertulis dari pemilik
- [ ] Branch dari `main` dengan format `contrib/<username>/<topik>`
- [ ] Notebook/kode sudah diuji dan *reproducible*
- [ ] Mengikuti konvensi penamaan
- [ ] Sudah update `README.md` modul
- [ ] Dataset menyertakan sumber & lisensi
- [ ] Tidak mengandung data pribadi (PII) atau data sensitif

---

## 🧪 Standar Kualitas Data

### Dataset
- ✅ Sumber jelas + URL/sitasi di README
- ✅ Lisensi terbuka (CC0, MIT, Apache) — **dilarang** dataset proprietary
- ✅ Ukuran wajar (< 50 MB per file)
- ✅ Tidak mengandung PII
- ❌ Dilarang mengunggah data hasil scraping tanpa izin

### Notebook
- ✅ Reproducible (dapat dijalankan dari atas ke bawah)
- ✅ Terdokumentasi dengan Markdown cell
- ✅ Bebas output besar
- ✅ Mengikuti alur EDA: *Understand → Explore → Build → Validate → Communicate*

---

## 🚫 Larangan Keras

Kontributor **DILARANG**:

1. ❌ Menyalin, mempublikasikan ulang, atau mendistribusikan konten repo ini ke platform lain tanpa izin tertulis.
2. ❌ Menggunakan konten untuk tujuan komersial tanpa perjanjian lisensi.
3. ❌ Menghapus atau mengubah atribusi hak cipta.
4. ❌ Membocorkan materi internal bootcamp/kelas ke pihak luar.
5. ❌ Mengunggah data yang melanggar hak pihak ketiga.
6. ❌ Melakukan fork publik untuk tujuan redistribusi.

Pelanggaran terhadap larangan ini dapat dikenai **tindakan hukum** sesuai ketentuan yang berlaku (lihat `LICENSE`).

---

## ⚖️ Konsekuensi Pelanggaran

Pelanggaran terhadap panduan ini dapat mengakibatkan:

- 🔴 **Pencabutan akses** secara permanen sebagai kontributor.
- 🔴 **Penghapusan kontribusi** dari repositori.
- 🔴 **Tindakan hukum perdata dan/atau pidana** sesuai peraturan perundang-undangan yang berlaku, termasuk UU ITE dan UU Hak Cipta.
- 🔴 **Permintaan penghapusan konten** kepada platform pihak ketiga (GitHub, GitLab, dll.).

---

## 📬 Kontak & Permohonan Akses

Untuk mengajukan permohonan akses kontribusi atau kolaborasi:

- 💼 **LinkedIn:** [https://www.linkedin.com/in/harisariefkamis](https://www.linkedin.com/in/harisariefkamis)
- 🌐 **Portofolio:** [https://bit.ly/WebsitePortofolioDataAnalyst](https://bit.ly/WebsitePortofolioDataAnalyst)
- 🐙 **GitHub:** [https://github.com/harrisariefkamis](https://github.com/harrisariefkamis)

> 📩 **Subjek pengajuan:** `[REQUEST ACCESS] PROJECT-DATA-ANALYST`

---

## 🙏 Terima Kasih

Terima kasih atas pengertian dan kerja samanya. Kebijakan ini dibuat untuk **melindungi karya, menjaga kualitas, dan memastikan kolaborasi yang sehat**.

> 🌳 *"Data adalah fondasi hidup yang terus mengakar — dasar struktural bagi ekosistem teknologi masa depan."*

<p align="center">
  <sub>© 2026 Haris Arief Kamis. All rights reserved.</sub>
</p>
