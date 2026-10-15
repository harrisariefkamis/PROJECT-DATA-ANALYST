# 13_Introduction_to_Python

> Pastikan klik 'File > Save a copy in Drive' sebelum memulai pengerjaan

# Menulis Kode Python Pertamamu

## Tujuan

Setelah menyelesaikan lab ini, kamu akan mampu untuk:

- Menulis kode dasar Python
- Bekerja dengan berbagai tipe objek di Python
- Mengonversi tipe objek ke tipe objek lainnya
- Menggunakan ekspresi dan variable untuk melakukan operasi perhitungan
- Koleksi Data

---

## Daftar Isi

- Katakan "Halo" dunia pada Python
  - Python versi berapa yang anda gunakan?
  - Menuliskan komen di Python?
  - Kesalahan dalam Python
  - Apakah Python tahu kesalahan yang kamu lakukan sebelum menjalankan kode?
  - Latihan: Program pertamamu di Python

- Tipe objek di Python
  - Integers
  - Floats
  - Mengonversi dari tipe object ke tipe data yang lain
  - Tipe data boolean
  - Latihan: Tipe-tipe data

- Ekspresi dan variable
  - Ekspresi
  - Latihan: Ekspresi
  - Variabel
  - Latihan: variabel

- Koleksi Data
  - List
  - Tuple
  - Set
  - Dictionary

- Mini Task

---

## Katakan "Halo" dunia pada Python

Saat mempelajari bahasa pemrograman baru, biasanya dimulai dengan contoh "hello world". Sesederhana itu, satu baris kode ini akan memastikan bahwa kita tahu cara mencetak string dalam output dan cara mengeksekusi kode di dalam sel di notebook.

**Tip:** Untuk mengeksekusi kode Python di sel kode di notebook, tekan Shift+Enter.

Contoh:

```python
# Coba hasilkan Python pertamamu
print('Halo, Python!')
```

Setelah mengeksekusi, Python akan mencetak `Halo, Python!`.

---

## Versi Python apa yang kita gunakan?

Ada dua versi populer: Python 2 dan Python 3. Kita akan menggunakan Python 3.

Contoh memeriksa versi:

```python
import sys
print(sys.version)
```

---

## Menulis komentar dengan Python

Gunakan `#` untuk komentar. Contoh:

```python
print('Halo, Python!') # Baris ini mencetak sebuah string (teks)
# print('Hi')
```

---

## Kesalahan dalam Python

Python akan memberi pesan kesalahan saat terjadi error. Contoh kesalahan pemanggilan fungsi yang tidak ada:

```python
frint("Hello, Python!")  # NameError: name 'frint' is not defined
```

Contoh kesalahan sintaks:

```python
print("Halo, Python!)  # SyntaxError: EOL while scanning string literal
```

Python mengeksekusi baris demi baris dan akan berhenti saat menemui error.

---

## Latihan: Program Pertama Anda

Tulis di sel kode:

```python
print("Hello world!")
```

Contoh dengan komentar:

```python
print("Hello world!") # Cetak halo dunia
```

---

# Tipe objek di Python

Python memiliki tipe objek umum: string (`str`), integer (`int`), dan float (`float`). Anda bisa memeriksa tipe dengan `type()`.

Contoh:

```python
type(12)         # int
type(2.14)       # float
type("Hello")  # str
```

Untuk `12.0`:

```python
type(12.0)  # float
```

### Integer

Contoh: -1, 0, 4.

### Float

Contoh: 1.0, 0.5, 0.56.

Anda juga dapat melihat `sys.float_info` untuk detail representasi float.

```python
import sys
sys.float_info
```

---

## Mengonversi tipe (Typecasting)

- Convert int -> float: `float(2)`
- Convert float -> int: `int(1.1)`  (perhatian kehilangan bagian desimal)
- Convert string -> int: `int('1')`
- Convert string -> float: `float('1.2')`
- Convert number -> string: `str(1)` atau `str(1.0)`

Contoh kesalahan:

```python
int('1 atau 2 orang')  # ValueError
```

---

## Tipe Boolean

Boolean: `True` atau `False`. Tipe adalah `bool`.

Konversi:

```python
int(True)   # 1
bool(1)      # True
bool(0)      # False
float(True)  # 1.0
```

---

## Latihan singkat

- Apa tipe objek dari hasil `6 / 2`? (jawab: `float`)
- Apa tipe objek dari `6 // 2`? (jawab: `int`)

---

# Ekspresi dan Variabel

Ekspresi aritmetika dasar di Python:

```python
43 + 60 + 16 + 41
50 - 60
5 * 5
25 / 5
25 / 6
25 // 6
```

Latihan: berapa jam dalam 160 menit?

```python
160 / 60
# atau
160 // 60
```

Operator mengikuti prioritas matematika dan tanda kurung dapat mengubah urutan.

Variabel:

```python
x = 43 + 60 + 16 + 41
x
y = x / 60
x = x / 60  # menimpa nilai x
```

Gunakan nama variabel yang bermakna:

```python
total_min = 43 + 42 + 57
total_hours = total_min / 60
```

Latihan:
- Tentukan nilai `x = 3 + 2 * 2` (hasil 7)
- `y = (3 + 2) * 2` (hasil 10)
- `z = x + y` (hasil 17)

---

# Koleksi Data (Collections)

Ringkasan koleksi:

- List `[]`: terurut, dapat diubah, mengizinkan duplikat.
- Set `{}`: tidak berurut, unik.
- Tuple `()`: terurut, tidak dapat diubah.
- Dictionary `{}`: pasangan key:value, dapat diubah, tidak berurut.

## List

Contoh pembuatan list:

```python
list1 = [1, 2, 3, 4, 3, 2, 1]
list2 = list(("1", "2", 1, 2))
list3 = []
print(list1)
print(list2)
print(list3)
```

Indexing dimulai dari 0; indeks terakhir `-1`.

Contoh akses dan operasi:

```python
print(list1[5])
print(sorted(list1))
A = [1,2,3]
A[0] = 3
print(A)
```

## Set

Contoh:

```python
set1 = {"three", 1, 4, 2}
set2 = set((1, "1", 1, 2))
set3 = set()
print(set1)
print(set2)
```

Set tidak bisa di-index. Method umum: `.add()`, `.discard()`, `.clear()`.

```python
set4 = {3, 5, "ten", False}
set4.add(9)
set4.discard("ten")
set4.clear()
```

## Tuple

Contoh:

```python
tuple1 = (1, 2, "three", 4)
tuple2 = tuple((1, True, 1, "false"))
tuple3 = ()
print(tuple1)
```

Tuple bersifat immutable (tidak dapat diubah).

## Dictionary

Contoh:

```python
luffy = {
    "Full Name": "Monkey D. Luffy",
    "Occupation": "Pirate",
    "Age": 19,
    "Origin": "East Blue"
}
print(luffy["Full Name"])
print(luffy["Age"]) 
```

---

# Mini TASK

Buatlah biodata diri selengkap mungkin dengan menggunakan dictionary. Kemudian tampilkan nama panggilan Anda menggunakan key yang sesuai.

Contoh solusi:

```python
biodata = {
  "nama_lengkap": "Nama Anda",
  "nama_panggilan": "Panggilan",
  "umur": 25,
  "pekerjaan": "Data Analyst",
  "kota": "Jakarta",
}
print(biodata["nama_panggilan"])  # Output: Panggilan
```

---

## Selesai

Notebook ini memperkenalkan dasar-dasar Python: tipe data, ekspresi, variabel, koleksi, dan fungsi konversi tipe. Gunakan latihan di atas untuk memperkuat pemahaman Anda.
