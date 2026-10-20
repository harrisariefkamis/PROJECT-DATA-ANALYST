# 📚 Index: Files & Resources

> **Indeks navigasi cepat** untuk seluruh aset di repositori **[PROJECT-DATA-ANALYST](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST)**. Gunakan tabel di bawah untuk membuka file, menjalankan notebook di **Google Colab**, atau mengunduh resource secara langsung.

![Repo](https://img.shields.io/badge/Repo-PROJECT--DATA--ANALYST-blue?logo=github&logoColor=white)
![Colab](https://img.shields.io/badge/Open%20in-Colab-F9AB00?logo=googlecolab&logoColor=white)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📋 Daftar Isi

- [👤 Kontak & Profil](#-kontak--profil)
- [📓 Notebooks — Open in Colab](#-notebooks--open-in-colab)
- [🧮 SQL & Scripts](#-sql--scripts)
- [📊 Data Samples](#-data-samples)
- [💡 Cara Pakai Link Relatif vs Raw](#-cara-pakai-link-relatif-vs-raw)
- [🔄 Cara Menambah File Baru](#-cara-menambah-file-baru-ke-indeks-ini)

---

## 👤 Kontak & Profil

| Resource | Format | Link |
| :--- | :---: | :--- |
| **Kontak (Markdown)** | `.md` | [`00-contact/CONTACT.md`](../00-contact/CONTACT.md) |
| **Kontak (HTML)** | `.html` | [`00-contact/contact.html`](../00-contact/contact.html) |
| **vCard (Download)** | `.vcf` | [⬇️ Download `contact.vcf`](https://raw.githubusercontent.com/harrisariefkamis/PROJECT-DATA-ANALYST/main/00-contact/contact.vcf) |

---

## 📓 Notebooks — Open in Colab

Klik tombol **Open in Colab** untuk langsung menjalankan notebook di browser (tanpa setup lokal).

| Notebook | Level | Deskripsi | Buka di Colab |
| :--- | :---: | :--- | :---: |
| **06_data_cleaning_beginner.ipynb** | ⭐ Pemula | Cleaning dasar: missing values, duplikat, tipe data | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/harrisariefkamis/PROJECT-DATA-ANALYST/blob/main/06-data-cleaning/notebooks/06_data_cleaning_beginner.ipynb) |
| **06_data_cleaning_advanced.ipynb** | ⭐⭐⭐ Lanjut | Outlier, transformasi, feature engineering | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/harrisariefkamis/PROJECT-DATA-ANALYST/blob/main/06-data-cleaning/notebooks/06_data_cleaning_advanced.ipynb) |

> 💡 **Tips:** Klik badge Colab untuk membuka langsung, atau **Save a copy** di menu Colab agar bisa diedit tanpa mempengaruhi repo asli.

---

## 🧮 SQL & Scripts

| File | Kategori | Deskripsi | Link |
| :--- | :--- | :--- | :--- |
| `beginner_sales_transform.sql` | 🗄️ SQL | Transformasi data penjualan tingkat dasar | [`06-data-cleaning/sql/beginner_sales_transform.sql`](../06-data-cleaning/sql/beginner_sales_transform.sql) |
| `advanced_transactions_transform.sql` | 🗄️ SQL | Transformasi data transaksi dengan window function & CTE | [`06-data-cleaning/sql/advanced_transactions_transform.sql`](../06-data-cleaning/sql/advanced_transactions_transform.sql) |
| `basic_solutions.py` | 🐍 Python | Solusi latihan data cleaning (beginner) | [`06-data-cleaning/solutions/basic_solutions.py`](../06-data-cleaning/solutions/basic_solutions.py) |
| `advanced_solutions.py` | 🐍 Python | Solusi latihan data cleaning (advanced) | [`06-data-cleaning/solutions/advanced_solutions.py`](../06-data-cleaning/solutions/advanced_solutions.py) |

---

## 📊 Data Samples

| File | Ukuran (approx.) | Kolom Utama | Link |
| :--- | :---: | :--- | :--- |
| **sample_sales.csv** | ~baris kecil | `order_id`, `product`, `quantity`, `price` | [`06-data-cleaning/data/sample_sales.csv`](../06-data-cleaning/data/sample_sales.csv) |
| **sample_transactions.csv** | ~baris kecil | `transaction_id`, `customer_id`, `amount`, `date` | [`06-data-cleaning/data/sample_transactions.csv`](../06-data-cleaning/data/sample_transactions.csv) |

> ⚠️ **Catatan:** Data sample ini adalah **dataset simulasi** untuk latihan cleaning. Jangan gunakan untuk analisis produksi.

---

## 💡 Cara Pakai Link Relatif vs Raw

Repo ini menggunakan **dua jenis link** yang perlu Anda pahami:

| Jenis Link | Contoh | Kapan Menggunakan | Behavior |
| :--- | :--- | :--- | :--- |
| **Link Relatif** | `../00-contact/CONTACT.md` | Untuk navigasi antar file **di dalam repo** | Membuka **GitHub UI** (preview markdown, syntax highlight) |
| **Link Raw** | `https://raw.githubusercontent.com/.../contact.vcf` | Untuk **download langsung** / akses dari luar | Mengunduh **file mentah** tanpa halaman GitHub |
| **Link Colab** | `https://colab.research.google.com/github/...` | Untuk menjalankan notebook di browser | Membuka **Google Colab** dengan notebook siap pakai |

### Contoh Penggunaan

```markdown
<!-- Link relatif (navigasi internal) -->
[Lihat Kontak](../00-contact/CONTACT.md)

<!-- Link raw (download langsung) -->
[Download vCard](https://raw.githubusercontent.com/harrisariefkamis/PROJECT-DATA-ANALYST/main/00-contact/contact.vcf)

<!-- Link Colab (jalankan notebook) -->
[Open in Colab](https://colab.research.google.com/github/harrisariefkamis/PROJECT-DATA-ANALYST/blob/main/06-data-cleaning/notebooks/06_data_cleaning_beginner.ipynb)
```

---

## 🔄 Cara Menambah File Baru ke Indeks Ini

Ingin menambahkan file atau notebook baru ke indeks? Ikuti panduan berikut:

### 1. Update `INDEX.md` dengan format tabel

```markdown
| File Baru | Kategori | Deskripsi | Link |
| :--- | :--- | :--- | :--- |
| `new_file.py` | 🐍 Python | Deskripsi singkat | [`path/to/new_file.py`](../path/to/new_file.py) |
```

### 2. Gunakan **path relatif** (bukan absolute URL)

| ✅ Benar | ❌ Salah |
| :--- | :--- |
| `../06-data-cleaning/sql/file.sql` | `https://github.com/user/repo/blob/main/06-data-cleaning/sql/file.sql` |
| Portabel jika repo di-clone/fork | Hardcoded, hanya works di repo asli |

### 3. Untuk Colab, gunakan template URL

```text
https://colab.research.google.com/github/USERNAME/REPO-NAME/blob/main/PATH/TO/NOTEBOOK.ipynb
```

Ganti:
- `USERNAME` → username GitHub Anda
- `REPO-NAME` → nama repository
- `PATH/TO/NOTEBOOK.ipynb` → path lengkap file notebook

### 4. Untuk Raw Download, gunakan template

```text
https://raw.githubusercontent.com/USERNAME/REPO-NAME/main/PATH/TO/FILE
```

---

## 📁 Struktur Repositori Lengkap

Untuk konteks navigasi, berikut adalah struktur folder utama repo:

```text
PROJECT-DATA-ANALYST/
├── 00-contact/                 # Info kontak & vCard
│   ├── CONTACT.md
│   ├── contact.html
│   └── contact.vcf
├── 06-data-cleaning/           # Modul data cleaning
│   ├── notebooks/              # Jupyter notebooks
│   │   ├── 06_data_cleaning_beginner.ipynb
│   │   └── 06_data_cleaning_advanced.ipynb
│   ├── sql/                    # SQL scripts
│   │   ├── beginner_sales_transform.sql
│   │   └── advanced_transactions_transform.sql
│   ├── solutions/              # Python solutions
│   │   ├── basic_solutions.py
│   │   └── advanced_solutions.py
│   └── data/                   # Sample datasets
│       ├── sample_sales.csv
│       └── sample_transactions.csv
└── INDEX.md                    # File ini
```

---

## 🔗 Quick Links — Semua Resource

**Akses cepat tanpa scroll:**

| # | Resource | Link |
| :-: | :--- | :--- |
| 1 | 📄 Kontak (MD) | [Buka](../00-contact/CONTACT.md) |
| 2 | 🌐 Kontak (HTML) | [Buka](../00-contact/contact.html) |
| 3 | 📇 vCard | [Download](https://raw.githubusercontent.com/harrisariefkamis/PROJECT-DATA-ANALYST/main/00-contact/contact.vcf) |
| 4 | 📓 Notebook Beginner | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/harrisariefkamis/PROJECT-DATA-ANALYST/blob/main/06-data-cleaning/notebooks/06_data_cleaning_beginner.ipynb) |
| 5 | 📓 Notebook Advanced | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/harrisariefkamis/PROJECT-DATA-ANALYST/blob/main/06-data-cleaning/notebooks/06_data_cleaning_advanced.ipynb) |
| 6 | 🗄️ SQL Beginner | [Buka](../06-data-cleaning/sql/beginner_sales_transform.sql) |
| 7 | 🗄️ SQL Advanced | [Buka](../06-data-cleaning/sql/advanced_transactions_transform.sql) |
| 8 | 🐍 Python Beginner | [Buka](../06-data-cleaning/solutions/basic_solutions.py) |
| 9 | 🐍 Python Advanced | [Buka](../06-data-cleaning/solutions/advanced_solutions.py) |
| 10 | 📊 `sample_sales.csv` | [Buka](../06-data-cleaning/data/sample_sales.csv) |
| 11 | 📊 `sample_transactions.csv` | [Buka](../06-data-cleaning/data/sample_transactions.csv) |

---

<div align="center">

📚 **Indeks ini akan terus diperbarui** seiring penambahan modul baru.

[⬆️ Kembali ke Atas](#-index-files--resources) · [🏠 Ke Root Repo](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST)

</div>

---

## 📝 Changelog

| Tanggal | Perubahan |
| :--- | :--- |
| 2026-09-01 | Initial version — indeks lengkap untuk 00-contact & 06-data-cleaning |
| — | *(tambahkan baris baru setiap kali update indeks)* |

---

**Lisensi:** MIT — tidak bebas digunakan dan dimodifikasi.
