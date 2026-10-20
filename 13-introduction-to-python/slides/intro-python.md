# 🐍 Introduction to Python — Google Colab

> Modul pengenalan Python untuk calon **Data Analyst**. Belajar dasar-dasar Python langsung di **Google Colab** — tanpa instalasi, cukup browser dan akun Google. Modul ini adalah **fondasi** sebelum masuk ke materi NumPy, Pandas, dan analisis data.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1Vr9nn2yspoGsoqzrzUOTzdxL27ZsbR8j#scrollTo=QE_83sYkbOn7)
![Python](https://img.shields.io/badge/Python-3.9%2B-blue?logo=python&logoColor=white)
![Colab](https://img.shields.io/badge/Google%20Colab-F9AB00?logo=googlecolab&logoColor=white)
![Level](https://img.shields.io/badge/Level-Beginner-brightgreen)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📋 Daftar Isi

- [🎯 Tujuan Pembelajaran](#-tujuan-pembelajaran)
- [🚀 Cara Menjalankan Notebook](#-cara-menjalankan-notebook)
- [📚 Materi yang Dicakup](#-materi-yang-dicakup)
- [🐍 Ringkasan Kode per Topik](#-ringkasan-kode-per-topik)
- [🎯 Latihan Mandiri](#-latihan-mandiri)
- [🔧 Troubleshooting Colab](#-troubleshooting-colab)
- [📁 Struktur Folder](#-struktur-folder)
- [📚 Resources](#-resources--referensi)

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan modul ini, peserta diharapkan mampu:

- [x] **Menjalankan Python di Google Colab** tanpa perlu instalasi lokal
- [x] **Memahami tipe data dasar** — integer, float, string, boolean
- [x] **Menggunakan struktur data koleksi** — list, tuple, set, dictionary
- [x] **Membuat dan memanggil fungsi** sederhana dengan parameter dan return value
- [x] **Melakukan operasi aritmatika** dasar termasuk pembagian integer (`//`) dan modulo (`%`)
- [x] **Membaca file CSV** menggunakan Pandas sebagai langkah awal analisis data

> [!NOTE]
> Modul ini adalah **fondasi wajib** sebelum masuk ke materi *Data Cleaning* (`06-data-cleaning`), *NumPy Array*, dan *Pandas DataFrame*.

---

## 🚀 Cara Menjalankan Notebook

### Langkah 1: Buka Notebook di Colab

Klik badge berikut untuk membuka notebook secara langsung:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1Vr9nn2yspoGsoqzrzUOTzdxL27ZsbR8j#scrollTo=QE_83sYkbOn7)

Atau salin link berikut ke browser:

```text
https://colab.research.google.com/drive/1Vr9nn2yspoGsoqzrzUOTzdxL27ZsbR8j
```

### Langkah 2: Simpan Salinan ke Drive

> ⚠️ **PENTING:** Notebook asli bersifat **read-only**. Anda harus membuat salinan agar bisa mengedit dan menjalankan.

**Cara:** Di menu Colab → **File → Save a copy in Drive**

Setelah disalin, Anda akan mendapat file baru di folder **`Colab Notebooks`** di Google Drive pribadi Anda.

### Langkah 3: Install Dependensi (Jika Perlu)

Colab sudah menyertakan sebagian besar library data science secara default. Jika Anda butuh versi spesifik atau library tambahan, jalankan cell berikut di awal:

```python
# Install library tambahan (hanya jika diperlukan)
!pip install --quiet pandas seaborn
```

### Langkah 4: Jalankan Sel Satu per Satu

- Klik cell → tekan **`Shift + Enter`** untuk menjalankan dan lanjut ke cell berikutnya.
- Atau klik tombol **▶️** di kiri cell.
- Atau **Runtime → Run all** untuk menjalankan seluruh notebook sekaligus.

### Langkah 5: Simpan & Bagikan Hasil

- **Auto-save** aktif di Colab, tapi Anda juga bisa **Ctrl/Cmd + S** manual.
- Untuk mengumpulkan tugas: **File → Share → Get link** (atur permission ke *"Anyone with the link"*), atau **File → Download → Download .ipynb**.

> [!TIP]
> **Menggunakan akun Google sekolah/kantor dan tidak bisa save ke Drive?**
> Gunakan **akun Gmail pribadi**, atau minta admin organisasi membuka akses Google Drive/Colab untuk akun Anda.

---

## 📚 Materi yang Dicakup

| # | Topik | Deskripsi | Cell di Notebook |
| :-: | :--- | :--- | :---: |
| 1 | **Setup Environment** | Import library & cek versi Python | Cell 2 |
| 2 | **Hello World** | Program Python pertama | Cell 4 |
| 3 | **Aritmatika Dasar** | Konversi menit ke jam (`/`, `//`) | Cell 6 |
| 4 | **List** | Struktur data berurutan, mutable | Cell 8 |
| 5 | **Dictionary** | Key-value pair untuk data terstruktur | Cell 10 |
| 6 | **Function** | Definisi fungsi dengan parameter & return | Cell 12 |
| 7 | **Bonus: Read CSV** | Membaca file CSV dengan Pandas | Cell 14 |

---

## 🐍 Ringkasan Kode per Topik

### 1️⃣ Setup Environment

Cell pertama mengimpor library yang akan digunakan sepanjang modul. Ini adalah **best practice** — semua import di satu tempat di awal notebook.

```python
import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

pd.set_option('display.max_columns', 50)

print('Python', sys.version)
print('pandas', pd.__version__)
```

**Mengapa penting:** Memastikan environment siap sebelum eksekusi. Jika muncul `ModuleNotFoundError`, Anda tahu harus install library yang kurang.

---

### 2️⃣ Hello World

Program paling klasik dalam belajar bahasa pemrograman baru.

```python
print('Hello world!')
```

**Insight:** `print()` adalah fungsi bawaan Python untuk menampilkan output ke konsol. Ini akan menjadi alat debugging utama Anda saat analisis data.

---

### 3️⃣ Aritmatika: Konversi Menit ke Jam

**Pertanyaan bisnis:** *"Jika total durasi aktivitas 160 menit, berapa jam dan menitnya?"*

```python
total_minutes = 160
total_hours = total_minutes / 60      # Pembagian float → 2.666...
hours_int = total_minutes // 60       # Floor division → 2
total_hours, hours_int
```

**Operator aritmatika penting:**

| Operator | Nama | Contoh | Hasil |
| :-: | :--- | :--- | :--- |
| `+` | Penjumlahan | `10 + 3` | `13` |
| `-` | Pengurangan | `10 - 3` | `7` |
| `*` | Perkalian | `10 * 3` | `30` |
| `/` | Pembagian (float) | `10 / 3` | `3.333...` |
| `//` | Floor division | `10 // 3` | `3` |
| `%` | Modulo (sisa bagi) | `10 % 3` | `1` |
| `**` | Pangkat | `10 ** 3` | `1000` |

> [!TIP]
> **`//` dan `%` sangat berguna di analisis data** — misalnya untuk mengelompokkan umur ke dalam bin (*age group*), membulatkan nilai, atau mengecek bilangan ganjil/genap.

---

### 4️⃣ List — Struktur Data Berurutan

List adalah koleksi **ordered** dan **mutable** — elemen bisa diubah, ditambah, atau dihapus.

```python
nums = [10, 20, 30, 40, 50]
print('last element:', nums[-1])   # Indexing negatif → 50
nums.append(60)                    # Tambah elemen di akhir
nums
```

**Operasi umum list:**

| Operasi | Contoh | Hasil |
| :--- | :--- | :--- |
| **Indexing** | `nums[0]` | `10` |
| **Negative indexing** | `nums[-1]` | elemen terakhir |
| **Slicing** | `nums[1:3]` | `[20, 30]` |
| **Append** | `nums.append(60)` | tambah di akhir |
| **Length** | `len(nums)` | jumlah elemen |
| **Sort** | `sorted(nums)` | list terurut |

**Relevansi di Data Analyst:**
List adalah fondasi untuk memahami **Series** (Pandas) — keduanya mendukung indexing, slicing, dan iterasi. Ketika Anda menulis `df['kolom'].tolist()`, hasilnya adalah list.

---

### 5️⃣ Dictionary — Data Terstruktur Key-Value

Dictionary menyimpan pasangan **key-value** — sangat efisien untuk lookup data berdasarkan identifier.

```python
biodata = {
    'nama_lengkap': 'Nama Kamu',
    'nama_panggilan': 'Panggilan',
    'umur': 25,
    'kota': 'Jakarta'
}
print('Panggilan:', biodata['nama_panggilan'])
biodata
```

**Operasi umum dict:**

| Operasi | Contoh | Hasil |
| :--- | :--- | :--- |
| **Akses** | `biodata['umur']` | `25` |
| **Akses aman** | `biodata.get('alamat', 'N/A')` | `'N/A'` (default) |
| **Tambah/update** | `biodata['email'] = 'x@y.z'` | — |
| **Keys** | `biodata.keys()` | semua key |
| **Values** | `biodata.values()` | semua value |
| **Items** | `biodata.items()` | pasangan key-value |

**Relevansi di Data Analyst:**
Dictionary adalah dasar untuk memahami **JSON** (format API data) dan **DataFrame** (Pandas). Ketika Anda melakukan `df.to_dict()`, hasilnya adalah dictionary. Saat parsing API response, Anda bekerja dengan nested dict.

---

### 6️⃣ Function — Reusable Code Block

Fungsi memungkinkan Anda membungkus logika yang dapat dipanggil berulang kali.

```python
def to_hours(minutes):
    return minutes / 60.0

to_hours(160)   # → 2.666...
```

**Anatomi fungsi:**

```python
def nama_fungsi(parameter1, parameter2):
    """Docstring: penjelasan singkat fungsi."""
    # body
    hasil = parameter1 + parameter2
    return hasil
```

**Contoh fungsi analisis data yang lebih realistis:**

```python
def hitung_profit_margin(revenue, cost):
    """
    Menghitung profit margin dalam persen.
    
    Parameters
    ----------
    revenue : float — total pendapatan
    cost    : float — total biaya
    
    Returns
    -------
    float — profit margin (%)
    """
    if revenue == 0:
        return 0.0
    return ((revenue - cost) / revenue) * 100

# Pemakaian
print(f"Profit margin: {hitung_profit_margin(150_000_000, 90_000_000):.2f}%")
# Output: Profit margin: 40.00%
```

> [!IMPORTANT]
> **Best practice fungsi untuk Data Analyst:**
> - Selalu tambahkan **docstring** — jelaskan parameter dan return.
> - Gunakan **nama fungsi deskriptif** (`hitung_profit_margin` bukan `hpm`).
> - **Handle edge cases** — misalnya division by zero seperti contoh di atas.
> - **Return** hasil, jangan hanya `print` — hasil return bisa di-chain ke fungsi lain.

---

### 7️⃣ Bonus: Baca File CSV dengan Pandas

Jika file sample CSV tersedia di folder `data/sample.csv`, Anda bisa membacanya dengan Pandas.

```python
import pandas as pd
df = pd.read_csv('data/sample.csv')
df.head()
```

**Jika file CSV belum ada di Colab**, Anda bisa meng-upload dari komputer:

```python
from google.colab import files
uploaded = files.upload()   # Akan muncul dialog untuk pilih file

import pandas as pd
df = pd.read_csv(list(uploaded.keys())[0])
df.head()
```

Atau langsung dari URL publik:

```python
url = "https://raw.githubusercontent.com/plotly/datasets/master/tips.csv"
df = pd.read_csv(url)
df.head()
```

**Insight:** Fungsi `df.head()`, `df.info()`, dan `df.describe()` adalah tiga senjata utama Anda di 5 menit pertama saat menerima dataset baru.

---

## 🎯 Latihan Mandiri

Setelah menyelesaikan notebook, kerjakan latihan berikut untuk menguatkan pemahaman:

### Level ⭐ — Dasar

1. **Konversi Suhu:** Buat fungsi `celsius_to_fahrenheit(c)` yang mengubah Celsius ke Fahrenheit. Rumus: `F = C × 9/5 + 32`.

2. **Hitung Rata-rata List:** Buat fungsi `rata_rata(numbers)` yang menerima list angka dan mengembalikan rata-ratanya.

3. **Data Diri:** Buat dictionary `profil` dengan minimal 5 key (nama, umur, kota, pekerjaan, email), lalu print satu per satu menggunakan loop `for key, value in profil.items()`.

### Level ⭐⭐ — Menengah

4. **Kategorisasi Umur:** Buat fungsi `kategori_umur(umur)` yang mengembalikan:
   - `"Anak"` jika < 12
   - `"Remaja"` jika 12–17
   - `"Dewasa"` jika 18–59
   - `"Senior"` jika ≥ 60

5. **Segmentasi Customer:** Diberikan list transaksi `[150, 300, 85, 500, 120, 900, 45, 700]`, buat fungsi untuk:
   - Menghitung total revenue
   - Menghitung rata-rata transaksi
   - Menghitung jumlah transaksi di atas 200

6. **Stopword Remover:** Buat fungsi `hapus_stopword(text, stopwords)` yang menghapus kata-kata tertentu dari sebuah kalimat.

### Level ⭐⭐⭐ — Lanjut

7. **Mini Pipeline:** Gabungkan semua skill — buat fungsi `analisis_biodata(profil)` yang menerima dictionary biodata dan mengembalikan ringkasan dalam format string:
   ```text
   "Halo, saya [nama] dari [kota], usia saya [umur] tahun dan saya bekerja sebagai [pekerjaan]."
   ```

8. **Load & Describe CSV:** Upload CSV apapun (bisa dari [Kaggle](https://www.kaggle.com/datasets)), lalu tampilkan:
   - Jumlah baris & kolom
   - Tipe data setiap kolom
   - Statistik deskriptif untuk kolom numerik

---

## 🔧 Troubleshooting Colab

| Masalah | Penyebab | Solusi |
| :--- | :--- | :--- |
| **"Cannot save to Drive"** | Akun sekolah/organisasi dengan restriction | Gunakan akun Gmail pribadi, atau minta admin membuka akses |
| **`ModuleNotFoundError`** | Library belum ter-install | Jalankan `!pip install nama_library` di cell baru |
| **"Session disconnected"** | Idle terlalu lama / runtime reset | Runtime → Reconnect, lalu jalankan ulang dari cell pertama |
| **File CSV tidak ditemukan** | Path relatif salah / file belum di-upload | Gunakan `files.upload()` atau path absolut dari Google Drive |
| **Output tidak muncul** | Cell belum dijalankan | Tekan `Shift + Enter` atau klik ▶️ |
| **Runtime error `NameError`** | Variabel belum didefinisikan | Jalankan cell sebelumnya (import/variable definition) |
| **Lambat saat load besar** | Runtime CPU standar | Runtime → Change runtime type → GPU (jika tersedia) |

### 🔄 Reset Runtime (Solusi "Turn Off and On")

Jika notebook tiba-tiba error tanpa alasan jelas:

```text
Runtime → Restart runtime → Run all
```

Ini akan menghapus semua variabel di memory dan menjalankan ulang seluruh notebook dari cell pertama.

---

## 📁 Struktur Folder

Simpan file `README.md` ini di:

```text
📦 PROJECT-DATA-ANALYST/
├── 📁 13-introduction-to-python/
│   ├── 📄 README.md                          ← Anda di sini
│   ├── 📄 requirements.txt                   # Dependensi modul
│   ├── 📁 notebooks/
│   │   └── 📓 13_introduction_to_python.ipynb
│   └── 📁 data/
│       └── 📊 sample.csv                     # Sample dataset (opsional)
```

### `requirements.txt` untuk Modul Ini

```text
pandas>=2.0.0
numpy>=1.24.0
matplotlib>=3.7.0
seaborn>=0.12.0
```

---

## 📚 Resources & Referensi

### 📖 Dokumentasi Resmi

- [Python Official Tutorial](https://docs.python.org/3/tutorial/) — panduan resmi Python
- [Google Colab Documentation](https://research.google.com/colaboratory/faq.html) — FAQ & panduan Colab
- [Pandas Getting Started](https://pandas.pydata.org/docs/getting_started/index.html) — lanjut ke Pandas
- [W3Schools Python](https://www.w3schools.com/python/) — referensi cepat interaktif

### 🎥 Video Pembelajaran

- **freeCodeCamp — Python for Beginners** (YouTube, 4 jam)
- **Corey Schafer — Python Tutorials** (YouTube, playlist)
- **StatQuest — Python & Data Science** (YouTube)

### 🎯 Latihan Interaktif

- [**HackerRank Python**](https://www.hackerrank.com/domains/python) — latihan bertingkat
- [**LeetCode Easy**](https://leetcode.com/problemset/all/?difficulty=EASY&page=1&topicSlugs=python) — problem solving
- [**Codewars**](https://www.codewars.com/) — latihan gamifikasi

---

## 🔗 Modul Terkait

Modul ini adalah **prasyarat** untuk:

| Modul | Link |
| :--- | :--- |
| 📓 **Data Cleaning (Beginner)** | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/harrisariefkamis/PROJECT-DATA-ANALYST/blob/main/06-data-cleaning/notebooks/06_data_cleaning_beginner.ipynb) |
| 📓 **Data Cleaning (Advanced)** | [![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/harrisariefkamis/PROJECT-DATA-ANALYST/blob/main/06-data-cleaning/notebooks/06_data_cleaning_advanced.ipynb) |
| 📊 **NumPy & Pandas Fundamentals** | *(Coming soon)* |
| 🎨 **Data Visualization** | *(Coming soon)* |

---

## 🤝 Kontribusi

Menemukan typo, bug di notebook, atau ingin menambahkan latihan? Silakan:

1. Fork repositori
2. Buat branch fitur (`git checkout -b fix/typo-notebook`)
3. Commit perubahan (`git commit -m 'Fix: typo di section List'`)
4. Push dan buka **Pull Request**

## 📄 Lisensi

MIT License — bebas digunakan untuk keperluan edukasi.

---

<div align="center">

🐍 **Selamat belajar Python — langkah pertama menuju Data Analyst profesional!** 🐍

[⬆️ Kembali ke Atas](#-introduction-to-python--google-colab) · [📂 Indeks Modul](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST)

</div>

---

## 📝 Changelog

| Tanggal | Versi | Perubahan |
| :--- | :---: | :--- |
| 2026-10-21 | 1.0.0 | Initial release — modul pengenalan Python di Colab |
| — | — | *(tambahkan baris baru setiap update)* |

---

**Catatan untuk instruktur:** Modul ini dapat diselesaikan dalam **1–2 sesi (2–4 jam)** termasuk latihan. Untuk pemula total, alokasikan sesi tambahan untuk latihan mandiri di HackerRank.
