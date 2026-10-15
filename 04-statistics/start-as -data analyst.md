# Statistik — Pengantar dan Ukuran Pemusatan & Penyebaran

Expected outcome
- Peserta memahami konsep dasar statistika untuk analisis data.  
- Peserta memahami ukuran pemusatan (measure of centric) dan ukuran penyebaran (measure of distribution).  
- Peserta dapat menghitung dan menginterpretasikan mean, median, mode, range, variance, standar deviasi, dan z-score.  
- Peserta paham tipe data dan kapan menggunakan ukuran statistik tertentu.

---

## Outline
1. Pengantar statistika  
2. Tipe data  
3. Measure of centric (Mean, Median, Mode, Range)  
4. Measure of distribution (Variance, Standard Deviation, Z-score, Quartile, IQR)  
5. Contoh kasus & perhitungan (dataset warung gorengan)  
6. Latihan & referensi

---

## 1. Pengantar Statistika
Statistika berkaitan dengan cara pengumpulan, pengolahan, analisis, dan penarikan kesimpulan atas data. Statistika menyajikan ukuran-ukuran yang memudahkan kita memahami karakteristik sekumpulan data (mis. jumlah kasus positif per hari).

---

## 2. Tipe-Tipe Data
- Kualitatif / Kategorikal
  - Nominal: tidak berurutan (contoh: jenis kelamin)  
  - Ordinal: berurutan/beringkat (contoh: kelas ekonomi/business/executive)  
- Kuantitatif / Numerikal
  - Diskrit: nilai terhitung (contoh: jumlah antrian)  
  - Kontinu: nilai dalam interval (contoh: waktu, berat)

Pemilihan statistik tergantung tipe data (mis. mean hanya cocok untuk data numerik).

---

## 3. Measure of Centric (Ukuran Pemusatan)
Measure of centric memberi gambaran di mana data “terkumpul”.

- Mean (Rata-rata)
  - Rumus: mean = (Σ xi) / n  
  - Sensitif terhadap outlier.
- Median (Nilai Tengah)
  - Nilai tengah setelah data diurutkan. Untuk n ganjil, position = (n+1)/2.
  - Tidak sensitif terhadap outlier.
- Mode (Modus)
  - Nilai yang paling sering muncul.
  - Bisa tidak ada atau lebih dari satu modus.
- Range (Jangkauan)
  - Range = max(data) − min(data)
  - Memberi gambaran sebaran kasar.

Contoh dataset (jumlah pelanggan warung A, 15 hari):
26, 37, 76, 49, 95, 69, 83, 87, 39, 95, 59, 83, 83, 87, 46

Urutkan:
26, 37, 39, 46, 49, 59, 69, 76, 83, 83, 83, 87, 87, 95, 95

Perhitungan:
- Mean = 1014 / 15 = 67.6  
- Median = nilai ke-8 = 76  
- Mode = 83 (muncul 3 kali)  
- Range = 95 − 26 = 69

Interpretasi singkat: mean (67.6) lebih kecil dari beberapa nilai tinggi, menunjukkan adanya variasi; median (76) memberi gambaran nilai tengah; modus (83) menunjukkan nilai yang sering muncul.

---

## 4. Measure of Distribution (Ukuran Penyebaran)
Mengukur seberapa tersebar data di sekitar pusat.

- Variance (Variansi)
  - Variansi = rata-rata kuadrat deviasi terhadap mean.
  - Untuk sampel: S^2 = Σ(xi − x̄)^2 / (n − 1)
  - Untuk populasi: σ^2 = Σ(xi − μ)^2 / n
- Standard Deviation (Simpangan Baku)
  - Std dev = sqrt(variance)
  - Satuan sama dengan data asli → mudah diinterpretasikan.
- Z-score
  - Z = (X − μ) / σ
  - Mengukur seberapa jauh sebuah observasi dari mean dalam satuan std dev.
  - Berguna untuk membandingkan nilai antar distribusi berbeda dan mendeteksi outlier.
- Quartile & IQR
  - Q1 (kuartil bawah), Q2 (median), Q3 (kuartil atas).  
  - IQR = Q3 − Q1; sering digunakan untuk identifikasi outlier (batas IQR*1.5).

Perhitungan contoh (dataset di atas):
- Σ(xi − mean)^2 = 7.409,6  
  - Variansi sampel (n−1=14) ≈ 529.257 → Std dev sampel ≈ 23.01  
  - Variansi populasi (n=15) ≈ 493.97 → Std dev populasi ≈ 22.23
- Kuartil:
  - Q1 = nilai ke-4 = 46  
  - Q2 = median = 76  
  - Q3 = nilai ke-12 = 87  
  - IQR = 87 − 46 = 41

Catatan: gunakan varian sampel saat membuat inferensi dari sampel ke populasi (umumnya di analisis praktis), dan gunakan populasi jika data adalah seluruh populasi.

---

## 5. Z-score — Contoh Interpretasi
Contoh: Ali mendapat nilai 90; kelas rata-rata 75; std dev = 8  
Z = (90 − 75) / 8 = 1.875 → Ali ≈ 1.875 std dev di atas mean (kira-kira di persentil ~96,6%).

Contoh perbandingan antar-area:
- Area Jawa Barat: μ=50,000,000; σ=5,000,000; Bejo X=55,000,000 → Z=1.0  
- Area DKI Jakarta: μ=60,000,000; σ=8,000,000; Udin X=65,000,000 → Z=0.625  
Interpretasi: relatif terhadap area masing-masing, performa Bejo (Z=1.0) lebih baik dibanding Udin (Z=0.625).

---

## 6. Outlier (Pencilan)
Penyebab outlier: kesalahan input, kesalahan pengukuran, sampling, kejadian alami, dsb.  
Deteksi umum: nilai di luar [Q1 − 1.5×IQR, Q3 + 1.5×IQR] atau Z-score absolut > 3 (untuk asumsi distribusi normal).

---

## 7. Langkah Praktis Analisis Statistik
1. Visualisasi ringkas (histogram, boxplot)  
2. Hitung measure of centric & distribution (mean, median, std dev, IQR)  
3. Identifikasi outlier & tentukan aksi (hapus, impute, atau investigasi)  
4. Segmentasi & bandingkan kelompok (mean per grup, z-score)  
5. Laporkan temuan dengan interpretasi & rekomendasi

---

## 8. Latihan (Praktik)
1. Gunakan dataset warung gorengan (di atas) untuk menghitung: mean, median, mode, range, variance (sampel), std dev (sampel), Q1/Q2/Q3, IQR, dan deteksi outlier.  
2. Hitung z-score untuk nilai 95 pada dataset; interpretasikan apakah nilai 95 termasuk outlier.  
3. Bandingkan median vs mean: apa artinya jika mean jauh berbeda dari median?  
4. (Opsional) Isikan dan rapikan latihan di Google Sheets:  
   https://docs.google.com/spreadsheets/d/1rU4L4DTFjbjjgih3bUuN09fuhaEbR_efyrj6iJO0EoE/edit#gid=1673476200

---

## 9. Ringkasan
- Measure of centric menjelaskan titik tengah data (mean, median, mode, range).  
- Measure of distribution menjelaskan sebaran data (variance, std dev, IQR, z-score).  
- Pilih ukuran yang sesuai berdasarkan tipe data dan tujuan analisis.  
- Gunakan visualisasi sederhana untuk membantu interpretasi.

---

## Referensi singkat
- Materi internal modul  
- Sumber pengantar statistik umum (buku & artikel online)
