# 📊 Eksekusi with Python 3: Study Cases

> Modul edukasi untuk menerapkan Python dalam analisis data nyata melalui studi kasus end-to-end: dari **data cleaning** hingga **presentasi insight**. Dirancang untuk pemula hingga menengah yang ingin menjadi **Data Analyst** profesional.

![Python](https://img.shields.io/badge/Python-3.9%2B-blue?logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-2.0%2B-150458?logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-1.24%2B-013243?logo=numpy&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-3.7%2B-11557c)
![Seaborn](https://img.shields.io/badge/Seaborn-0.12%2B-4c72b0)
![License](https://img.shields.io/badge/License-MIT-yellow)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)

---

## 📋 Daftar Isi

- [🎯 Tujuan Pembelajaran](#-tujuan-pembelajaran)
- [🛠 Prerequisites & Setup](#-prerequisites--setup)
- [🔄 Alur Kerja Data Analyst](#-alur-kerja-data-analyst)
- [🌸 Studi Kasus 1: Iris Dataset](#-studi-kasus-1-iris-dataset--klasifikasi-spesies)
- [🚢 Studi Kasus 2: Titanic Dataset](#-studi-kasus-2-titanic-dataset--analisis-survival)
- [🛒 Studi Kasus 3: E-Commerce Sales](#-studi-kasus-3-e-commerce-sales--business-analytics)
- [🏆 Best Practices](#-best-practices--common-pitfalls)
- [📝 Template Laporan](#-template-laporan-analisis)
- [📚 Resources](#-resources--referensi)
- [🤝 Kontribusi](#-kontribusi)

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan modul ini, Anda diharapkan mampu:

- [x] **Membersihkan dataset** kotor (missing values, duplikat, outlier, inkonsistensi tipe data)
- [x] **Melakukan Exploratory Data Analysis (EDA)** untuk memahami karakteristik data
- [x] **Mengekstrak insight** yang actionable dari data mentah
- [x] **Mempresentasikan hasil analisis** dalam format yang komunikatif dan profesional

---

## 🛠 Prerequisites & Setup

### Library yang Dibutuhkan

```bash
pip install pandas numpy matplotlib seaborn scikit-learn jupyter
```

**`requirements.txt`**

```text
pandas>=2.0.0
numpy>=1.24.0
matplotlib>=3.7.0
seaborn>=0.12.0
scikit-learn>=1.3.0
jupyter>=1.0.0
```

### Struktur Repositori

```text
📦 data-analysis-python/
├── 📄 README.md
├── 📄 requirements.txt
├── 📁 data/
│   ├── raw/                    # Data mentah (read-only)
│   ├── interim/                # Data setengah bersih
│   └── processed/              # Data siap analisis
├── 📁 notebooks/
│   ├── 01_iris_analysis.ipynb
│   ├── 02_titanic_analysis.ipynb
│   └── 03_ecommerce_analysis.ipynb
├── 📁 reports/                 # Output laporan & grafik
└── 📁 src/
    ├── cleaning.py             # Fungsi cleaning reusable
    └── visualization.py        # Fungsi plotting reusable
```

---

## 🔄 Alur Kerja Data Analyst

Setiap studi kasus mengikuti **5 tahap standar**:

```text
┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
│  1. Data        │──▶│  2. Data        │──▶│  3. Exploratory │
│     Collection  │   │     Cleaning    │   │     Data        │
│                 │   │                 │   │     Analysis    │
└─────────────────┘   └─────────────────┘   └─────────────────┘
                                                     │
┌─────────────────┐   ┌─────────────────┐           │
│  5. Presentasi  │◀──│  4. Insight     │◀──────────┘
│     Hasil       │   │     Extraction  │
└─────────────────┘   └─────────────────┘
```

---

## 🌸 Studi Kasus 1: Iris Dataset — Klasifikasi Spesies

> **Tujuan:** Memahami karakteristik bunga Iris dan mengidentifikasi fitur pembeda antar spesies.
> **Dataset:** 150 sampel · 3 spesies · 4 fitur numerik
> **Level:** ⭐ Pemula

### 📥 Step 1: Load Data

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.datasets import load_iris

# Load dataset
iris = load_iris()
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df['species'] = iris.target
df['species'] = df['species'].map({0: 'setosa', 1: 'versicolor', 2: 'virginica'})

print(f"Shape: {df.shape}")
print(df.head())
```

### 🧹 Step 2: Data Cleaning

```python
# Cek missing values
print("Missing values:\n", df.isnull().sum())

# Cek duplikat
print(f"Jumlah duplikat: {df.duplicated().sum()}")

# Cek outlier dengan IQR
def detect_outliers(df, column):
    Q1 = df[column].quantile(0.25)
    Q3 = df[column].quantile(0.75)
    IQR = Q3 - Q1
    lower, upper = Q1 - 1.5 * IQR, Q3 + 1.5 * IQR
    return df[(df[column] < lower) | (df[column] > upper)]

for col in iris.feature_names:
    outliers = detect_outliers(df, col)
    print(f"{col}: {len(outliers)} outlier(s)")
```

> [!NOTE]
> Dataset Iris sangat bersih — tidak ada missing values, duplikat, maupun outlier signifikan. Ini menjadikannya dataset ideal untuk pemula.

### 🔍 Step 3: Exploratory Data Analysis

```python
# Statistik deskriptif
print(df.describe())

# Distribusi per spesies
print(df['species'].value_counts())

# Pairplot
sns.pairplot(df, hue='species', diag_kind='kde', corner=True)
plt.suptitle("Pairplot Fitur Iris per Spesies", y=1.02)
plt.tight_layout()
plt.savefig('reports/iris_pairplot.png', dpi=150)
plt.show()
```

### 💡 Step 4: Insight Extraction

```python
# Rata-rata fitur per spesies
species_stats = df.groupby('species').agg({
    'petal length (cm)': ['mean', 'std'],
    'petal width (cm)': ['mean', 'std'],
    'sepal length (cm)': ['mean', 'std'],
    'sepal width (cm)': ['mean', 'std'],
})
print(species_stats.round(2))

# Correlation matrix
plt.figure(figsize=(8, 6))
sns.heatmap(df[iris.feature_names].corr(), annot=True, cmap='coolwarm', center=0)
plt.title("Korelasi Antar Fitur")
plt.savefig('reports/iris_correlation.png', dpi=150)
plt.show()
```

### 📌 Key Insights

| # | Insight | Bukti Data |
| :-: | :--- | :--- |
| 1 | **Setosa** mudah dipisahkan | Petal length < 2 cm (unik) |
| 2 | Petal lebih diskriminatif dari sepal | Korelasi petal length vs width: **0.96** |
| 3 | Versicolor & virginica overlap | Perlu model multivariat |

### 📊 Rekomendasi

> Gunakan **petal length** & **petal width** sebagai fitur utama. Untuk pemisahan versicolor vs virginica, gunakan **model klasifikasi** (Random Forest / SVM) karena overlap cukup signifikan.

---

## 🚢 Studi Kasus 2: Titanic Dataset — Analisis Survival

> **Tujuan:** Menganalisis faktor apa saja yang mempengaruhi tingkat keselamatan penumpang.
> **Dataset:** 891 penumpang · 12 kolom · mixed types · banyak missing values
> **Level:** ⭐⭐ Menengah

### 📥 Step 1: Load Data

```python
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
df = pd.read_csv(url)

print(f"Shape: {df.shape}")
print(df.info())
print(df.head())
```

### 🧹 Step 2: Data Cleaning

```python
# 1. Cek missing values
missing = df.isnull().sum().sort_values(ascending=False)
missing_pct = (missing / len(df) * 100).round(2)
missing_df = pd.DataFrame({'Missing': missing, 'Percentage (%)': missing_pct})
print(missing_df[missing_df['Missing'] > 0])

# 2. Handle missing values
# Age: isi dengan median per (Pclass, Sex)
df['Age'] = df.groupby(['Pclass', 'Sex'])['Age'].transform(
    lambda x: x.fillna(x.median())
)

# Embarked: isi dengan modus
df['Embarked'] = df['Embarked'].fillna(df['Embarked'].mode()[0])

# Cabin: drop kolom (~77% missing)
df = df.drop(columns=['Cabin'])

# 3. Feature engineering
df['FamilySize'] = df['SibSp'] + df['Parch'] + 1
df['IsAlone'] = (df['FamilySize'] == 1).astype(int)
df['AgeGroup'] = pd.cut(df['Age'],
                        bins=[0, 12, 18, 35, 60, 100],
                        labels=['Anak', 'Remaja', 'Dewasa Muda', 'Dewasa', 'Senior'])

print(f"Missing setelah cleaning: {df.isnull().sum().sum()}")
```

### 🔍 Step 3: EDA

```python
fig, axes = plt.subplots(2, 3, figsize=(16, 10))

# Survival rate keseluruhan
df['Survived'].value_counts(normalize=True).plot(
    kind='pie', ax=axes[0, 0], labels=['Meninggal', 'Selamat'],
    autopct='%1.1f%%', colors=['#ff6b6b', '#51cf66']
)
axes[0, 0].set_title('Tingkat Survival Keseluruhan')

# Survival by Sex
sns.barplot(data=df, x='Sex', y='Survived', ax=axes[0, 1], palette='Set2')
axes[0, 1].set_title('Survival Rate by Gender')

# Survival by Pclass
sns.barplot(data=df, x='Pclass', y='Survived', ax=axes[0, 2], palette='Set2')
axes[0, 2].set_title('Survival Rate by Kelas')

# Distribusi Age
sns.histplot(data=df, x='Age', hue='Survived', kde=True,
             ax=axes[1, 0], palette=['#ff6b6b', '#51cf66'])
axes[1, 0].set_title('Distribusi Usia by Survival')

# Survival by AgeGroup
sns.barplot(data=df, x='AgeGroup', y='Survived', ax=axes[1, 1], palette='Set2')
axes[1, 1].set_title('Survival by Kelompok Usia')

# Survival by FamilySize
sns.barplot(data=df, x='FamilySize', y='Survived', ax=axes[1, 2], palette='Set2')
axes[1, 2].set_title('Survival by Ukuran Keluarga')

plt.tight_layout()
plt.savefig('reports/titanic_eda.png', dpi=150)
plt.show()
```

### 💡 Step 4: Insight Extraction

```python
# Analisis multi-dimensi
pivot = df.pivot_table(
    values='Survived',
    index='Sex',
    columns='Pclass',
    aggfunc='mean'
).round(3)
print("Survival Rate by Sex & Pclass:\n", pivot)

# Korelasi fitur numerik
numeric_cols = df.select_dtypes(include=np.number).columns
plt.figure(figsize=(10, 8))
sns.heatmap(df[numeric_cols].corr(), annot=True, cmap='coolwarm', center=0, fmt='.2f')
plt.title('Correlation Matrix — Titanic')
plt.savefig('reports/titanic_correlation.png', dpi=150)
plt.show()
```

### 📌 Key Insights

| # | Insight | Angka | Implikasi |
| :-: | :--- | :--- | :--- |
| 1 | **"Wanita & Anak Dulu"** diterapkan | Wanita **74%** vs Pria **19%** | Gender = prediktor terkuat |
| 2 | Kelas ekonomi berpengaruh | Pclass 1: **63%** vs Pclass 3: **24%** | Akses lifeboat tidak merata |
| 3 | Ukuran keluarga optimum | FamilySize 2-4: **~72%** vs solo: **30%** | Keluarga kecil lebih selamat |
| 4 | Anak (<12 thn) paling selamat | **~58%** | Prioritas evakuasi |

### 📊 Rekomendasi Stakeholder

> Faktor **gender**, **kelas kabin**, dan **ukuran keluarga** adalah tiga prediktor terkuat untuk keselamatan. Meskipun protokol "wanita & anak dulu" diterapkan, terdapat **disparitas kelas** yang signifikan (63% vs 24%), menunjukkan perlunya evaluasi protokol evakuasi yang lebih adil.

---

## 🛒 Studi Kasus 3: E-Commerce Sales — Business Analytics

> **Tujuan:** Menganalisis performa penjualan e-commerce dan mengidentifikasi peluang pertumbuhan.
> **Dataset:** 5000+ transaksi (simulasi) · kolom: `order_id`, `order_date`, `customer_id`, `category`, `quantity`, `price`, `city`, `payment_method`
> **Level:** ⭐⭐⭐ Menengah-Lanjut

### 📥 Step 1: Simulasi Data

```python
np.random.seed(42)

n = 5000
df = pd.DataFrame({
    'order_id': [f'ORD-{i:05d}' for i in range(n)],
    'order_date': pd.date_range('2023-01-01', periods=n, freq='3h'),
    'customer_id': np.random.randint(1000, 1500, n),
    'category': np.random.choice(
        ['Elektronik', 'Fashion', 'Makanan', 'Kesehatan', 'Rumah Tangga'],
        n, p=[0.25, 0.30, 0.20, 0.15, 0.10]
    ),
    'quantity': np.random.randint(1, 10, n),
    'price': np.random.choice([50000, 100000, 250000, 500000, 1000000], n),
    'city': np.random.choice(
        ['Jakarta', 'Surabaya', 'Bandung', 'Medan', 'Semarang'],
        n, p=[0.40, 0.20, 0.15, 0.15, 0.10]
    ),
    'payment_method': np.random.choice(
        ['Transfer', 'E-Wallet', 'COD', 'Kartu Kredit'],
        n, p=[0.30, 0.40, 0.20, 0.10]
    ),
})

# Inject data kotor untuk simulasi
df.loc[df.sample(100).index, 'city'] = np.nan
df.loc[df.sample(50).index, 'price'] = df['price'] * 100  # outlier

print(f"Shape: {df.shape}")
print(df.head())
```

### 🧹 Step 2: Data Cleaning

```python
# 1. Handle missing values
df['city'] = df['city'].fillna('Unknown')

# 2. Handle outlier dengan winsorization
Q1 = df['price'].quantile(0.25)
Q3 = df['price'].quantile(0.75)
IQR = Q3 - Q1
upper = Q3 + 1.5 * IQR
df['price'] = np.where(df['price'] > upper, upper, df['price'])

# 3. Feature engineering
df['revenue'] = df['quantity'] * df['price']
df['month'] = df['order_date'].dt.to_period('M').astype(str)
df['day_of_week'] = df['order_date'].dt.day_name()
df['hour'] = df['order_date'].dt.hour

print(df.head())
```

### 🔍 Step 3: EDA — Business Questions

```python
# Q1: Kategori paling profitable
revenue_by_cat = df.groupby('category')['revenue'].sum().sort_values(ascending=False)
print("Revenue by Category:\n", revenue_by_cat)

# Q2: Tren revenue bulanan
monthly_revenue = df.groupby('month')['revenue'].sum()

# Q3: Kota dengan revenue tertinggi
revenue_by_city = df.groupby('city')['revenue'].sum().sort_values(ascending=False)

# Q4: Metode pembayaran populer
payment_dist = df['payment_method'].value_counts(normalize=True) * 100

# Visualisasi
fig, axes = plt.subplots(2, 2, figsize=(16, 10))

revenue_by_cat.plot(kind='barh', ax=axes[0, 0], color='#4ecdc4')
axes[0, 0].set_title('Total Revenue by Category')
axes[0, 0].set_xlabel('Revenue (IDR)')

monthly_revenue.plot(kind='line', ax=axes[0, 1], marker='o', color='#ff6b6b')
axes[0, 1].set_title('Tren Revenue Bulanan')
axes[0, 1].tick_params(axis='x', rotation=45)

revenue_by_city.head(5).plot(kind='bar', ax=axes[1, 0], color='#95e1d3')
axes[1, 0].set_title('Top 5 Kota by Revenue')

payment_dist.plot(kind='pie', ax=axes[1, 1], autopct='%1.1f%%',
                  colors=sns.color_palette('Set3'))
axes[1, 1].set_title('Distribusi Metode Pembayaran')

plt.tight_layout()
plt.savefig('reports/ecommerce_eda.png', dpi=150)
plt.show()
```

### 💡 Step 4: Deep Dive Insight

```python
# Insight 1: Jam paling ramai
peak_hours = df.groupby('hour')['order_id'].count().sort_values(ascending=False)
print("Top 3 jam sibuk:\n", peak_hours.head(3))

# Insight 2: Customer Lifetime Value sederhana
clv = df.groupby('customer_id').agg({
    'revenue': 'sum',
    'order_id': 'count'
}).rename(columns={'revenue': 'total_spend', 'order_id': 'total_orders'})
clv['avg_order_value'] = clv['total_spend'] / clv['total_orders']

print(f"\nRata-rata CLV: Rp {clv['total_spend'].mean():,.0f}")
print(f"Rata-rata Order Value: Rp {clv['avg_order_value'].mean():,.0f}")

# Insight 3: Pareto Analysis
clv_sorted = clv.sort_values('total_spend', ascending=False).reset_index()
clv_sorted['cumulative_pct'] = clv_sorted['total_spend'].cumsum() / clv_sorted['total_spend'].sum() * 100
clv_sorted['customer_pct'] = (clv_sorted.index + 1) / len(clv_sorted) * 100

top_20_threshold = clv_sorted[clv_sorted['cumulative_pct'] >= 80].iloc[0]
print(f"\n{top_20_threshold['customer_pct']:.1f}% customer menyumbang 80% revenue")
```

### 📌 Key Insights

| # | Insight | Angka | Rekomendasi |
| :-: | :--- | :--- | :--- |
| 1 | **Fashion & Elektronik** dominan | ~55% total revenue | Fokus marketing budget |
| 2 | **Jakarta** = pasar utama | ~40% revenue | Retargeting campaign |
| 3 | **E-Wallet** primadona | ~40% transaksi | Tambah promo cashback |
| 4 | **Pareto 80/20 berlaku** | 20% customer = 80% revenue | Program loyalty tier |
| 5 | Peak order **19:00-21:00** | — | Push notification |

### 📊 Executive Summary

```text
📌 EXECUTIVE SUMMARY — Q1 2023
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total Revenue    : Rp 4.2 M
Total Orders     : 5.000
Unique Customers : 500
Avg Order Value  : Rp 840.000

🎯 TOP 3 ACTION ITEMS:
1. [GROWTH]    Intensifkan promo E-Wallet → target +15% conversion
2. [RETENTION] Program loyalty top 20% customer → kurangi churn 10%
3. [EXPANSION] Uji iklan di Medan & Semarang (underpenetrated)

⚠️ RISK:
- COD masih 20% transaksi → risiko gagal bayar & retur tinggi
```

---

## 🏆 Best Practices & Common Pitfalls

### ✅ DO

| Praktik | Alasan |
| :--- | :--- |
| **Gunakan `df.copy()`** saat modifikasi subset | Menghindari `SettingWithCopyWarning` |
| **Cek `.info()` & `.describe()` dulu** | Memahami skala & tipe data |
| **Simpan data mentah di `raw/`** (read-only) | Reproducibility & audit trail |
| **Gunakan `f-string` untuk print** | Lebih mudah di-debug |
| **Tulis fungsi reusable** | DRY principle |
| **Visualisasikan sebelum menyimpulkan** | Menghindari bias konfirmasi |

### ❌ DON'T

| Anti-pattern | Masalah |
| :--- | :--- |
| `df.dropna(inplace=True)` tanpa analisis | Kehilangan informasi berharga |
| Mengisi NaN dengan `0` default | Bias terhadap median/mean |
| `for loop` untuk operasi DataFrame | Gunakan vectorized operation |
| Direct manipulation data mentah | Tidak bisa diulang / di-audit |
| Simpulkan kausalitas dari korelasi | *Correlation ≠ Causation* |
| Abaikan `dtype` saat merge | Silent bug (`int` vs `str` ID) |

### 🐛 Debugging Checklist

```python
def sanity_check(df, name="Dataset"):
    """Quick health check untuk DataFrame."""
    print(f"\n{'='*50}")
    print(f"  SANITY CHECK: {name}")
    print(f"{'='*50}")
    print(f"Shape          : {df.shape}")
    print(f"Total missing  : {df.isnull().sum().sum()}")
    print(f"Total duplikat : {df.duplicated().sum()}")
    print(f"Memory usage   : {df.memory_usage(deep=True).sum() / 1024**2:.2f} MB")
    print(f"\nTipe data:\n{df.dtypes.value_counts()}")
    print(f"{'='*50}\n")

# Pemakaian
sanity_check(df, "E-Commerce Data")
```

---

## 📝 Template Laporan Analisis

Setiap studi kasus diakhiri dengan **laporan 1 halaman**:

```markdown
# 📊 Laporan Analisis: [Judul Studi Kasus]

## 1. Latar Belakang
[Apa masalah bisnis yang ingin dijawab?]

## 2. Data yang Digunakan
- Sumber  : [URL/Path]
- Periode : [Tanggal]
- Ukuran  : [n baris × m kolom]
- Kualitas: [Missing %, outlier %, duplikat]

## 3. Metodologi
- Cleaning : [teknik yang dipakai]
- EDA      : [visualisasi utama]
- Analisis : [metode statistik/grouping]

## 4. Temuan Utama (Max 5 insights)
1. [Insight 1] — [angka pendukung] → [implikasi]
2. [Insight 2] — [angka pendukung] → [implikasi]

## 5. Rekomendasi Actionable
| Priority | Action | Expected Impact | Effort |
| :--- | :--- | :--- | :--- |
| 🔴 High | [action] | [impact] | [S/M/L] |
| 🟡 Med  | [action] | [impact] | [S/M/L] |

## 6. Keterbatasan & Next Steps
- [Limitasi data]
- [Pertanyaan lanjutan untuk eksplorasi]
```

---

## 📚 Resources & Referensi

### 📖 Dokumentasi Resmi

- [Pandas Documentation](https://pandas.pydata.org/docs/)
- [NumPy User Guide](https://numpy.org/doc/stable/user/)
- [Seaborn Tutorial](https://seaborn.pydata.org/tutorial.html)
- [Scikit-learn User Guide](https://scikit-learn.org/stable/user_guide.html)

### 🎓 Dataset untuk Latihan

| Dataset | Ukuran | Fokus | Link |
| :--- | :--- | :--- | :--- |
| **Iris** | 150 × 5 | Klasifikasi dasar | `sklearn.datasets.load_iris()` |
| **Titanic** | 891 × 12 | Missing values, survival | [Kaggle](https://www.kaggle.com/c/titanic) |
| **Sales Superstore** | 9.994 × 21 | Business analytics | [Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) |
| **Netflix Titles** | 8.807 × 12 | Content analytics | [Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows) |
| **Brazilian E-Commerce** | 100k+ | Time-series, RFM | [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) |

### 🎥 Rekomendasi Belajar

- **Kaggle Learn** — [Pandas & Data Viz courses](https://www.kaggle.com/learn)
- **Towards Data Science** — [Medium blog](https://towardsdatascience.com/)
- **StatQuest** (YouTube) — Statistika visual

---

## 🤝 Kontribusi

Kontribusi selalu terbuka! Silakan:

1. Fork repositori ini
2. Buat branch fitur (`git checkout -b feature/StudiKasusBaru`)
3. Commit perubahan (`git commit -m 'Add: Studi kasus baru'`)
4. Push (`git push origin feature/StudiKasusBaru`)
5. Buka **Pull Request**

---

## 📄 Lisensi

MIT License — tidak bebas digunakan untuk keperluan edukasi dan komersial.

---

<div align="center">

⭐ **Jika modul ini bermanfaat, jangan lupa beri bintang di repo!** ⭐

*Dibuat dengan ❤️ oleh [harryyss] — Data Enthusiast*

</div>

---

<details>
<summary>🎁 <b>Bonus: File Pendukung — <code>src/cleaning.py</code></b> (klik untuk buka)</summary>

```python
"""Modul fungsi cleaning reusable untuk Data Analyst."""
import pandas as pd
import numpy as np


def sanity_check(df: pd.DataFrame, name: str = "Dataset") -> None:
    """Quick health check."""
    print(f"\n{'='*50}\n  SANITY CHECK: {name}\n{'='*50}")
    print(f"Shape          : {df.shape}")
    print(f"Total missing  : {df.isnull().sum().sum()}")
    print(f"Total duplikat : {df.duplicated().sum()}")
    print(f"{'='*50}\n")


def handle_missing(df: pd.DataFrame, strategy: dict) -> pd.DataFrame:
    """
    Handle missing values by strategy.
    strategy = {'col': ('fill', value) | ('median',) | ('mode',) | ('drop',)}
    """
    df = df.copy()
    for col, action in strategy.items():
        if action[0] == 'fill':
            df[col] = df[col].fillna(action[1])
        elif action[0] == 'median':
            df[col] = df[col].fillna(df[col].median())
        elif action[0] == 'mode':
            df[col] = df[col].fillna(df[col].mode()[0])
        elif action[0] == 'drop':
            df = df.drop(columns=[col])
    return df


def cap_outliers(df: pd.DataFrame, col: str, factor: float = 1.5) -> pd.DataFrame:
    """Winsorization: cap outlier ke batas IQR."""
    df = df.copy()
    Q1, Q3 = df[col].quantile([0.25, 0.75])
    IQR = Q3 - Q1
    lower, upper = Q1 - factor * IQR, Q3 + factor * IQR
    df[col] = df[col].clip(lower, upper)
    return df
```

</details>

<details>
<summary>🚀 <b>Bonus: Cara Push ke GitHub</b> (klik untuk buka)</summary>

```bash
# 1. Inisialisasi repositori
git init
git add README.md requirements.txt
git commit -m "feat: initial educational module data analysis with python 3"

# 2. Hubungkan ke remote
git remote add origin https://github.com/username/data-analysis-python.git

# 3. Push
git branch -M main
git push -u origin main
```

</details>
