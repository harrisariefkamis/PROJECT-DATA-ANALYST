# Basic Python Exercises — Introduction to Python

Berisi latihan singkat untuk peserta; tiap soal dilengkapi contoh jawaban.

## Exercise 1 — Hello world
Tulis kode untuk mencetak:

Hello world!

Contoh jawaban:
```python
print("Hello world!")
```

---

## Exercise 2 — Minutes to hours
Diberi variabel total_minutes = 160
- Hitung total_hours (float): total_minutes / 60
- Hitung hours_int (integer): total_minutes // 60

Contoh jawaban:
```python
total_minutes = 160
total_hours = total_minutes / 60
hours_int = total_minutes // 60
print(total_hours, hours_int)
```

---

## Exercise 3 — List operations
Buat list angka: nums = [10, 20, 30, 40, 50]
- Tampilkan elemen terakhir
- Tambahkan angka 60 ke list

Contoh jawaban:
```python
nums = [10, 20, 30, 40, 50]
print(nums[-1])
nums.append(60)
print(nums)
```

---

## Exercise 4 — Dictionary (Biodata)
Buat dictionary biodata berisi: nama_lengkap, nama_panggilan, umur, kota
Tampilkan nama_panggilan

Contoh jawaban:
```python
biodata = {
  "nama_lengkap": "Nama Kamu",
  "nama_panggilan": "Panggilan",
  "umur": 25,
  "kota": "Jakarta"
}
print(biodata["nama_panggilan"])  # Panggilan
```

---

## Exercise 5 — Simple function
Buat fungsi `to_hours(minutes)` yang menerima integer menit dan mengembalikan float jam.

Contoh jawaban:
```python
def to_hours(minutes):
    return minutes / 60.0

print(to_hours(160))
```

---

## Exercise 6 — Bonus: Read CSV (pandas)
Buat sample CSV `data/sample.csv` dengan dua kolom: name,score. Tulis kode untuk memuat CSV dan menampilkan rata-rata score.

Contoh jawaban:
```python
import pandas as pd
df = pd.read_csv('data/sample.csv')
print(df['score'].mean())
```

---

Simpan file jawaban sebagai `13-introduction-to-python/exercises/basic_python_solutions.py` atau jalankan langsung di Colab.