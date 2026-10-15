# RintisKarirImpian — Kickstart Career as Data Analyst

## Expected outcome
Setelah mempelajari modul ini, peserta akan:
- Memahami ruang lingkup bidang data analytics dan peran-peran di dalamnya.
- Memahami proses untuk menjadi seorang Data Analyst.
- Melatih analytical thinking sebagai komponen utama pekerjaan Data Analyst.
- Mengenal tools umum yang digunakan oleh Data Analyst.

---

## Outline singkat
1. Apa itu Data Analytics / Data Analysis / Data Analyst  
2. Output kerja Data Analyst  
3. Analytical thinking: proses dan workflow  
4. Contoh kasus & latihan (simulation form)  
5. Extract & preprocess data (data sources & quality)  
6. Do the analysis, interpretasi, rekomendasi  
7. Tools yang umum digunakan  
8. Ringkasan & next steps

---

## Definisi singkat
- Data Analytics: proses mengubah data mentah menjadi insight yang dapat ditindaklanjuti (AWS, 2023).
- Data Analysis: bagian dari Data Analytics — keterampilan/aktivitas memecah masalah menjadi bagian-bagian untuk dipahami lewat data.
- Data Analyst: orang yang membersihkan, menganalisis, memodelkan, dan menyajikan data untuk mendukung keputusan bisnis.

---

## Output utama dari Data Analyst
1. Analysis / Investigation — investigasi masalah, temuan, rekomendasi. (Skill penting: analytical thinking, SQL, Sheets)  
2. Dashboard — laporan otomatis & interaktif (Looker/Redash/Tableau/Looker Studio)  
3. Dataset / CSV — dataset bersih untuk eksperimen atau replikasi hasil (SQL, Sheets)  
4. Pipeline & Data Quality Maintenance — memastikan ketersediaan & kualitas data (DBT, Python, engineering)

Tautan rekomendasi kelas:
- Analysis: Modul 05–11, 12–14  
- Dashboard: Modul 15–16  
- Pipeline & Data Quality: Modul 10, 12–13

---

## Analytical thinking — ringkasan
Analytical thinking membantu:
1. Identifikasi & definisi masalah  
2. Mengekstrak informasi relevan dari data  
3. Mengusulkan solusi yang dapat dijalankan

Workflow singkat:
1. Capture & validate requirement (WHY → WHAT → HOW)  
2. Extract & preprocess data  
3. Do the analysis (findings)  
4. Interpret & communicate (conclusion & recommendation)

---

## 1) Capture & Validate Requirement (sebelum analisis)
Tujuan: samakan ekspektasi dengan user, kurangi asumsi, validasi apakah masalah bisa dianalisis.

Checklist:
- Background: konteks dan gejala (apa yang terjadi, kapan, seberapa besar)  
- Objective: tujuan analisis yang spesifik dan terukur  
- Data scope: what/where/when/who (rentang waktu, area, segmen)  
- Initial hypotheses / point to be checked — hipotesis awal dari user

Contoh struktur singkat:
- Background: Penurunan penjualan 10% pada Nov 2023, kategori Kosmetik paling terdampak  
- Objective: Identifikasi penyebab penurunan pada kategori Kosmetik di event 11.11  
- Data: Transaksi Nov 2023, log promo, downtime system, wilayah Jabodetabek  
- Hypotheses: (1) system down jam 20–21, (2) promo engine gagal

---

## 2) Extract & Preprocess (data sources & quality)
Sumber data:
- Internal: app tracking, transaction DB, customer data  
- External: Google Analytics, public holidays, competitor data

Quality checklist:
- Data tersedia? (availability)  
- Ready-to-use? (format, types)  
- Reliable? (missing, anomalies, duplicates)  
- Access / permission?

Preprocessing tip:
- Remove duplicates, fix types, standardize date formats  
- Handle missing: drop/median/mean/impute depending proporsi  
- Flag anomalies/outliers, dokumentasikan asumsi

---

## 3) Do the Analysis (finding)
Langkah praktis:
- Jalankan query/summary statistik (count, sum, avg, pct)  
- Visualisasi tren per waktu, per segmen  
- Segmentasi: channel, cohort, product, geography  
- Check outliers dan korelasi sederhana  
- Tes statistik jika diperlukan

Contoh formula yang sering dipakai:
- COUNT, COUNT DISTINCT, SUM, AVG, MEDIAN, PERCENTILE, MIN, MAX

---

## 4) Interpretasi & Recommendation
- Kaitkan findings kembali ke objective awal  
- Tuliskan kesimpulan jelas: apa penyebab (jika ada)  
- Rekomendasi konkret & prioritas (who to action, timeline, next monitoring)

Contoh:
- Conclusion: Penurunan disebabkan promo engine gagal selama 2 jam → penjualan turun 20% di jam tersebut  
- Recommendation: Laporkan ke Backend, pasang fallback promo, monitoring real-time event next time

---

## Case study (Simulation)
Case A — OTA (lonjakan penjualan 3 Nov 2023)
- Background: lonjakan +50% vs hari sebelumnya; +25% vs bulan lalu  
- Objective: cari penyebab lonjakan  
- Data required: transaksi 2 Nov, 3 Nov, 3 Oct; user baru/lama; promo usage; referral logs  
- Hypotheses to check: promo baru untuk user baru; promo untuk user lama; promo referral spike

Case B — FinTech (lonjakan rata-rata waktu tunggu 1–5 Nov 2023)
- Background: average wait time naik, banyak komplain  
- Objective: identifikasi penyebab delay  
- Data required: transaction logs 1–5 Nov, system health logs, product-level metrics  
- Hypotheses: system degradation pada jam tertentu; issue pada product tertentu

Answer form (template buat peserta):
- Background: ...  
- Objective: ...  
- Data: ...  
- Point to be checked / hypotheses: ...

---

## Exercises (distribusi tugas)
1. Lengkapi Analytical Thinking Framework untuk Case A (OTA). Gunakan template answer form di atas.  
2. Buat query SQL pseudo untuk menghitung daily transactions, new-user transactions, dan promo usage untuk 2–3 Nov & 3 Oct.  
3. Dari hasil (2), jelaskan temuan singkat (3 bullet) dan rekomendasi 1 tindakan.

---

## Tools yang umum dipakai
- SQL (BigQuery, Postgres, MySQL) — eksplorasi & extraction  
- Spreadsheet (Google Sheets, Excel) — quick analysis, ad-hoc checks  
- Python (Pandas, NumPy) — preprocessing, transformasi, complex analysis  
- Visualization / BI (Looker Studio, Tableau, Redash, Looker) — dashboarding & reporting  
- ETL / Pipeline tools (DBT, Airflow) — transform & maintainability

---

## Ringkasan (Key takeaways)
1. Bedakan: Analytics (bidang), Analysis (keterampilan/proses), Analyst (orang).  
2. Empat output Data Analyst: Analysis, Dashboard, Dataset, Pipeline/Quality.  
3. Analytical thinking = capture requirement → preprocess → analyze → interpret → recommend.  
4. Selalu mulai dari requirement & hipotesis; jika gap, gunakan exploratory checks (outliers, trend).  
5. Presentasi hasil harus memuat conclusion + actionable recommendation.

---

## Next steps (practice & deliverables)
- Praktikkan template answer form pada Case A & B. Simpan hasil di `01-on-boarding/exercises/`.  
- Tambahkan SQL pseudo-scripts dan notebook hasil eksplorasi ke `01-on-boarding/notebooks/`.  
- Buat ringkasan temuan dan 1-slide rekomendasi untuk stakeholder.

---

## Referensi
- AWS: What is Data Analytics (2023)  
- Ilin, Klimin, Shaban — Features of Big Data approach and BI-systems in marketing activities (E3S Web of Conferences 110)
