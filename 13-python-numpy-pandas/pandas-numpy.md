# 📊 Panduan Lengkap Analisis Data: NumPy, Pandas & Studi Kasus Iris

> **Repositori ini** berisi panduan komprehensif untuk mempelajari dasar-dasar manipulasi data menggunakan **NumPy** dan **Pandas**, serta penerapannya dalam studi kasus nyata menggunakan dataset **Iris**. Cocok untuk pemula yang ingin memulai karir sebagai Data Analyst.

![Python](https://img.shields.io/badge/Python-3.9%2B-blue)
![Pandas](https://img.shields.io/badge/Pandas-2.0%2B-green)
![NumPy](https://img.shields.io/badge/NumPy-1.24%2B-orange)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📑 Daftar Isi

1. [Instalasi Pustaka](#-instalasi-pustaka)
2. [NumPy: Array dan Operasi Dasar](#1-numpy-array-dan-operasi-dasar)
3. [Pandas: DataFrame dan Series](#2-pandas-dataframe-dan-series)
4. [Filter, GroupBy, dan Merge](#3-filter-groupby-dan-merge)
5. [Transformasi Data](#4-transformasi-data)
6. [Studi Kasus: Analisis Dataset Iris](#5-studi-kasus-analisis-dataset-iris)
7. [Ringkasan](#-ringkasan)
8. [Struktur Repositori](#-struktur-repositori)

---

## 📦 Instalasi Pustaka

Sebelum memulai, pastikan Anda telah menginstal pustaka yang dibutuhkan. Jalankan perintah berikut di terminal:

```bash
pip install pandas numpy
```

Atau jika menggunakan `requirements.txt`:

```text
pandas>=2.0.0
numpy>=1.24.0
scikit-learn>=1.3.0
```

---

## 1. NumPy: Array dan Operasi Dasar

NumPy adalah fondasi komputasi numerik di Python. Struktur data utamanya adalah `ndarray` (array multidimensi) yang jauh lebih cepat dan efisien dibandingkan list bawaan Python.

### Membuat Array

```python
import numpy as np

# Array 1D dari list
arr_1d = np.array([1, 2, 3, 4, 5])

# Array 2D (matriks)
arr_2d = np.array([[1, 2, 3], [4, 5, 6]])

# Array dengan nilai nol atau satu
zeros = np.zeros((3, 3))
ones = np.ones((2, 4))

# Array dengan rentang nilai
range_arr = np.arange(0, 10, 2)      # [0, 2, 4, 6, 8]
linspace_arr = np.linspace(0, 1, 5)  # 5 nilai dari 0 sampai 1
```

### Atribut dan Operasi Array

```python
# Atribut penting
print(arr_2d.shape)   # (2, 3)
print(arr_2d.ndim)    # 2
print(arr_2d.dtype)   # int64

# Operasi aritmatika (vektorisasi)
print(arr_1d + 10)    # Menambahkan 10 ke setiap elemen
print(arr_1d * 2)     # Mengalikan setiap elemen dengan 2

# Statistik dasar
print(np.mean(arr_1d))    # Rata-rata
print(np.std(arr_1d))     # Standar deviasi
print(np.max(arr_1d))     # Nilai maksimum
print(np.min(arr_1d))     # Nilai minimum
```

---

## 2. Pandas: DataFrame dan Series

Pandas menyediakan struktur data `DataFrame` (tabel 2D) dan `Series` (kolom 1D) untuk manipulasi data yang lebih ekspresif dan mudah dibaca.

### Membuat DataFrame

```python
import pandas as pd

# Dari dictionary
data = {
    'Nama': ['Alice', 'Bob', 'Charlie'],
    'Usia': [25, 30, 35],
    'Kota': ['Jakarta', 'Bandung', 'Surabaya']
}
df = pd.DataFrame(data)
```

### Inspeksi Data

```python
df.head()       # 5 baris pertama
df.tail()       # 5 baris terakhir
df.info()       # Informasi tipe data dan nilai non-null
df.describe()   # Statistik deskriptif untuk kolom numerik
df.shape        # (jumlah_baris, jumlah_kolom)
df.columns      # Daftar nama kolom
df.dtypes       # Tipe data setiap kolom
```

### Membaca Dataset Publik

```python
# Dari file CSV
df = pd.read_csv('dataset.csv')

# Dari URL
df = pd.read_csv('https://raw.githubusercontent.com/user/repo/main/dataset.csv')

# Dari file Excel
df = pd.read_excel('dataset.xlsx')
```

---

## 3. Filter, GroupBy, dan Merge

### 🔍 Filtering Data

Filtering digunakan untuk memilih baris berdasarkan kondisi tertentu.

```python
# Filter dengan kondisi tunggal
df_filtered = df[df['Usia'] > 28]

# Filter dengan beberapa kondisi (gunakan & untuk AND, | untuk OR)
df_filtered_2 = df[(df['Usia'] > 25) & (df['Kota'] == 'Jakarta')]

# Filter dengan .isin()
df_filtered_3 = df[df['Kota'].isin(['Jakarta', 'Bandung'])]

# Filter dengan .query() (lebih mudah dibaca)
df_filtered_4 = df.query('Usia > 25 and Kota == "Jakarta"')
```

### 📊 GroupBy dan Agregasi

`groupby` memungkinkan Anda mengelompokkan data berdasarkan kolom tertentu dan menerapkan fungsi agregasi.

```python
# Rata-rata usia per kota
grouped = df.groupby('Kota')['Usia'].mean()
print(grouped)

# Multiple agregasi
agg_result = df.groupby('Kota')['Usia'].agg(['mean', 'count', 'max'])
print(agg_result)

# GroupBy dengan beberapa kolom
multi_group = df.groupby(['Kota', 'Kategori']).agg({
    'Usia': ['mean', 'count'],
    'Nilai': 'sum'
})
```

### 🔗 Merge (Penggabungan DataFrame)

`merge` digunakan untuk menggabungkan dua DataFrame berdasarkan kolom kunci yang sama, mirip dengan JOIN pada SQL.

```python
# DataFrame contoh
df1 = pd.DataFrame({'ID': [1, 2, 3], 'Nama': ['Alice', 'Bob', 'Charlie']})
df2 = pd.DataFrame({'ID': [2, 3, 4], 'Nilai': [85, 90, 78]})

# Inner join (hanya ID yang cocok)
inner_merge = pd.merge(df1, df2, on='ID', how='inner')

# Left join (semua baris dari df1)
left_merge = pd.merge(df1, df2, on='ID', how='left')

# Right join (semua baris dari df2)
right_merge = pd.merge(df1, df2, on='ID', how='right')

# Outer join (semua baris dari kedua tabel)
outer_merge = pd.merge(df1, df2, on='ID', how='outer')
```

---

## 4. Transformasi Data

Transformasi data mencakup pembuatan kolom baru, penerapan fungsi, dan penanganan data yang hilang.

```python
# Membuat kolom baru berdasarkan perhitungan
df['Usia_Dalam_Bulan'] = df['Usia'] * 12

# Menerapkan fungsi kustom dengan apply()
df['Kategori_Usia'] = df['Usia'].apply(lambda x: 'Muda' if x < 30 else 'Dewasa')

# Menerapkan fungsi ke seluruh DataFrame dengan map()
df['Kota'] = df['Kota'].map({'Jakarta': 'JKT', 'Bandung': 'BDG'})

# Menangani missing values
df['Kolom_Baru'] = df['Kolom_Baru'].fillna(0)   # Mengisi NaN dengan 0
df.dropna(inplace=True)                          # Menghapus baris dengan NaN

# Mengganti nilai
df['Kota'] = df['Kota'].replace('Jakarta', 'DKI Jakarta')

# Mengurutkan data
df_sorted = df.sort_values(by='Usia', ascending=False)
```

---

## 5. Studi Kasus: Analisis Dataset Iris

Dataset **Iris** adalah dataset klasik yang berisi **150 sampel** bunga Iris dari **tiga spesies** (*setosa*, *versicolor*, *virginica*) dengan empat fitur:

- Panjang sepal (cm)
- Lebar sepal (cm)
- Panjang petal (cm)
- Lebar petal (cm)

### 📥 Memuat Data

```python
# Opsi 1: Dari scikit-learn
from sklearn.datasets import load_iris
iris = load_iris()
df_iris = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df_iris['species'] = iris.target
df_iris['species'] = df_iris['species'].map({0: 'setosa', 1: 'versicolor', 2: 'virginica'})

# Opsi 2: Dari file CSV
# df_iris = pd.read_csv('Iris.csv')
```

### 🔍 Eksplorasi Data Awal

```python
print("=== Informasi Dataset ===")
print(df_iris.info())

print("\n=== Statistik Deskriptif ===")
print(df_iris.describe())

print("\n=== Jumlah Sampel per Spesies ===")
print(df_iris['species'].value_counts())
```

### 📊 Analisis GroupBy

Hitung rata-rata setiap fitur untuk masing-masing spesies.

```python
# Rata-rata fitur per spesies
species_means = df_iris.groupby('species').mean()
print(species_means)
```

**Insight:** Dari hasil ini, kita bisa melihat bahwa **setosa** memiliki petal yang jauh lebih pendek dan sempit dibandingkan dua spesies lainnya. Hal ini menunjukkan bahwa **fitur petal adalah pemisah terkuat antar spesies**.

### 🔍 Filtering Data

Contoh: Menampilkan hanya bunga dengan panjang petal lebih dari 5 cm.

```python
# Filter berdasarkan panjang petal
petal_panjang = df_iris[df_iris['petal length (cm)'] > 5]
print(f"Jumlah sampel dengan petal > 5 cm: {len(petal_panjang)}")
```

### ⚙️ Transformasi Data

Membuat kolom baru untuk rasio panjang terhadap lebar petal.

```python
df_iris['petal_ratio'] = df_iris['petal length (cm)'] / df_iris['petal width (cm)']

# Melihat rata-rata rasio per spesies
print(df_iris.groupby('species')['petal_ratio'].mean())
```

### 🎯 Kesimpulan Studi Kasus

1. **Setosa** dapat dipisahkan dengan mudah menggunakan fitur petal (panjang petal < 2 cm).
2. **Versicolor** dan **virginica** memiliki karakteristik yang lebih mirip, sehingga memerlukan analisis multivariat.
3. **Rasio petal** menunjukkan pola khas per spesies yang dapat digunakan sebagai fitur tambahan untuk klasifikasi.

---

## 📝 Ringkasan

| Konsep | Fungsi Utama | Contoh Penggunaan |
| :--- | :--- | :--- |
| **NumPy Array** | `np.array()`, `np.zeros()`, `np.arange()` | Komputasi numerik cepat |
| **Pandas DataFrame** | `pd.DataFrame()` | Manipulasi data tabular |
| **Filter** | `df[df['kolom'] > nilai]` | Memilih subset data |
| **GroupBy** | `df.groupby('kolom').mean()` | Agregasi per kelompok |
| **Merge** | `pd.merge(df1, df2, on='kunci')` | Menggabungkan tabel |
| **Transformasi** | `df['baru'] = ...`, `df.apply()` | Membuat/mengubah kolom |

---

## 📂 Struktur Repositori

```text
📦 numpy-pandas-analisis-data/
├── 📄 README.md                # Panduan lengkap (file ini)
├── 📄 requirements.txt         # Daftar pustaka yang dibutuhkan
├── 📁 data/
│   └── Iris.csv                # Dataset Iris (opsional)
├── 📁 notebooks/
│   └── analisis_iris.ipynb     # Jupyter Notebook studi kasus
└── 📁 src/
    ├── numpy_basics.py         # Contoh kode NumPy
    ├── pandas_basics.py        # Contoh kode Pandas
    └── iris_analysis.py        # Studi kasus lengkap
```

### 🚀 Cara Menjalankan

```bash
# 1. Clone repositori
git clone https://github.com/username/numpy-pandas-analisis-data.git
cd numpy-pandas-analisis-data

# 2. Install dependencies
pip install -r requirements.txt

# 3. Jalankan contoh kode
python src/iris_analysis.py
```

---

## 🤝 Kontribusi

Kontribusi selalu terbuka! Silakan buat **Pull Request** atau ajukan **Issue** jika Anda menemukan bug atau ingin menambahkan materi baru.

## 📄 Lisensi

Proyek ini dilisensikan di bawah **MIT License** — tidak bebas digunakan, dimodifikasi, dan didistribusikan.

---

⭐ **Jika repositori ini bermanfaat, jangan lupa beri bintang!** ⭐
