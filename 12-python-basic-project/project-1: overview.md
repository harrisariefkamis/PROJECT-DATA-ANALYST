# 🐍 Data Analysis with Python 1: Basic Python + Project 1

> Modul **fondasi** untuk calon Data Analyst. Pelajari dasar Python — variabel, list, dictionary, function, dan flow control — lalu terapkan langsung dalam **Project 1: analisis dataset sederhana** end-to-end menggunakan Python di Google Colab.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/)
![Python](https://img.shields.io/badge/Python-3.9%2B-blue?logo=python&logoColor=white)
![Colab](https://img.shields.io/badge/Google%20Colab-F9AB00?logo=googlecolab&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-2.0%2B-150458?logo=pandas&logoColor=white)
![Level](https://img.shields.io/badge/Level-Beginner-brightgreen)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📋 Daftar Isi

- [🎯 Tujuan Pembelajaran](#-tujuan-pembelajaran)
- [🛠 Prerequisites & Setup](#-prerequisites--setup)
- [📚 Materi 1: Variabel & Tipe Data](#-materi-1-variabel--tipe-data)
- [📚 Materi 2: List & Dictionary](#-materi-2-list--dictionary)
- [📚 Materi 3: Function](#-materi-3-function)
- [📚 Materi 4: Flow Control](#-materi-4-flow-control)
- [📚 Materi 5: Python untuk Eksplorasi Data](#-materi-5-python-untuk-eksplorasi-data)
- [🎯 Project 1: Analisis Dataset Sederhana](#-project-1-analisis-dataset-sederhana)
- [📦 Deliverables](#-deliverables)
- [📝 Rubrik Penilaian](#-rubrik-penilaian)
- [📚 Resources](#-resources--referensi)

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan modul ini, peserta diharapkan mampu:

- [x] **Memahami variabel & tipe data** — string, integer, float, boolean
- [x] **Menggunakan list & dictionary** untuk menyimpan dan mengelola data
- [x] **Membuat function** reusable dengan parameter, return, dan docstring
- [x] **Menerapkan flow control** — `if/elif/else`, `for`, `while`, `break/continue`
- [x] **Mengeksplorasi dataset** dengan Pandas — `head()`, `info()`, `describe()`, `groupby()`
- [x] **Menyelesaikan Project 1** — analisis dataset end-to-end dengan insight & rekomendasi

> [!NOTE]
> Modul ini adalah **prasyarat** untuk *Data Cleaning*, *NumPy*, *Pandas Lanjutan*, dan *Visualisasi Data*. Pastikan Anda menguasai semua materi di sini sebelum lanjut.

---

## 🛠 Prerequisites & Setup

### Library yang Dibutuhkan

```bash
pip install pandas numpy matplotlib
```

### Google Colab Setup

Buka [Google Colab](https://colab.research.google.com/) → **New Notebook** → lalu jalankan cell berikut:

```python
# Setup cell — jalankan sekali di awal
import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

pd.set_option('display.max_columns', 50)
print('Python', sys.version.split()[0])
print('pandas', pd.__version__)
```

### Struktur Folder Modul

```text
📦 14-data-analysis-python-1/
├── 📄 README.md
├── 📄 requirements.txt
├── 📁 notebooks/
│   ├── 📓 01_basic_python.ipynb       # Notebook materi dasar
│   └── 📓 02_project_1_analysis.ipynb # Notebook Project 1
└── 📁 data/
    └── 📊 sample_sales.csv            # Dataset Project 1
```

---

## 📚 Materi 1: Variabel & Tipe Data

Variabel adalah **wadah** untuk menyimpan nilai. Setiap nilai di Python memiliki **tipe data** yang menentukan operasi apa yang bisa dilakukan.

### Tipe Data Dasar

```python
# String — teks
nama = "Budi Santoso"
kota = 'Jakarta'

# Integer — bilangan bulat
umur = 28
jumlah_transaksi = 1500

# Float — bilangan desimal
harga = 25000.50
rata_rata = 85.7

# Boolean — True/False
is_active = True
is_premium = False

# NoneType — nilai kosong
email = None
```

### Cek Tipe Data

```python
print(type(nama))       # <class 'str'>
print(type(umur))       # <class 'int'>
print(type(harga))      # <class 'float'>
print(type(is_active))  # <class 'bool'>
```

### Konversi Tipe Data (Casting)

```python
# String ke integer
angka_str = "100"
angka_int = int(angka_str)         # 100

# String ke float
harga_str = "25000.50"
harga_float = float(harga_str)     # 25000.5

# Float ke integer (truncate, bukan round)
nilai = 3.99
nilai_int = int(nilai)             # 3

# Integer ke string
teks = str(100)                    # "100"

# Ke boolean (truthy/falsy)
bool(0)         # False
bool("")        # False
bool([])        # False
bool(1)         # True
bool("hello")   # True
```

> [!IMPORTANT]
> **Best practice di Data Analyst:**
> Saat menerima data dari CSV atau API, tipe data sering salah — misalnya `harga` terbaca sebagai string `"25.000"`. Anda perlu melakukan **casting eksplisit** sebelum analisis.

### Operator Aritmatika & Perbandingan

```python
# Aritmatika
a, b = 10, 3
print(a + b)    # 13
print(a - b)    # 7
print(a * b)    # 30
print(a / b)    # 3.333... (float division)
print(a // b)   # 3 (floor division)
print(a % b)    # 1 (modulo)
print(a ** b)   # 1000 (pangkat)

# Perbandingan → return boolean
print(10 > 5)    # True
print(10 == 10)  # True
print(10 != 5)   # True
print(5 <= 3)    # False
```

---

## 📚 Materi 2: List & Dictionary

### List — Koleksi Berurutan

List adalah **ordered**, **mutable**, dan bisa menampung berbagai tipe data.

```python
# Membuat list
transaksi = [150, 300, 85, 500, 120]

# Akses elemen
print(transaksi[0])      # 150 (index 0)
print(transaksi[-1])     # 120 (dari belakang)
print(transaksi[1:4])    # [300, 85, 500] (slicing)

# Modifikasi
transaksi.append(900)    # Tambah di akhir
transaksi.insert(0, 50)  # Tambah di index 0
transaksi.remove(85)     # Hapus nilai 85

# Operasi umum
print(len(transaksi))    # Panjang list
print(sum(transaksi))    # Total
print(max(transaksi))    # Nilai max
print(min(transaksi))    # Nilai min
print(sum(transaksi) / len(transaksi))  # Rata-rata
```

### Dictionary — Key-Value Pair

Dictionary menyimpan data berpasangan — sangat berguna untuk **record data terstruktur**.

```python
# Biodata satu customer
customer = {
    'id': 1001,
    'nama': 'Budi Santoso',
    'kota': 'Jakarta',
    'total_belanja': 2500000,
    'is_premium': True
}

# Akses
print(customer['nama'])                 # Budi Santoso
print(customer.get('email', 'N/A'))     # N/A (default)

# Modifikasi
customer['email'] = 'budi@email.com'    # Tambah key baru
customer['total_belanja'] += 500000     # Update value

# Iterasi
for key, value in customer.items():
    print(f"{key}: {value}")
```

### List of Dictionaries — Struktur Data Paling Umum

Ini adalah **pola yang paling sering** Anda temui di Data Analyst — merepresentasikan tabel data.

```python
# Data transaksi (mirip tabel)
transaksi_list = [
    {'id': 1, 'produk': 'Laptop', 'qty': 2, 'harga': 8000000},
    {'id': 2, 'produk': 'Mouse', 'qty': 5, 'harga': 150000},
    {'id': 3, 'produk': 'Keyboard', 'qty': 3, 'harga': 300000},
    {'id': 4, 'produk': 'Monitor', 'qty': 1, 'harga': 3500000},
]

# Hitung total revenue per transaksi
for t in transaksi_list:
    t['revenue'] = t['qty'] * t['harga']
    print(f"Transaksi #{t['id']}: {t['produk']} → Rp {t['revenue']:,}")

# Total revenue keseluruhan
total_revenue = sum(t['revenue'] for t in transaksi_list)
print(f"\nTotal revenue: Rp {total_revenue:,}")
```

> [!TIP]
> **Relevansi ke Pandas:** Struktur `list of dictionaries` di atas adalah **format persis** yang dikonsumsi oleh `pd.DataFrame(transaksi_list)`. Menguasai pola ini = menguasai fondasi DataFrame.

---

## 📚 Materi 3: Function

Function adalah **blok kode reusable** dengan parameter dan return value.

### Anatomi Function

```python
def nama_fungsi(parameter1, parameter2):
    """Docstring: jelaskan fungsi, parameter, return."""
    hasil = parameter1 + parameter2
    return hasil
```

### Contoh: Fungsi Analisis Dasar

```python
def hitung_revenue(qty, harga):
    """Hitung revenue dari qty × harga."""
    return qty * harga

def hitung_profit_margin(revenue, cost):
    """Hitung profit margin dalam persen, handle division by zero."""
    if revenue == 0:
        return 0.0
    return ((revenue - cost) / revenue) * 100

def kategori_umur(umur):
    """Kategorikan umur ke dalam kelompok."""
    if umur < 12:
        return 'Anak'
    elif umur < 18:
        return 'Remaja'
    elif umur < 60:
        return 'Dewasa'
    else:
        return 'Senior'

# Pemakaian
print(f"Revenue: Rp {hitung_revenue(3, 250000):,}")
print(f"Margin: {hitung_profit_margin(150_000_000, 90_000_000):.2f}%")
print(f"Kategori umur 25: {kategori_umur(25)}")
```

### Function dengan Default Parameter & Multiple Return

```python
def analisis_transaksi(transaksi_list, top_n=3):
    """
    Analisis list transaksi, return ringkasan.
    
    Returns
    -------
    dict dengan keys: total, rata_rata, top_n_produk
    """
    revenues = [t['qty'] * t['harga'] for t in transaksi_list]
    top = sorted(transaksi_list, key=lambda x: x['qty'] * x['harga'], reverse=True)[:top_n]
    
    return {
        'total': sum(revenues),
        'rata_rata': sum(revenues) / len(revenues),
        'top_n_produk': [t['produk'] for t in top]
    }

hasil = analisis_transaksi(transaksi_list, top_n=2)
print(hasil)
```

> [!IMPORTANT]
> **Best practice function untuk Data Analyst:**
> - **Selalu tulis docstring** — jelaskan parameter & return.
> - **Handle edge cases** — division by zero, list kosong, None.
> - **Nama deskriptif** — `hitung_profit_margin` bukan `hpm`.
> - **Return, jangan print** — hasil return bisa di-chain atau disimpan.
> - **Satu fungsi, satu tanggung jawab** — jangan gabung 5 operasi berbeda.

---

## 📚 Materi 4: Flow Control

Flow control mengatur **alur eksekusi** kode berdasarkan kondisi.

### 1️⃣ If / Elif / Else

```python
nilai = 85

if nilai >= 90:
    grade = 'A'
elif nilai >= 80:
    grade = 'B'
elif nilai >= 70:
    grade = 'C'
else:
    grade = 'D'

print(f"Nilai {nilai} → Grade {grade}")
```

### 2️⃣ For Loop — Iterasi

```python
# Iterasi list
for transaksi in transaksi_list:
    print(transaksi['produk'])

# Dengan enumerate (untuk dapat index)
for i, t in enumerate(transaksi_list):
    print(f"{i+1}. {t['produk']}")

# Dengan range
for i in range(5):
    print(i, end=' ')

# List comprehension — Pythonic way
revenues = [t['qty'] * t['harga'] for t in transaksi_list]
produk_mahal = [t['produk'] for t in transaksi_list if t['harga'] > 500000]

print(f"Total revenue: Rp {sum(revenues):,}")
print(f"Produk mahal: {produk_mahal}")
```

### 3️⃣ While Loop

```python
# While — loop sampai kondisi False
counter = 0
while counter < 5:
    print(f"Iterasi {counter}")
    counter += 1
```

### 4️⃣ Break & Continue

```python
# Break — hentikan loop
for n in range(10):
    if n == 5:
        break
    print(n, end=' ')   # 0 1 2 3 4

# Continue — skip iterasi ini, lanjut ke berikutnya
for n in range(10):
    if n % 2 == 0:
        continue
    print(n, end=' ')   # 1 3 5 7 9
```

### 5️⃣ Nested Loop & Try-Except

```python
# Nested loop — untuk analisis multi-level
kategori_data = {
    'Elektronik': [8000000, 3500000, 500000],
    'Fashion': [250000, 150000, 300000],
    'Makanan': [50000, 75000, 30000]
}

for kategori, harga_list in kategori_data.items():
    total = sum(harga_list)
    print(f"{kategori}: Rp {total:,}")

# Try-except — handle error dengan graceful
def safe_divide(a, b):
    try:
        return a / b
    except ZeroDivisionError:
        print(f"Warning: division by zero ({a}/{b})")
        return 0.0

print(safe_divide(10, 2))   # 5.0
print(safe_divide(10, 0))   # Warning + 0.0
```

> [!TIP]
> **Kapan pakai apa?**
> | Situasi | Gunakan |
> | :--- | :--- |
> | Tahu jumlah iterasi | `for` |
> | Iterasi sampai kondisi | `while` |
> | Transformasi list → list | **List comprehension** |
> | Filter list → list | **List comprehension** dengan `if` |
> | Loop dengan index | `enumerate()` |
> | Loop 2+ list paralel | `zip()` |

---

## 📚 Materi 5: Python untuk Eksplorasi Data

Setelah menguasai dasar Python, saatnya **menerapkan ke data nyata** dengan Pandas.

### Load Dataset

```python
import pandas as pd

# Load dari URL publik
url = "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv"
df = pd.read_csv(url)

print(f"Shape: {df.shape}")   # (244, 7)
```

### 5 Menit Pertama Eksplorasi

Ketika menerima dataset baru, selalu lakukan **5 langkah ini**:

```python
# 1. Lihat 5 baris pertama & terakhir
print(df.head())
print(df.tail())

# 2. Info struktur — tipe data & missing values
print(df.info())

# 3. Statistik deskriptif untuk kolom numerik
print(df.describe())

# 4. Cek missing values
print(df.isnull().sum())

# 5. Cek duplikat
print(f"Duplikat: {df.duplicated().sum()}")
```

### Akses Kolom & Baris

```python
# Akses satu kolom
total_bill = df['total_bill']

# Akses beberapa kolom
subset = df[['total_bill', 'tip', 'day']]

# Filter baris berdasarkan kondisi
df_kamis = df[df['day'] == 'Thur']
df_mahal = df[df['total_bill'] > 30]

# Filter multi-kondisi (& = AND, | = OR)
df_filtered = df[(df['total_bill'] > 20) & (df['day'] == 'Sat')]
```

### GroupBy — Agregasi per Kategori

```python
# Rata-rata tip per hari
avg_tip = df.groupby('day')['tip'].mean()
print(avg_tip)

# Multiple agregasi
summary = df.groupby('day').agg({
    'total_bill': ['mean', 'sum', 'count'],
    'tip': ['mean', 'max']
})
print(summary)
```

### Feature Engineering

```python
# Buat kolom baru
df['tip_pct'] = (df['tip'] / df['total_bill']) * 100

# Kategorisasi
df['bill_category'] = pd.cut(
    df['total_bill'],
    bins=[0, 15, 30, 100],
    labels=['Murah', 'Sedang', 'Mahal']
)

print(df[['total_bill', 'tip_pct', 'bill_category']].head())
```

> [!IMPORTANT]
> **Kebiasaan penting:**
> - Selalu `df.copy()` sebelum modifikasi subset.
> - Jangan `dropna(inplace=True)` tanpa analisis — bisa kehilangan data penting.
> - Cek `df.dtypes` sebelum groupby/merge — `int` vs `str` di kolom ID bisa silent bug.

---

## 🎯 Project 1: Analisis Dataset Sederhana

**Tujuan:** Terapkan semua materi di atas dalam **satu project end-to-end** menggunakan dataset riil.

### 📌 Requirements

Pilih **satu** dari dua opsi berikut:

| Opsi | Dataset | Level |
| :--- | :--- | :--- |
| **A (Rekomendasi)** | **Tips Dataset** (244 baris) — `sns.load_dataset('tips')` | ⭐ Pemula |
| **B** | **Sample Sales** (CSV di folder `data/sample_sales.csv`) | ⭐⭐ Pemula-Menengah |

### 📝 Alur Project

```text
1. LOAD       → baca dataset dengan Pandas
2. INSPECT    → head, info, describe, missing check
3. CLEAN      → handle missing values & tipe data
4. ANALYZE    → groupby, filter, feature engineering
5. INSIGHT    → temukan 3 insight utama
6. RECOMMEND  → berikan 2 rekomendasi actionable
```

### 💻 Template Project 1

Berikut kerangka notebook `02_project_1_analysis.ipynb`:

```python
# ============================================
# PROJECT 1: ANALISIS DATASET TIPS
# ============================================

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# ---------- STEP 1: LOAD ----------
url = "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv"
df = pd.read_csv(url)
print(f"Dataset shape: {df.shape}")

# ---------- STEP 2: INSPECT ----------
print("\n=== 5 Baris Pertama ===")
print(df.head())

print("\n=== Info Dataset ===")
print(df.info())

print("\n=== Statistik Deskriptif ===")
print(df.describe().round(2))

print("\n=== Missing Values ===")
print(df.isnull().sum())

# ---------- STEP 3: CLEAN ----------
# (Tips dataset bersih — contoh handle jika ada missing)
# df['total_bill'] = df['total_bill'].fillna(df['total_bill'].median())

# ---------- STEP 4: ANALYZE ----------
# Q1: Hari apa yang paling ramai?
transaksi_per_hari = df.groupby('day').agg({
    'total_bill': ['sum', 'mean', 'count']
}).round(2)
print("\n=== Revenue per Hari ===")
print(transaksi_per_hari)

# Q2: Bagaimana pola tip?
df['tip_pct'] = (df['tip'] / df['total_bill']) * 100
print(f"\nRata-rata tip: {df['tip_pct'].mean():.2f}%")

# Q3: Perbedaan per gender / smoker
per_gender = df.groupby('sex')['total_bill'].mean().round(2)
print(f"\nRata-rata bill per gender:\n{per_gender}")

# ---------- STEP 5: INSIGHT ----------
# Isi setelah analisis:

# ---------- STEP 6: RECOMMEND ----------
# Isi setelah analisis:
```

### 📊 Contoh Output Analisis

Setelah menjalankan kerangka di atas, isi bagian **insight** dan **recommendation** seperti contoh berikut:

```markdown
## 📌 Insight Utama

1. **Sabtu adalah hari paling profitable**
   - Total bill hari Sabtu: $1,776 (tertinggi dari semua hari)
   - Rata-rata bill per transaksi hari Sabtu: $20.44
   - **Implikasi:** Alokasikan staf & stok ekstra di hari Sabtu.

2. **Tip rate relatif konsisten di semua hari**
   - Rata-rata tip: ~15%
   - Range antar hari: 14.5% – 16.2% (selisih kecil)
   - **Implikasi:** Tip tidak bergantung hari; kualitas pelayanan konsisten.

3. **Pria cenderung spending lebih tinggi**
   - Rata-rata bill pria: $19.79 vs wanita: $18.06 (+9.6%)
   - Namun tip percentage hampir sama (~15%)
   - **Implikasi:** Segmentasi marketing bisa fokus ke audiens pria untuk upsell.

## 🎯 Rekomendasi Actionable

| Priority | Action | Expected Impact |
| :--- | :--- | :--- |
| 🔴 High | Tambah staf di hari Sabtu | Kurangi wait time, +10% customer turnover |
| 🟡 Med  | Upsell menu premium ke pelanggan pria | +5-8% avg bill |
| 🟢 Low  | Retain program loyalitas berbasis tip % | +2% repeat customer |
```

### 🎁 Bonus: Visualisasi Sederhana

```python
fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# 1. Bar chart — total bill per hari
df.groupby('day')['total_bill'].sum().plot(
    kind='bar', ax=axes[0], color='#4C72B0'
)
axes[0].set_title('Total Bill per Hari')
axes[0].set_ylabel('USD')

# 2. Histogram — distribusi tip percentage
axes[1].hist(df['tip_pct'], bins=20, color='#55A868', edgecolor='white')
axes[1].set_title('Distribusi Tip Percentage')
axes[1].set_xlabel('Tip (%)')

plt.tight_layout()
plt.show()
```

---

## 📦 Deliverables

### 📁 File yang Dikumpulkan

```text
📦 14-data-analysis-python-1/
├── 📄 README.md
├── 📓 notebooks/
│   ├── 01_basic_python.ipynb          # Notebook materi dasar
│   └── 02_project_1_analysis.ipynb    # Notebook Project 1
└── 📝 laporan_project1.md             # Laporan 1 halaman
```

### 📝 Template `laporan_project1.md`

```markdown
# 📊 Laporan Project 1: Analisis [Nama Dataset]

## 1. Dataset
- **Sumber**: [URL / file]
- **Ukuran**: [n baris × m kolom]
- **Periode**: [jika ada]

## 2. Metodologi
- Load & inspect dengan Pandas
- Cleaning: [teknik yang dipakai]
- Analisis: groupby, filter, feature engineering

## 3. Temuan Utama (3 insight)
1. [Insight 1] — [angka] → [implikasi]
2. [Insight 2] — [angka] — [implikasi]
3. [Insight 3] — [angka] — [implikasi]

## 4. Rekomendasi (min 2 action)
| Priority | Action | Expected Impact |
| :--- | :--- | :--- |
| 🔴 High | [action] | [impact] |
| 🟡 Med  | [action] | [impact] |

## 5. Refleksi
- Materi apa yang paling menantang?
- Bagaimana perasaan Anda menggunakan Python pertama kali?
- Apa yang ingin diperdalam?
```

---

## 📝 Rubrik Penilaian

### Notebook Python Dasar (40%)

| Kriteria | Bobot | Indikator |
| :--- | :---: | :--- |
| **Variabel & tipe data** | 10% | Minimal 5 contoh tiap tipe, dengan casting |
| **List & dictionary** | 15% | Minimal 3 exercise masing-masing |
| **Function** | 15% | Minimal 3 fungsi dengan docstring & return |

### Project 1 (60%)

| Kriteria | Bobot | Indikator |
| :--- | :---: | :--- |
| **Load & inspect** | 10% | 5-langkah eksplorasi lengkap |
| **Cleaning** | 10% | Handle missing/duplikat dengan alasan |
| **Analisis** | 20% | Minimal 3 pertanyaan bisnis dengan groupby/filter |
| **Insight** | 10% | 3 insight didukung angka |
| **Rekomendasi** | 5% | Minimal 2 action actionable |
| **Kode readability** | 5% | Komentar, naming, struktur jelas |

### Grade Scale

| Grade | Range | Predikat |
| :-: | :--- | :--- |
| **A** | 85–100 | Excellent — kode bersih, insight tajam, rekomendasi actionable |
| **B** | 70–84 | Good — semua deliverable lengkap, insight cukup |
| **C** | 55–69 | Fair — ada beberapa kekurangan di analisis/insight |
| **D** | < 55 | Needs improvement — deliverable tidak lengkap |

---

## 📚 Resources & Referensi

### 📖 Dokumentasi Resmi
- [Python Official Tutorial](https://docs.python.org/3/tutorial/) — panduan resmi
- [Pandas Getting Started](https://pandas.pydata.org/docs/getting_started/index.html)
- [Pandas 10 Minutes Tutorial](https://pandas.pydata.org/docs/user_guide/10min.html)

### 🎥 Video Pembelajaran
- **Corey Schafer — Python Tutorials** (YouTube)
- **Keith Galli — Complete Python Pandas Tutorial** (YouTube, 1.5 jam)
- **StatQuest — Python for Data Science** (YouTube)

### 🎯 Latihan Interaktif
- [**Kaggle Learn — Python**](https://www.kaggle.com/learn/python) — kursus gratis
- [**Kaggle Learn — Pandas**](https://www.kaggle.com/learn/pandas)
- [**HackerRank Python**](https://www.hackerrank.com/domains/python)

### 📊 Dataset Rekomendasi untuk Project 1

| Dataset | Ukuran | Link |
| :--- | :---: | :--- |
| **Tips** | 244 × 7 | `sns.load_dataset('tips')` |
| **Titanic** | 891 × 12 | [Kaggle](https://www.kaggle.com/c/titanic) |
| **Iris** | 150 × 5 | `sns.load_dataset('iris')` |
| **Penguins** | 344 × 7 | `sns.load_dataset('penguins')` |
| **Netflix Titles** | 8.8k × 12 | [Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows) |

---

## 🔗 Modul Terkait

| Modul | Status |
| :--- | :--- |
| 🐍 **Introduction to Python (Colab)** | ✅ Selesai |
| 📓 **Data Cleaning** | [Buka](../06-data-cleaning/README.md) |
| 📊 **NumPy & Pandas Fundamentals** | *(Coming soon)* |
| 🎨 **Data Visualisation 1** | *(Coming soon)* |

---

## 🤝 Kontribusi

Menemukan typo, bug, atau ingin menambahkan latihan? Silakan buka **Pull Request** atau **Issue**.

## 📄 Lisensi

MIT License — tidak bebas digunakan untuk edukasi & komersial.

---

<div align="center">

🎯 **Selesaikan Project 1 dan Anda selangkah lebih dekat menjadi Data Analyst!** 🎯

[⬆️ Kembali ke Atas](#-data-analysis-with-python-1-basic-python--project-1)

</div>

---

## 📝 Changelog

| Tanggal | Versi | Perubahan |
| :--- | :---: | :--- |
| 2026-09-01 | 1.0.0 | Initial release — Basic Python + Project 1 |

---

**Catatan untuk instruktur:** Modul ini dapat diselesaikan dalam **2–3 sesi** (masing-masing 2 jam). Sesi 1: Variabel–Dictionary–Function. Sesi 2: Flow control + eksplorasi Pandas. Sesi 3 (opsional): kerjakan Project 1 dengan asistensi.
