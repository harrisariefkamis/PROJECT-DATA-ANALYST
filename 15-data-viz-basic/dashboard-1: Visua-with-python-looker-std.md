# 📊 Data Visualisation 1: Basic Data Viz + Project 2

> Modul visualisasi data untuk pemula: pelajari cara memilih chart yang tepat, membangun visual yang bersih dan komunikatif, serta menyampaikan **insight** melalui **storytelling**. Deliverables mencakup **Project 2** menggunakan **Python di Google Colab** dan **Looker Studio**.

![Python](https://img.shields.io/badge/Python-3.9%2B-blue?logo=python&logoColor=white)
![Colab](https://img.shields.io/badge/Google%20Colab-F9AB00?logo=googlecolab&logoColor=white)
![Looker Studio](https://img.shields.io/badge/Looker%20Studio-4285F4?logo=google&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-3.7%2B-11557c)
![Seaborn](https://img.shields.io/badge/Seaborn-0.12%2B-4c72b0)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📋 Daftar Isi

- [🎯 Tujuan Pembelajaran](#-tujuan-pembelajaran)
- [📚 Materi Inti](#-materi-inti)
  - [1. Chart Selection](#1-chart-selection)
  - [2. Empat Chart Dasar: Bar, Line, Pie, Histogram](#2-empat-chart-dasar-bar-line-pie-histogram)
  - [3. Visual Design Principles](#3-visual-design-principles)
  - [4. Storytelling dengan Chart](#4-storytelling-dengan-chart)
- [🐍 Tutorial Python — Google Colab](#-tutorial-python--google-colab)
- [📊 Tutorial Looker Studio](#-tutorial-looker-studio)
- [🎯 Project 2: Deliverables](#-project-2-deliverables)
- [📝 Template Laporan Visualisasi](#-template-laporan-visualisasi)
- [📚 Resources](#-resources--referensi)
- [🤝 Kontribusi](#-kontribusi)

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan modul ini, Anda diharapkan mampu:

- [x] **Memilih tipe chart** yang tepat berdasarkan pertanyaan dan tipe data
- [x] **Membangun visualisasi dasar** (bar, line, pie, histogram) dengan Python dan Looker Studio
- [x] **Menerapkan prinsip desain visual** — mengurangi clutter, menggunakan warna secara strategis, dan mengarahkan perhatian audiens
- [x] **Menyusun narasi data** yang komunikatif dan actionable
- [x] **Menyelesaikan Project 2** end-to-end: dari dataset mentah hingga dashboard dan laporan insight

---

## 📚 Materi Inti

### 1. Chart Selection

Pemilihan chart yang tepat dimulai dari **pertanyaan** yang ingin Anda jawab, bukan dari jenis chart yang Anda sukai. ONS merangkum **8 hubungan data** yang umum dikomunikasikan melalui visualisasi: **Correlation, Deviation, Distribution, Geography, Magnitude, Parts of a Whole, Ranking, dan Time**.

**Prinsip kunci:**

- **Pilih chart sederhana dan familiar** — chart kompleks atau tidak umum dapat mengaburkan hubungan yang ingin ditampilkan.
- **Fokus pada satu hubungan utama** — jika perlu menampilkan beberapa hubungan, gunakan beberapa chart sederhana daripada satu chart kompleks.
- **Mulai dari big picture** — berikan overview sederhana sebelum masuk ke detail yang lebih kompleks.

**Panduan cepat pemilihan chart:**

| Pertanyaan / Hubungan | Chart yang Direkomendasikan | Catatan |
| :--- | :--- | :--- |
| **Perbandingan kategori** | Bar chart (horizontal/vertikal) | Ideal untuk ≤15 kategori; >15 kategori → horizontal bar atau filter |
| **Perubahan sepanjang waktu** | Line chart | Untuk data kontinu/time-series |
| **Proporsi / parts of a whole** | Pie chart (≤5 slice) atau stacked bar | Pie chart **tidak** cocok untuk hubungan antar variabel numerik |
| **Distribusi nilai** | Histogram / box plot | Melihat sebaran dan shape data |
| **Hubungan dua variabel numerik** | Scatter plot | Korelasi, outlier, cluster |
| **Peringkat (ranking)** | Horizontal bar chart (sorted) | Mudah dibaca dari atas ke bawah |

> [!TIP]
> **Aturan emas:** Tanyakan *“Apa satu hal yang harus dipahami audiens dari chart ini?”* Jika chart tidak menjawab pertanyaan tersebut, ganti chart-nya.

---

### 2. Empat Chart Dasar: Bar, Line, Pie, Histogram

#### 📊 Bar Chart — *Membandingkan Kategori*

Bar chart menggunakan panjang batang untuk merepresentasikan magnitude, sehingga perbandingan antar kategori langsung terlihat.

**Kapan digunakan:** Perbandingan diskret antar kategori (produk, wilayah, departemen).

**Best practice:**
- Urutkan batang berdasarkan nilai (kecuali kategori memiliki urutan alami seperti bulan).
- Gunakan **horizontal bar** jika label kategori panjang atau jumlah kategori >10.
- **Selalu mulai axis Y dari 0** untuk bar chart — memotong axis menyesatkan.

#### 📈 Line Chart — *Menunjukkan Perubahan Waktu*

Line chart menghubungkan titik data secara kontinu dan sangat efektif untuk menampilkan **tren, pola, dan fluktuasi**.

**Kapan digunakan:** Data time-series (harian, bulanan, tahunan).

**Best practice:**
- Jangan gunakan line chart untuk kategori yang tidak berurutan.
- Gunakan penanda (marker) hanya jika jumlah titik data sedikit.
- Jika menampilkan beberapa line, batasi maksimal 4–5 untuk menghindari *spaghetti chart*.

#### 🥧 Pie Chart — *Proporsi Keseluruhan*

Pie chart menunjukkan **parts of a whole** — proporsi setiap kategori terhadap total.

**Kapan digunakan:** Sangat terbatas — idealnya **≤5 slice** dan ketika satu slice jelas dominan.

> [!WARNING]
> Pie chart **sering disalahgunakan**. Jangan gunakan pie chart untuk membandingkan kategori yang ukurannya mirip (sulit dibedakan secara visual) atau untuk menunjukkan hubungan antar variabel numerik. Untuk proporsi dengan banyak kategori, **stacked bar** atau **horizontal bar** biasanya lebih baik.

#### 📊 Histogram — *Melihat Distribusi*

Histogram mengelompokkan data numerik ke dalam **bin** dan menampilkan frekuensi setiap bin. Ini adalah alat utama untuk memahami **shape distribusi** (normal, skewed, bimodal) dan mendeteksi outlier.

**Kapan digunakan:** Eksplorasi awal data numerik, validasi asumsi statistik.

**Best practice:**
- Pilih jumlah bin yang wajar (aturan praktis: √n, atau 10–20 bin untuk data kecil).
- Jangan menganggap histogram sebagai bar chart — sumbu X adalah **kontinu**, bukan kategori diskret.

---

### 3. Visual Design Principles

Desain visual bukan tentang mempercantik chart, melainkan tentang **membuat chart berkomunikasi secara efektif**. Dataquest merumuskan **three-level framework** untuk visualisasi yang efektif:

#### Level 1: Clarify Your Purpose

Sebelum membuat satu keputusan desain pun, pastikan Anda tahu **apa yang harus dipahami audiens**. Tujuan yang jelas mengubah niat samar seperti *“tunjukkan performa penjualan”* menjadi target spesifik: *“tunjukkan bahwa penjualan furniture di wilayah West mengungguli semua kategori dan wilayah lain di Q4”* .

#### Level 2: Direct Attention to What Matters

Audience memproses informasi visual dengan cepat tetapi mudah kewalahan. **Kurangi clutter** dan **arahkan perhatian** ke elemen terpenting.

**Teknik decluttering** — sesuai prinsip *data-ink ratio* Edward Tufte:
- Hapus **gridlines** yang tidak perlu.
- Hapus **label data berlebihan** dan **legenda yang tidak esensial**.
- Kurangi **variasi warna** yang tidak bermakna.

**Teknik focus** — gunakan warna secara strategis:
- Gunakan **satu warna aksen** untuk menyorot insight kunci, dan **warna netral** untuk sisanya.
- **Jangan pelangi warna** — batasi palet hingga 4 warna, dengan aksen pada warna utama.
- Gunakan warna semantik: **hijau** untuk pertumbuhan/positif, **merah** untuk penurunan/alert, **kuning** untuk watch-out.

#### Level 3: Contextualize & Make Accessible

Angka tidak berarti tanpa konteks. Sertakan **perbandingan** (vs periode sebelumnya, vs target, vs benchmark). Pastikan juga chart **dapat dibaca semua audiens** — kontras cukup, ukuran font memadai, dan tidak bergantung pada warna saja (gunakan label atau pola sebagai fallback).

---

### 4. Storytelling dengan Chart

Storytelling mengubah chart dari sekadar “menampilkan data” menjadi **mengarahkan audiens pada kesimpulan dan keputusan**. Rebeca Pop merangkum tiga prinsip inti: **Storytelling** (mengubah insight mentah menjadi narasi relevan), **Decluttering** (menghilangkan noise agar pesan menonjol), dan **Creativity** (mengeksplorasi chart di luar default).

**Lima teknik storytelling yang terbukti efektif:**

1. **Pilih visual yang tepat untuk pesan** — perbandingan → bar, tren → line.
2. **Gunakan narrative title** — judul yang menyatakan insight, bukan sekadar mendeskripsikan isi chart. Contoh: *“Penjualan Q4 melonjak 32% didorong oleh kategori Elektronik”* — bukan *“Total Penjualan per Kategori”* .
3. **Sorot poin kunci dengan warna** — warnai hanya bar/line yang kritikal, sisanya netral.
4. **Beri anotasi langsung di chart** — callout singkat pada titik data penting lebih efektif daripada paragraf penjelasan.
5. **Sediakan konteks** — bandingkan dengan periode sebelumnya, target, atau rata-rata industri.

**Struktur narasi yang disarankan:**
```text
1. Set the scene     → Konteks singkat: apa yang sedang dilihat audiens?
2. Interest point    → Satu angka/fakta mengejutkan untuk menarik perhatian.
3. Pola utama       → Chart utama yang menunjukkan pattern.
4. Tension point    → Masalah, anomali, atau gap yang perlu perhatian.
5. Resolusi         → Rekomendasi actionable.
```


---

## 🐍 Tutorial Python — Google Colab

Google Colab memungkinkan Anda menjalankan Python di browser tanpa setup. Tutorial ini menggunakan **Matplotlib** untuk plot fundamental dan **Seaborn** untuk visual dengan tema bawaan yang lebih menarik.

### Setup

```python
# Install library (Colab sudah menyertakan matplotlib & seaborn, tapi pastikan)
!pip install -q pandas numpy matplotlib seaborn

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Set tema global Seaborn
sns.set_theme(style="whitegrid", palette="muted")
plt.rcParams['figure.figsize'] = (10, 6)
plt.rcParams['figure.dpi'] = 100
```

### Load Dataset — Superstore

Kita akan menggunakan dataset **Superstore** (transaksi ritel fiktif) yang sangat cocok untuk latihan visualisasi.

```python
url = "https://raw.githubusercontent.com/plotly/datasets/master/superstore.csv"
# Alternatif jika URL di atas tidak tersedia:
# url = "https://raw.githubusercontent.com/DataScienceRoadMap/Data-Science-RoadMap/main/Datasets/superstore.csv"

df = pd.read_csv(url, encoding='latin-1')
print(df.shape)
print(df.columns.tolist())
df.head()
```

> Jika dataset tidak dapat diakses, gunakan **Tips dataset** dari Seaborn: `df = sns.load_dataset('tips')` — cukup untuk latihan bar, line, pie, dan histogram.

### 1. Bar Chart — Penjualan per Kategori

```python
# Agregasi
sales_by_cat = df.groupby('Category')['Sales'].sum().sort_values(ascending=True)

# Horizontal bar (lebih mudah dibaca untuk label panjang)
fig, ax = plt.subplots(figsize=(10, 5))
bars = ax.barh(sales_by_cat.index, sales_by_cat.values, color='#4C72B0')

# Highlight bar terbesar
max_idx = sales_by_cat.idxmax()
for bar, label in zip(bars, sales_by_cat.index):
    if label == max_idx:
        bar.set_color('#E74C3C')

ax.set_title(f"Kategori {max_idx} Memimpin Penjualan", fontsize=14, fontweight='bold', loc='left')
ax.set_xlabel("Total Sales (USD)")
ax.set_ylabel("")
ax.spines[['top', 'right']].set_visible(False)

plt.tight_layout()
plt.savefig('bar_sales_category.png', dpi=150, bbox_inches='tight')
plt.show()
```

### 2. Line Chart — Tren Penjualan Bulanan

```python
# Pastikan kolom tanggal dalam format datetime
df['Order Date'] = pd.to_datetime(df['Order Date'])
df['Month'] = df['Order Date'].dt.to_period('M').astype(str)

monthly = df.groupby('Month')['Sales'].sum().reset_index()

fig, ax = plt.subplots(figsize=(12, 5))
ax.plot(monthly['Month'], monthly['Sales'], marker='o', linewidth=2.5, color='#2E86AB')
ax.fill_between(range(len(monthly)), monthly['Sales'], alpha=0.15, color='#2E86AB')

ax.set_title("Tren Penjualan Bulanan — Q4 Konsisten Tertinggi", fontsize=14, fontweight='bold', loc='left')
ax.set_ylabel("Total Sales (USD)")
ax.set_xlabel("")
ax.tick_params(axis='x', rotation=45)
ax.spines[['top', 'right']].set_visible(False)

# Anotasi peak
peak_idx = monthly['Sales'].idxmax()
ax.annotate(f"Peak: {monthly['Sales'].max():,.0f}",
            xy=(peak_idx, monthly['Sales'].max()),
            xytext=(peak_idx, monthly['Sales'].max() * 1.05),
            ha='center', fontsize=10, color='#E74C3C',
            arrowprops=dict(arrowstyle='->', color='#E74C3C'))

plt.tight_layout()
plt.savefig('line_monthly_trend.png', dpi=150, bbox_inches='tight')
plt.show()
```

### 3. Pie Chart — Proporsi Metode Pengiriman

```python
ship_mode = df['Ship Mode'].value_counts()

fig, ax = plt.subplots(figsize=(7, 7))
colors = ['#4C72B0', '#55A868', '#C44E52', '#8172B2']
explode = [0.03] * len(ship_mode)  # sedikit "meledak" untuk estetika

ax.pie(ship_mode.values, labels=ship_mode.index, autopct='%1.1f%%',
       colors=colors[:len(ship_mode)], explode=explode, startangle=90,
       wedgeprops={'edgecolor': 'white', 'linewidth': 1.5})
ax.set_title("Standard Class Mendominasi Metode Pengiriman", fontsize=14, fontweight='bold')

plt.tight_layout()
plt.savefig('pie_shipmode.png', dpi=150, bbox_inches='tight')
plt.show()
```

> [!NOTE]
> Pie chart di atas hanya memiliki 4 slice — masih dalam batas aman. Jika kategori >5, ganti dengan horizontal bar chart.

### 4. Histogram — Distribusi Nilai Profit

```python
fig, ax = plt.subplots(figsize=(10, 5))
ax.hist(df['Profit'], bins=40, color='#55A868', edgecolor='white', alpha=0.85)

ax.axvline(0, color='#E74C3C', linestyle='--', linewidth=1.5, label='Break-even (0)')
ax.axvline(df['Profit'].mean(), color='#2E86AB', linestyle='--', linewidth=1.5,
           label=f"Mean: {df['Profit'].mean():.0f}")

ax.set_title("Distribusi Profit — Right-Skewed dengan Banyak Transaksi Rugi", fontsize=14, fontweight='bold', loc='left')
ax.set_xlabel("Profit (USD)")
ax.set_ylabel("Frekuensi")
ax.legend(frameon=False)
ax.spines[['top', 'right']].set_visible(False)

plt.tight_layout()
plt.savefig('hist_profit.png', dpi=150, bbox_inches='tight')
plt.show()
```

### 🎯 Mini-Exercise — Storytelling Version

Ambil **satu chart** dari atas, lalu **perbaiki** menggunakan prinsip storytelling:

1. Ganti judul deskriptif menjadi **narrative title** yang menyatakan insight.
2. Sorot **satu elemen** dengan warna aksen; sisanya netral.
3. Tambahkan **anotasi** pada titik data penting.
4. Hapus gridlines, border, dan elemen non-esensial.

Simpan hasil *before–after* sebagai `project2_storytelling.png`.

---

## 📊 Tutorial Looker Studio

Looker Studio (sebelumnya Google Data Studio) adalah **BI tool gratis** yang memungkinkan Anda membangun dashboard interaktif langsung di browser. Looker Studio terhubung ke Google Sheets, BigQuery, CSV upload, dan banyak sumber lainnya.

### Langkah 1: Persiapkan Data Source

**Opsi A — Upload CSV langsung:**
1. Buka [Looker Studio](https://lookerstudio.google.com/).
2. Klik **Create → Data Source**.
3. Pilih **File Upload** → unggah `superstore.csv`.
4. Klik **Connect**.

**Opsi B — Google Sheets (direkomendasikan untuk pemula):**
1. Upload CSV ke Google Drive → buka dengan Google Sheets.
2. Di Looker Studio, pilih **Create → Data Source → Google Sheets**.
3. Pilih spreadsheet yang sesuai.

### Langkah 2: Buat Report dan Tambahkan Chart

1. Klik **Create → Report** → pilih data source yang sudah dibuat.
2. Dari toolbar, tambahkan komponen visual:

| Komponen | Fungsi | Cara Menambahkan |
| :--- | :--- | :--- |
| **Scorecard** | Menampilkan KPI tunggal (total sales, profit, orders) | Insert → Scorecard |
| **Time Series** | Line chart untuk tren waktu | Insert → Time Series Chart |
| **Bar Chart** | Perbandingan kategori | Insert → Bar Chart |
| **Pie Chart** | Proporsi | Insert → Pie Chart |
| **Table** | Detail data / pivot | Insert → Table |

### Langkah 3: Konfigurasi Chart

Untuk **setiap chart**, atur:
- **Dimension** (sumbu X / kategori): misalnya `Category`, `Month`, `Region`.
- **Metric** (sumbu Y / nilai): misalnya `SUM(Sales)`, `SUM(Profit)`, `COUNT(Order ID)`.
- **Sort**: urutkan berdasarkan metric secara descending.
- **Style**: atur warna, legend, dan label.

### Langkah 4: Tambahkan Interaktivitas

Looker Studio memungkinkan filter interaktif yang membuat dashboard **explorable**:

- **Date Range Filter** — filter berdasarkan periode.
- **Drop-down Filter** — filter berdasarkan kategori (Region, Category, Segment).
- **Drill-down** — memungkinkan audiens menelusuri hierarki data.

### Langkah 5: Desain Layout yang Bersih

Prinsip desain yang sama berlaku di Looker Studio:

- **Satu halaman = satu cerita** — jangan menjejalkan terlalu banyak chart.
- **Konsisten warna** — gunakan palet yang sama di seluruh dashboard.
- **Hierarki visual** — KPI scorecard di atas, tren di tengah, detail di bawah.
- **Beri judul yang bermakna** pada setiap chart — bukan sekadar nama kolom.

### 📌 Looker Studio vs Python: Kapan Menggunakan Apa?

| Aspek | Python (Colab) | Looker Studio |
| :--- | :--- | :--- |
| **Fleksibilitas** | Sangat tinggi — kustomisasi penuh | Terbatas pada komponen bawaan |
| **Interaktivitas** | Perlu library tambahan (Plotly) | Built-in (filter, drill-down) |
| **Kolaborasi** | Share notebook | Share link dashboard real-time |
| **Kecepatan** | Cepat untuk eksplorasi & prototipe | Cepat untuk dashboard production |
| **Cocok untuk** | EDA, analisis statistik, visual kustom | Dashboard monitoring, reporting rutin |

---

## 🎯 Project 2: Deliverables

Project 2 adalah **tugas akhir** modul ini. Anda diminta menyelesaikan **satu dataset** dengan **dua tools**: Python (Colab) dan Looker Studio.

### 📦 Deliverables yang Dikumpulkan

```text
📦 project-2-visualization/
├── 📓 project2_colab.ipynb          # Notebook Python lengkap
├── 📊 dashboard_looker.pdf         # Screenshot/PDF dashboard Looker Studio
├── 📈 charts/                      # Output chart dari Python (PNG)
│   ├── bar_*.png
│   ├── line_*.png
│   ├── pie_*.png
│   └── hist_*.png
├── 📝 laporan_analisis.md          # Laporan 1 halaman (template di bawah)
└── 📄 README.md                    # Deskripsi project & cara menjalankan
```

### ✅ Rubrik Penilaian

| Kriteria | Bobot | Indikator |
| :--- | :--- | :--- |
| **Ketepatan pemilihan chart** | 25% | Chart sesuai dengan pertanyaan & tipe data |
| **Kualitas desain visual** | 20% | Decluttered, warna strategis, axis benar, label jelas |
| **Storytelling** | 20% | Narrative title, anotasi, alur narasi logis |
| **Kelengkapan Python** | 15% | Empat chart dasar + minimal 1 chart lanjutan |
| **Dashboard Looker Studio** | 10% | KPI, filter, layout bersih, minimal 4 komponen |
| **Laporan & insight** | 10% | Insight actionable, rekomendasi jelas |

### 📌 Rekomendasi Dataset

| Dataset | Ukuran | Cocok untuk | Link |
| :--- | :--- | :--- | :--- |
| **Superstore** | ~10k baris | Bar, line, pie, histogram — lengkap | [Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) |
| **Tips** (Seaborn) | 244 baris | Latihan cepat, semua chart dasar | `sns.load_dataset('tips')` |
| **Netflix Titles** | ~8.8k baris | Bar (genre), line (tahun), pie (rating) | [Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows) |
| **Airbnb Listing** | ~50k baris | Histogram (harga), bar (kota), peta | [Kaggle](https://www.kaggle.com/datasets/arianazmoudeh/airbnbopendata) |

---

## 📝 Template Laporan Visualisasi

```markdown
# 📊 Laporan Project 2: [Judul Visualisasi]

## 1. Dataset & Pertanyaan
- **Dataset**: [nama, sumber, ukuran]
- **Pertanyaan utama**: [1–2 pertanyaan yang ingin dijawab]

## 2. Chart Selection & Alasan
| Chart | Pertanyaan yang Dijawab | Alasan Pemilihan |
| :--- | :--- | :--- |
| Bar | Kategori mana yang tertinggi? | Perbandingan diskret |
| Line | Bagaimana tren 12 bulan terakhir? | Time-series kontinu |
| ... | ... | ... |

## 3. Prinsip Desain yang Diterapkan
- **Decluttering**: [gridlines dihapus, label berlebih dihilangkan]
- **Focus**: [warna aksen pada insight kunci]
- **Context**: [perbandingan vs target/periode sebelumnya]

## 4. Storytelling — Before vs After
[Sertakan screenshot before–after untuk satu chart]

**Before**: Judul deskriptif, semua bar berwarna sama, tidak ada anotasi.
**After**: Narrative title, bar kunci disorot merah, anotasi pada peak, gridlines dihapus.

## 5. Insight Utama (max 3)
1. [Insight 1] — [angka pendukung] → [implikasi]
2. [Insight 2] — [angka pendukung] → [implikasi]

## 6. Rekomendasi
- [Action 1]
- [Action 2]

## 7. Refleksi
- Apa yang paling menantang dalam memilih chart?
- Prinsip desain mana yang paling berdampak pada komunikasi insight?
```

---

## 📚 Resources & Referensi

### 📖 Bacaan Wajib
- [ONS — Choosing a Chart Type](https://service-manual.ons.gov.uk/data-visualisation/chart-types/choosing-a-chart-type) — panduan resmi pemilihan chart
- [Dataquest — Choosing the Right Chart](https://www.dataquest.io/blog/choosing-the-right-chart-for-your-data/) — tutorial interaktif dengan studi kasus Superstore
- [Dataquest — Designing Clear and Impactful Visuals](https://www.dataquest.io/blog/designing-clear-and-impactful-visuals/) — three-level framework desain visual

### 🎥 Video & Kursus
- **Storytelling with Data** (Cole Nussbaumer Knaflic) — buku klasik tentang narasi visual
- **Google Looker Studio** — [Dokumentasi Resmi](https://cloud.google.com/looker-studio/docs) 

### 🧰 Tools
- [Google Colab](https://colab.research.google.com/) — notebook Python gratis
- [Looker Studio](https://lookerstudio.google.com/) — BI dashboard gratis
- [ColorBrewer](https://colorbrewer2.org/) — palet warna untuk visualisasi

---

## 🤝 Kontribusi

Kontribusi terbuka! Silakan fork, buat branch, dan ajukan Pull Request.

## 📄 Lisensi

MIT License — bebas digunakan untuk edukasi dan komersial.

---

<div align="center">

⭐ **Selesaikan Project 2 dan tunjukkan kemampuan visualisasi Anda!** ⭐

*Modul ini disusun untuk edukasi Data Analyst — [Nama Anda]*

</div>
