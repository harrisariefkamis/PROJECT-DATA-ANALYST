---
marp: true
theme: default
paginate: true
class: lead
---

# Introduction to Python

---

## Tujuan Pembelajaran

- Mengerti alasan menggunakan Python untuk data
- Menjalankan kode Python di notebook (Colab / Jupyter)
- Memahami tipe data dasar, variabel, dan koleksi
- Menyelesaikan latihan singkat

---

## Mengapa Python?

- Mudah dipelajari untuk pemula
- Sintaks yang jelas dan ringkas
- Interpreted — cocok untuk eksplorasi data
- Ekosistem lengkap (pandas, numpy, scikit-learn, dst.)

---

## Cara Menjalankan Python

1. Google Colab (gratis): https://colab.research.google.com
2. Anaconda (local): https://www.anaconda.com/
3. Python.org installer: https://www.python.org/downloads

---

## Notebook (Colab / Jupyter)

- Kode dieksekusi per sel
- Gunakan "File → Save a copy in Drive" di Colab sebelum mulai
- Tambahkan setup cell di awal untuk menginstal dependensi

---

## Operator Aritmatika (contoh)

- +, -, *, / (float division), // (integer division), % (modulus), ** (power)

```python
# Contoh
(3 + 2) * 2  # 10
25 / 6       # 4.1666...
25 // 6      # 4
```

---

## Variabel

- Penetapan: `x = 10`
- Hindari nama yang tidak jelas — gunakan `total_minutes`, `avg_score` dll.
- Cetak dengan `print()`

---

## Tipe Data Dasar

- int, float, str, bool
- Periksa tipe dengan `type()`

```python
type(12)    # int
type(12.0)  # float
```

---

## Koleksi Data

- List: ordered, mutable — `[1,2,3]`
- Tuple: ordered, immutable — `(1,2,3)`
- Set: unordered, unique — `{1,2,3}`
- Dict: key-value — `{'name':'Budi'}`

---

## Tips Colab untuk Praktik

- Tambahkan setup cell dengan `!pip install` bila perlu
- Cek versi: `import sys; print(sys.version)`
- Simpan salinan: File → Save a copy in Drive

---

## Latihan Singkat (Hands-on)

1. Cetak "Hello world!" menggunakan print
2. Buat variabel `total_minutes` = 160; hitung `total_hours` (float) dan `hours_int` (integer)
3. Buat list berisi 5 angka, tampilkan elemen terakhir
4. Buat dictionary biodata dengan nama & panggilan, tampilkan panggilan

---

## Penutup

- Praktikkan di Colab: buka link yang sudah dibagikan
- Pertanyaan? Diskusi & Q&A

---

Thank you!
