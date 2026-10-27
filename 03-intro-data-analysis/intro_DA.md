# Career as DA

[![GitHub repo](https://img.shields.io/badge/GitHub-PROJECT--DATA--ANALYST-181717?labelColor=1E293B&logo=github&logoColor=white)](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST)
[![Last commit](https://img.shields.io/github/last-commit/harrisariefkamis/PROJECT-DATA-ANALYST?labelColor=1E293B&logo=git&logoColor=white)](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST/commits)
[![Stars](https://img.shields.io/github/stars/harrisariefkamis/PROJECT-DATA-ANALYST?labelColor=1E293B&logo=github&logoColor=white)](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST/stargazers)
[![Forks](https://img.shields.io/github/forks/harrisariefkamis/PROJECT-DATA-ANALYST?labelColor=1E293B&logo=github&logoColor=white)](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST/network/members)
[![Issues](https://img.shields.io/github/issues/harrisariefkamis/PROJECT-DATA-ANALYST?labelColor=1E293B&logo=github&logoColor=white)](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST/issues)
![PRs welcome](https://img.shields.io/badge/PRs-welcome-34D399?labelColor=1E293B)
![Made with Markdown](https://img.shields.io/badge/Made%20with-Markdown-083FA1?labelColor=1E293B&logo=markdown&logoColor=white)

![Level](https://img.shields.io/badge/Level-Pemula-34D399?labelColor=1E293B)
![Modul](https://img.shields.io/badge/Modul-Career%20%26%20Onboarding-F97316?labelColor=1E293B)
![Fokus](https://img.shields.io/badge/Fokus-Analytical%20Thinking-8B5CF6?labelColor=1E293B)
![Bahasa](https://img.shields.io/badge/Bahasa-ID%20%2F%20EN-EF4444?labelColor=1E293B)

![SQL](https://img.shields.io/badge/SQL-4479A1?labelColor=1E293B&logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?labelColor=1E293B&logo=python&logoColor=white)
![Google Sheets](https://img.shields.io/badge/Google%20Sheets-34A853?labelColor=1E293B&logo=googlesheets&logoColor=white)
![Looker Studio](https://img.shields.io/badge/Looker%20Studio-4285F4?labelColor=1E293B&logo=looker&logoColor=white)
![dbt](https://img.shields.io/badge/dbt-FF694B?labelColor=1E293B&logo=dbt&logoColor=white)
![Airflow](https://img.shields.io/badge/Airflow-017CEE?labelColor=1E293B&logo=apacheairflow&logoColor=white)

> Badge GitHub di atas mengarah ke repo roadmap utama. Jika modul ini ada di repo milikmu sendiri, ganti `harrisariefkamis/PROJECT-DATA-ANALYST` dengan `USERNAME/REPO` milikmu.

## Daftar Isi

- [Expected Outcome](#expected-outcome)
- [Outline Singkat](#outline-singkat)
- [Definisi Singkat](#definisi-singkat)
- [Output Utama Data Analyst](#output-utama-data-analyst)
- [Analytical Thinking](#analytical-thinking)
- [1. Capture and Validate Requirement](#1-capture-and-validate-requirement)
- [2. Extract and Preprocess](#2-extract-and-preprocess)
- [3. Do the Analysis](#3-do-the-analysis)
- [4. Interpretasi dan Rekomendasi](#4-interpretasi-dan-rekomendasi)
- [Case Study (Simulation)](#case-study-simulation)
- [Exercises](#exercises)
- [Tools yang Umum Dipakai](#tools-yang-umum-dipakai)
- [Ringkasan](#ringkasan-key-takeaways)
- [Next Steps](#next-steps)
- [Referensi dan Sumber](#referensi-dan-sumber)

---

## Expected Outcome

Setelah mempelajari modul ini, peserta akan:

- [ ] Memahami ruang lingkup bidang data analytics dan peran-peran di dalamnya.
- [ ] Memahami proses untuk menjadi seorang Data Analyst.
- [ ] Melatih analytical thinking sebagai komponen utama pekerjaan Data Analyst.
- [ ] Mengenal tools umum yang digunakan oleh Data Analyst.

---

## Outline Singkat

1. Apa itu Data Analytics / Data Analysis / Data Analyst
2. Output kerja Data Analyst
3. Analytical thinking: proses dan workflow
4. Contoh kasus dan latihan (simulation form)
5. Extract dan preprocess data (data sources dan quality)
6. Do the analysis, interpretasi, rekomendasi
7. Tools yang umum digunakan
8. Ringkasan dan next steps

---

## Definisi Singkat

| Istilah | Definisi |
|---|---|
| **Data Analytics** | Bidang/proses mengubah data mentah menjadi insight yang dapat ditindaklanjuti ([AWS, 2023](#referensi-dan-sumber)). |
| **Data Analysis** | Bagian dari Data Analytics: keterampilan/aktivitas memecah masalah menjadi bagian-bagian untuk dipahami lewat data. |
| **Data Analyst** | Orang yang membersihkan, menganalisis, memodelkan, dan menyajikan data untuk mendukung keputusan bisnis. |

---

## Output Utama Data Analyst

| # | Output | Deskripsi | Skill/Tools penting | Modul terkait |
|---|---|---|---|---|
| 1 | **Analysis / Investigation** | Investigasi masalah, temuan, rekomendasi | Analytical thinking, SQL, Sheets | 05-11, 12-14 |
| 2 | **Dashboard** | Laporan otomatis dan interaktif | Looker Studio, Looker, Tableau, Redash | 15-16 |
| 3 | **Dataset / CSV** | Dataset bersih untuk eksperimen atau replikasi hasil | SQL, Sheets | 05-11 |
| 4 | **Pipeline dan Data Quality Maintenance** | Memastikan ketersediaan dan kualitas data | dbt, Python, data engineering | 10, 12-13 |

---

## Analytical Thinking

Analytical thinking membantu:

1. Mengidentifikasi dan mendefinisikan masalah
2. Mengekstrak informasi relevan dari data
3. Mengusulkan solusi yang dapat dijalankan

**Workflow singkat:**

```text
Capture & validate requirement (WHY > WHAT > HOW)
        |
Extract & preprocess data
        |
Do the analysis (findings)
        |
Interpret & communicate (conclusion & recommendation)
```

---

## 1. Capture and Validate Requirement

Dilakukan **sebelum analisis**. Tujuannya menyamakan ekspektasi dengan user, mengurangi asumsi, dan memvalidasi apakah masalah bisa dianalisis.

**Checklist:**

- [ ] **Background:** konteks dan gejala (apa yang terjadi, kapan, seberapa besar)
- [ ] **Objective:** tujuan analisis yang spesifik dan terukur
- [ ] **Data scope:** what / where / when / who (rentang waktu, area, segmen)
- [ ] **Initial hypotheses / point to be checked:** hipotesis awal dari user

**Contoh (ilustrasi):**

| Komponen | Isi |
|---|---|
| Background | Penurunan penjualan 10% pada Nov 2023, kategori Kosmetik paling terdampak |
| Objective | Identifikasi penyebab penurunan pada kategori Kosmetik di event 11.11 |
| Data | Transaksi Nov 2023, log promo, downtime system, wilayah Jabodetabek |
| Hypotheses | (1) system down jam 20-21, (2) promo engine gagal |

---

## 2. Extract and Preprocess

### Sumber data

- **Internal:** app tracking, transaction DB, customer data
- **External:** Google Analytics, hari libur nasional, data kompetitor

### Quality checklist

- [ ] **Availability:** data tersedia?
- [ ] **Ready-to-use:** format dan tipe data sesuai?
- [ ] **Reliable:** ada missing value, anomali, atau duplikat?
- [ ] **Access:** izin akses sudah ada?

### Tips preprocessing

- Hapus duplikat, perbaiki tipe data, standarkan format tanggal.
- Tangani missing value: drop / median / mean / impute, tergantung proporsinya.
- Tandai anomali/outlier dan dokumentasikan asumsi.

---

## 3. Do the Analysis

**Langkah praktis:**

1. Jalankan query atau ringkasan statistik (count, sum, avg, persentase).
2. Visualisasikan tren per waktu dan per segmen.
3. Segmentasi: channel, cohort, product, geography.
4. Periksa outlier dan korelasi sederhana.
5. Lakukan tes statistik jika diperlukan.

**Fungsi agregasi yang sering dipakai:**

`COUNT`, `COUNT DISTINCT`, `SUM`, `AVG`, `MEDIAN`, `PERCENTILE`, `MIN`, `MAX`

---

## 4. Interpretasi dan Rekomendasi

- Kaitkan findings kembali ke objective awal.
- Tuliskan kesimpulan yang jelas: apa penyebabnya (jika ada).
- Berikan rekomendasi konkret dan terprioritas (siapa yang bertindak, timeline, monitoring berikutnya).

**Contoh (ilustrasi):**

- **Conclusion:** penurunan disebabkan promo engine gagal selama 2 jam, sehingga penjualan turun 20% pada jam tersebut.
- **Recommendation:** laporkan ke tim Backend, pasang fallback promo, dan lakukan monitoring real-time pada event berikutnya.

---

## Case Study (Simulation)

### Case A: OTA (lonjakan penjualan 3 Nov 2023)

- **Background:** lonjakan +50% vs hari sebelumnya, +25% vs bulan lalu
- **Objective:** cari penyebab lonjakan
- **Data required:** transaksi 2 Nov, 3 Nov, 3 Okt; user baru/lama; promo usage; referral logs
- **Hypotheses to check:** promo baru untuk user baru; promo untuk user lama; lonjakan promo referral

### Case B: FinTech (lonjakan rata-rata waktu tunggu 1-5 Nov 2023)

- **Background:** average wait time naik, banyak komplain
- **Objective:** identifikasi penyebab delay
- **Data required:** transaction logs 1-5 Nov, system health logs, product-level metrics
- **Hypotheses:** system degradation pada jam tertentu; issue pada product tertentu

### Template answer form

```text
Background                      :
Objective                       :
Data                            :
Point to be checked / hypotheses:
```

---

## Exercises

- [ ] **1.** Lengkapi Analytical Thinking Framework untuk Case A (OTA) menggunakan template answer form di atas.
- [ ] **2.** Buat query SQL pseudo untuk menghitung daily transactions, new-user transactions, dan promo usage pada 2-3 Nov dan 3 Okt.
- [ ] **3.** Dari hasil nomor 2, jelaskan temuan singkat (3 bullet) dan rekomendasi 1 tindakan.

<details>
<summary>Petunjuk untuk nomor 2 (pseudo-SQL, nama tabel dan kolom hanya asumsi)</summary>

```sql
SELECT
  DATE(created_at)                                  AS trx_date,
  COUNT(*)                                          AS total_transactions,
  COUNT(CASE WHEN is_new_user THEN 1 END)           AS new_user_transactions,
  COUNT(CASE WHEN promo_code IS NOT NULL THEN 1 END) AS promo_transactions
FROM transactions
WHERE DATE(created_at) IN ('2023-11-02', '2023-11-03', '2023-10-03')
GROUP BY 1
ORDER BY 1;
```

Sesuaikan nama tabel dan kolom dengan dataset yang kamu pakai.

</details>

---

## Tools yang Umum Dipakai

| Kategori | Tools | Kegunaan |
|---|---|---|
| SQL | BigQuery, PostgreSQL, MySQL | Eksplorasi dan extraction |
| Spreadsheet | Google Sheets, Excel | Quick analysis, ad-hoc checks |
| Python | Pandas, NumPy | Preprocessing, transformasi, analisis kompleks |
| Visualisasi / BI | Looker Studio, Tableau, Redash, Looker | Dashboarding dan reporting |
| ETL / Pipeline | dbt, Airflow | Transformasi dan maintainability |

---

## Ringkasan (Key Takeaways)

1. Bedakan **Analytics** (bidang), **Analysis** (keterampilan/proses), dan **Analyst** (orang).
2. Empat output Data Analyst: Analysis, Dashboard, Dataset, Pipeline/Quality.
3. Analytical thinking = capture requirement, preprocess, analyze, interpret, recommend.
4. Selalu mulai dari requirement dan hipotesis. Jika ada gap, gunakan exploratory checks (outlier, tren).
5. Presentasi hasil harus memuat **conclusion** dan **actionable recommendation**.

---

## Next Steps

- [ ] Praktikkan template answer form pada Case A dan B. Simpan hasil di `01-on-boarding/exercises/`.
- [ ] Tambahkan SQL pseudo-scripts dan notebook hasil eksplorasi ke `01-on-boarding/notebooks/`.
- [ ] Buat ringkasan temuan dan 1 slide rekomendasi untuk stakeholder.

---

## Referensi dan Sumber

### Sumber utama modul

- AWS. *What is Data Analytics* (2023): [aws.amazon.com/what-is/data-analytics](https://aws.amazon.com/what-is/data-analytics/)
- Ilin, Klimin, Shaban. *Features of Big Data approach and new opportunities of BI-systems in marketing activities*. E3S Web of Conferences 110: cari judulnya di [e3s-conferences.org](https://www.e3s-conferences.org/)

### Repo dan roadmap

- [harrisariefkamis/PROJECT-DATA-ANALYST](https://github.com/harrisariefkamis/PROJECT-DATA-ANALYST): roadmap belajar 17 modul
- [microsoft/Data-Science-For-Beginners](https://github.com/microsoft/Data-Science-For-Beginners)
- [DataTalksClub/data-engineering-zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp): untuk topik pipeline

### Dokumentasi tools

- [BigQuery documentation](https://cloud.google.com/bigquery/docs)
- [Looker Studio](https://lookerstudio.google.com)
- [dbt documentation](https://docs.getdbt.com)
- [Apache Airflow](https://airflow.apache.org)
- [Redash](https://redash.io)
- [pandas documentation](https://pandas.pydata.org/docs/)

### Latihan

- [Kaggle Learn](https://www.kaggle.com/learn)
- [Mode SQL Tutorial](https://mode.com/sql-tutorial)

> Link referensi di bagian ini ditulis dari ingatan dan belum saya cek satu per satu.Jika ada yang tidak terbuka, cari nama dokumennya langsung.! 
