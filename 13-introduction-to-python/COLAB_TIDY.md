# Colab — Tips for a cleaner student notebook

Saya menyiapkan beberapa langkah kecil agar notebook Google Colab lebih rapi dan mudah digunakan oleh siswa. Simpan file ini di repo untuk referensi pengajar.

1) Tambahkan cell setup di awal (sel kode, dilengkapi komentar):

```python
# --- SETUP CELL (Run once) ---
# 1) Pastikan menyimpan salinan: File -> Save a copy in Drive
# 2) Install dependencies jika diperlukan (contoh):
!pip install --quiet pandas matplotlib seaborn
# 3) Import libraries yang paling sering dipakai
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Optional: set display options
pd.set_option('display.max_columns', 50)
```

2) Tambahkan cell markdown di bagian atas dengan instruksi singkat:
- Judul materi
- Tujuan pembelajaran
- Durasi latihan estimasi (mis. 45-60 menit)
- Petunjuk "Save a copy in Drive"

3) Gunakan penomoran/heading untuk tiap bab agar siswa mudah menavigasi (##, ###)

4) Jika ada dataset besar, simpan versi contoh/sample kecil (1000 baris) untuk latihan cepat. Beri cell yang mengunduh dataset besar hanya bila siswa membutuhkan analisis penuh.

5) Tambahkan cell "Check your environment" yang menampilkan versi Python dan package utama:

```python
import sys
print('Python', sys.version)
print('pandas', pd.__version__)
print('numpy', np.__version__)
print('seaborn', sns.__version__)
```

6) Jika Anda menginginkan, saya bisa membuat versi notebook yang sudah dirapikan (copy dari notebook asli) dan mengunggahnya ke repo sebagai `13_Introduction_to_Python_clean.ipynb`. Ketik "buat clean notebook" dan saya akan buatkan serta commit.
