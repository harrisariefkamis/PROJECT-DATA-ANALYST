# 📊 Data Visualisation 2: Google Looker Studio

> Modul lanjutan visualisasi data berbasis **Business Intelligence (BI)**. Pelajari cara membangun **dashboard interaktif** dengan Looker Studio — dari login, koneksi data, pembuatan KPI, hingga menyusun **executive summary** yang komunikatif untuk stakeholder.

![Looker Studio](https://img.shields.io/badge/Looker%20Studio-4285F4?logo=google&logoColor=white)
![Google Sheets](https://img.shields.io/badge/Google%20Sheets-34A853?logo=googlesheets&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📋 Daftar Isi

- [🎯 Tujuan Pembelajaran](#-tujuan-pembelajaran)
- [🔐 Panduan Instalasi & Login](#-panduan-instalasi--login)
- [🔗 Koneksi Data](#-koneksi-data)
- [📊 Membuat Dashboard](#-membuat-dashboard)
- [🎯 KPI & Scorecard](#-kpi--scorecard)
- [🔄 Interaktivitas: Filter & Date Range](#-interaktivitas-filter--date-range)
- [📑 Executive Summary Dashboard](#-executive-summary-dashboard)
- [🎯 Deliverables Project](#-deliverables-project)
- [📝 Template Laporan Executive Summary](#-template-laporan-executive-summary)
- [🏆 Best Practices Desain Dashboard](#-best-practices-desain-dashboard)
- [📚 Resources](#-resources--referensi)

---

## 🎯 Tujuan Pembelajaran

Setelah menyelesaikan modul ini, Anda diharapkan mampu:

- [x] **Mengakses Looker Studio** melalui browser (web) maupun aplikasi mobile
- [x] **Menghubungkan berbagai sumber data** — Google Sheets, CSV upload, BigQuery
- [x] **Membangun dashboard interaktif** dengan chart, scorecard, dan tabel
- [x] **Membuat KPI strip** yang informatif di bagian atas dashboard
- [x] **Menambahkan filter dan date range** untuk eksplorasi data mandiri
- [x] **Menyusun executive summary** yang menjawab pertanyaan bisnis utama

---

## 🔐 Panduan Instalasi & Login

Looker Studio adalah **tool berbasis cloud gratis** dari Google — **tidak perlu instalasi software**. Cukup buka browser dan login dengan akun Google.

### Opsi 1: Akses via Web (Direkomendasikan)

1.  Buka [https://lookerstudio.google.com/](https://lookerstudio.google.com/) di browser (Chrome direkomendasikan).
2.  Klik **“Use it for free”** atau **“Sign In”**.
3.  Login menggunakan akun **Gmail** atau **Google Workspace** Anda.
4.  Setelah login, Anda akan diarahkan ke **home screen** dengan tiga tab utama: **Reports**, **Data Sources**, dan **Explorer**.

> [!NOTE]
> Jika belum punya akun Google, buat terlebih dahulu di [accounts.google.com](https://accounts.google.com). Looker Studio **tidak memerlukan kartu kredit** dan gratis untuk penggunaan standar.

### Opsi 2: Akses via Aplikasi Mobile (Opsional)

Aplikasi mobile berguna untuk **melihat report on-the-go**, tetapi **pembuatan dashboard tetap direkomendasikan via web**.

1.  **Android**: Buka Play Store → cari **“Looker Studio”** → Install (minimal Android 6+).
2.  **iOS**: Buka App Store → cari **“Looker Studio”** → Install (minimal iOS 14+).
3.  Buka aplikasi → pilih **Get Started / Sign In** → login dengan akun Google.

### Perbedaan Web vs Mobile

| Aspek | Web | Mobile App |
| :--- | :--- | :--- |
| **Membuat dashboard** | ✅ Penuh | ❌ Terbatas |
| **Melihat report** | ✅ | ✅ |
| **Filter & interaksi** | ✅ | ✅ |
| **Edit chart** | ✅ | ❌ |

---

## 🔗 Koneksi Data

Looker Studio mendukung **puluhan konektor data**. Untuk pemula, tiga opsi berikut paling umum digunakan.

### Opsi A: Google Sheets (Direkomendasikan untuk Pemula)

Google Sheets adalah cara termudah karena data dapat diubah secara real-time dan langsung terhubung.

**Langkah-langkah:**

1.  Di home screen Looker Studio, klik **Create** (kiri atas) → pilih **Data Source**.
2.  Pilih konektor **Google Sheets**.
3.  **Authorize** akses ke Google Drive jika diminta.
4.  Pilih **spreadsheet** dan **worksheet** yang berisi data Anda.
5.  Konfigurasikan opsi tambahan jika diperlukan (misalnya, baris header).
6.  Klik **CONNECT** (kanan atas).

> [!TIP]
> Pastikan baris pertama spreadsheet berisi **nama kolom** yang jelas. Hindari merged cells atau format yang tidak konsisten.

### Opsi B: Upload CSV

1.  Klik **Create → Data Source**.
2.  Pilih konektor **File Upload**.
3.  Drag & drop file CSV Anda → klik **Connect**.
4.  Data akan tersimpan di Looker Studio dan dapat di-refresh kapan saja.

### Opsi C: BigQuery (untuk Data Besar)

1.  Klik **Create → Data Source → BigQuery**.
2.  Pilih **project**, **dataset**, dan **table** yang diinginkan.
3.  Klik **Connect**.

### Ringkasan Konektor

| Konektor | Cocok untuk | Ukuran Data | Real-time |
| :--- | :--- | :--- | :--- |
| **Google Sheets** | Data kecil–menengah, kolaborasi | < 100k baris | ✅ |
| **CSV Upload** | Data statis, one-time analysis | < 100MB | ❌ (manual refresh) |
| **BigQuery** | Data besar, query kompleks | Tidak terbatas | ✅ |

---

## 📊 Membuat Dashboard

Setelah data source terhubung, saatnya membangun dashboard.

### Langkah 1: Buat Report Baru

1.  Klik **Create → Report**.
2.  Pilih data source yang sudah dibuat → klik **Add to report**.
3.  Anda akan masuk ke **editor mode** dengan kanvas kosong.

### Langkah 2: Tambahkan Chart

Klik **Add a chart** di toolbar, lalu pilih jenis visualisasi:

| Chart | Kapan Digunakan | Dimension | Metric |
| :--- | :--- | :--- | :--- |
| **Scorecard** | KPI tunggal | — | `SUM(Sales)` |
| **Time Series** | Tren waktu | `Order Date` | `SUM(Sales)` |
| **Bar Chart** | Perbandingan kategori | `Category` | `SUM(Sales)` |
| **Pie Chart** | Proporsi (≤5 slice) | `Ship Mode` | `COUNT(Order ID)` |
| **Table** | Detail data / pivot | `Product` | `SUM(Sales), SUM(Profit)` |

**Cara menambahkan:**
1.  Klik **Add a chart** → pilih tipe chart.
2.  Klik dan drag di kanvas untuk menempatkan chart.
3.  Di panel **Setup** (kanan), atur:
    -   **Dimension** → kolom kategori (sumbu X).
    -   **Metric** → kolom numerik (sumbu Y).
4.  Di panel **Style**, atur warna, legend, dan label.

### Langkah 3: Atur Layout

Susun chart dengan hierarki visual yang jelas:

```text
┌─────────────────────────────────────────────────────┐
│  [Logo]  Dashboard Title          [Date Range]      │
├─────────────────────────────────────────────────────┤
│  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐  │
│  │  KPI 1 │  │  KPI 2 │  │  KPI 3 │  │  KPI 4 │  │
│  └────────┘  └────────┘  └────────┘  └────────┘  │
├─────────────────────────────────────────────────────┤
│  ┌──────────────────────┐  ┌──────────────────────┐ │
│  │   Time Series (Tren) │  │   Bar Chart (Kategori)│ │
│  └──────────────────────┘  └──────────────────────┘ │
└─────────────────────────────────────────────────────┘
```

> [!IMPORTANT]
> **Letakkan KPI scorecard di bagian atas kiri** — ini adalah *prime real estate* yang pertama dilihat audiens.

---

## 🎯 KPI & Scorecard

**Scorecard** adalah komponen untuk menampilkan **satu angka besar** — sangat efektif untuk KPI utama.

### Menambahkan Scorecard

1.  Klik **Add a chart** → pilih **Scorecard**.
2.  Di panel **Setup**, pilih **Metric** — misalnya `SUM(Sales)`, `COUNT(Order ID)`, atau `AVG(Profit)`.
3.  **(Opsional) Comparison:** aktifkan **Comparison date range** untuk menampilkan perbandingan vs periode sebelumnya (MoM, YoY).
4.  **(Opsional) Sparkline:** aktifkan untuk menampilkan tren mini di bawah angka.

### Contoh KPI Strip untuk Executive Summary

| KPI | Metric | Perbandingan |
| :--- | :--- | :--- |
| **Total Revenue** | `SUM(Sales)` | vs bulan lalu |
| **Profit Margin** | `SUM(Profit) / SUM(Sales)` | vs target |
| **Total Orders** | `COUNT(Order ID)` | vs periode sebelumnya |
| **Avg Order Value** | `SUM(Sales) / COUNT(Order ID)` | vs benchmark |

> [!TIP]
> **Maksimal 6 scorecard per halaman** — lebih dari itu membuat dashboard terasa penuh dan sulit dicerna.

---

## 🔄 Interaktivitas: Filter & Date Range

Interaktivitas memungkinkan audiens **mengeksplorasi data sendiri** tanpa perlu mengubah dashboard.

### Menambahkan Date Range Control

1.  Di editor, klik **Add a control** → pilih **Date range control**.
2.  Drag di kanvas (biasanya di atas, dekat judul).
3.  Di panel **Setup**, atur **Default date range** — misalnya *Last 30 days* atau *This month to date*.

### Menambahkan Filter Drop-down

1.  Klik **Add a control** → pilih **Drop-down list**.
2.  Di panel **Setup**, pilih **Control field** — misalnya `Region` atau `Category`.
3.  Filter ini akan otomatis memfilter semua chart yang ada di halaman.

### Tingkatan Filter

Filter dapat diterapkan pada **tiga level**:

| Level | Cakupan | Cara Mengatur |
| :--- | :--- | :--- |
| **Report-level** | Semua halaman | File → Report settings |
| **Page-level** | Satu halaman | Page → Current page settings |
| **Chart-level** | Satu chart | Properties → Setup → Filter |

---

## 📑 Executive Summary Dashboard

**Executive summary** adalah halaman pertama yang harus dilihat stakeholder. Tujuannya: menjawab **“Apakah kita on-track?”** dalam **satu layar tanpa scrolling**.

### Struktur Halaman Executive Summary

```text
┌─────────────────────────────────────────────────────┐
│  EXECUTIVE SUMMARY — [Periode]        [Date Range] │
├─────────────────────────────────────────────────────┤
│  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐  │
│  │Revenue │  │ Profit │  │ Orders │  │  AOV   │  │
│  │  Rp X  │  │  Rp Y  │  │   Z    │  │  Rp W  │  │
│  │ ▲ +12% │  │ ▼ -3%  │  │ ▲ +8%  │  │ ▲ +2%  │  │
│  └────────┘  └────────┘  └────────┘  └────────┘  │
├─────────────────────────────────────────────────────┤
│  ┌──────────────────────────────────────────────┐  │
│  │         Revenue Trend (Line Chart)          │  │
│  └──────────────────────────────────────────────┘  │
├─────────────────────────────────────────────────────┤
│  ┌──────────────────────┐  ┌──────────────────────┐ │
│  │ Revenue by Category  │  │ Top 5 Products       │ │
│  │      (Bar Chart)     │  │      (Table)         │ │
│  └──────────────────────┘  └──────────────────────┘ │
└─────────────────────────────────────────────────────┘
```

### Prinsip Executive Summary

1.  **Satu halaman, satu cerita** — fokus pada pertanyaan *“Bagaimana performa kita periode ini?”* .
2.  **KPI di atas** — scorecard besar dengan perbandingan vs periode sebelumnya.
3.  **Gunakan narrative title** — judul yang menyatakan insight, bukan sekadar nama metric.
4.  **Sertakan “So What?”** — setiap chart harus memiliki takeaway yang jelas.
5.  **Hindari clutter** — hapus gridlines, legend berlebih, dan chart yang tidak esensial.

---

## 🎯 Deliverables Project

### 📦 Yang Dikumpulkan

```text
📦 project-looker-studio/
├── 📄 README.md                     # Deskripsi project
├── 📊 dashboard_link.txt            # Link share dashboard Looker Studio
├── 📸 screenshot_dashboard.png      # Screenshot halaman executive summary
├── 📁 screenshots/
│   ├── page1_executive.png
│   ├── page2_detail.png
│   └── page3_filter.png
└── 📝 laporan_executive_summary.md # Laporan 1 halaman
```

### ✅ Rubrik Penilaian

| Kriteria | Bobot | Indikator |
| :--- | :--- | :--- |
| **Koneksi data** | 15% | Data source terhubung dengan benar, data bersih |
| **Kelengkapan chart** | 20% | Minimal 4 tipe chart berbeda (scorecard, line, bar, table/pie) |
| **KPI & Scorecard** | 20% | 3–6 KPI di atas dashboard, dengan perbandingan periode |
| **Interaktivitas** | 15% | Date range + minimal 1 drop-down filter berfungsi |
| **Desain & Layout** | 15% | Bersih, hierarki jelas, konsisten warna, tidak clutter |
| **Executive Summary** | 15% | Menjawab pertanyaan bisnis utama dalam satu layar |

### 📌 Dataset Rekomendasi

| Dataset | Ukuran | Cocok untuk | Link |
| :--- | :--- | :--- | :--- |
| **Superstore** | ~10k baris | KPI sales, profit, tren, kategori | [Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) |
| **Sample Coffee Shop** | Kecil | Latihan cepat, layout sederhana | [Looker Gallery](https://lookerstudio.google.com/gallery) |
| **Marketing Campaign** | ~2k baris | KPI marketing (ROAS, CTR, conversion) | [Kaggle](https://www.kaggle.com/datasets/rodsaldanha/arketing-campaign) |

---

## 📝 Template Laporan Executive Summary

```markdown
# 📊 Executive Summary — [Nama Dashboard]

## 1. Tujuan Dashboard
- **Audience**: [Eksekutif / Manajer / Tim Marketing]
- **Pertanyaan utama**: [1–2 pertanyaan yang dijawab dashboard]

## 2. Data Source
- **Sumber**: [Google Sheets / CSV / BigQuery]
- **Periode**: [Tanggal awal – akhir]
- **Jumlah baris**: [n]

## 3. KPI Utama (Scorecard)
| KPI | Nilai | vs Periode Lalu | Status |
| :--- | :--- | :--- | :--- |
| Total Revenue | Rp X | +Y% | 🟢 On-track |
| Profit Margin | Z% | -W% | 🔴 Below target |
| Total Orders | N | +M% | 🟢 On-track |

## 4. Insight Utama (Max 3)
1. [Insight 1] — [angka pendukung] → [implikasi]
2. [Insight 2] — [angka pendukung] → [implikasi]

## 5. Rekomendasi Actionable
| Priority | Action | Expected Impact |
| :--- | :--- | :--- |
| 🔴 High | [action] | [impact] |
| 🟡 Med | [action] | [impact] |

## 6. Refleksi
- Prinsip desain apa yang paling membantu komunikasi insight?
- Filter mana yang paling berguna bagi audiens?
```

---

## 🏆 Best Practices Desain Dashboard

### ✅ DO

| Praktik | Alasan |
| :--- | :--- |
| **Satu halaman = satu pertanyaan bisnis** | Fokus dan tidak overwhelming |
| **KPI di atas kiri** | *Prime real estate* — pertama dilihat audiens |
| **Narrative title** | “Revenue Q4 melonjak 32%” > “Revenue by Month” |
| **Warna aksen hanya untuk insight kunci** | Mengarahkan perhatian, bukan mengganggu |
| **Konsisten palet warna** | Profesional dan mudah dibaca |
| **Sertakan konteks (vs target/periode lalu)** | Angka tanpa konteks tidak bermakna |

### ❌ DON'T

| Anti-pattern | Masalah |
| :--- | :--- |
| Terlalu banyak chart per halaman | Audiens bingung harus melihat ke mana |
| Judul deskriptif (“Total Sales”) | Tidak membantu pengambilan keputusan |
| Warna pelangi tanpa makna | Mengalihkan perhatian dari insight |
| Scorecard > 6 per halaman | Dashboard terasa penuh dan tidak fokus |
| Tidak ada filter interaktif | Audiens tidak bisa eksplorasi mandiri |

---

## 📚 Resources & Referensi

### 📖 Dokumentasi Resmi
- [Looker Studio — Welcome Guide](https://docs.cloud.google.com/looker/docs/studio)
- [Connect to Google Sheets](https://docs.cloud.google.com/looker/docs/studio/connect-to-google-sheets)
- [Add Charts and Controls](https://docs.cloud.google.com/looker/docs/studio/add-charts-and-controls)

### 🎥 Tutorial & Kursus
- **Google Looker Studio for Free BI Dashboards** — [Guvi Blog](https://www.guvi.in/blog/build-bi-dashboards-google-looker-studio/) 
- **Add Scorecards with KPIs** — [Gail Reports](https://gaillereports.com/looker-studio-report-tutorial-5-add-scorecards-with-kpis-setup-styling-metrics-explained/) 
- **Multi-page Dashboard Architecture** — [Looker Courses](https://lookercourses.com/architect-a-multi-page-dashboard-in-looker-studio/) 

### 🧰 Tools Pendukung
- [Looker Studio Gallery](https://lookerstudio.google.com/gallery) — template siap pakai
- [ColorBrewer](https://colorbrewer2.org/) — palet warna untuk dashboard
- [Google Sheets](https://sheets.google.com/) — data source yang direkomendasikan

---

## 🤝 Kontribusi

Kontribusi terbuka! Silakan fork, buat branch, dan ajukan Pull Request.

## 📄 Lisensi

MIT License — tidak bebas digunakan untuk edukasi dan komersial.

---

<div align="center">

⭐ **Bangun dashboard interaktif pertama Anda dan tunjukkan insight-nya!** ⭐

*Modul ini disusun untuk edukasi Data Analyst — [harryyss]*

</div>
```

---

Modul di atas sudah lengkap dan siap di-push. Jika Anda ingin menambahkan **contoh screenshot asli** dari dashboard Looker Studio atau **video walkthrough**, bagian tersebut bisa disisipkan pada folder `screenshots/` dan ditautkan di dalam README.
