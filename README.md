==========  Aplikasi Pemesanan Transportasi "SmartRide" ==========


1. Identitas Mahasiwsa

Nama    : Serli Muhammad

NPM     : 07352311175

Kelas   : 5IF3

Link video yt: `https://youtu.be/jUEZjpZ1Iyg?si=xW0JUimdaCeC3qbA`

2. Deskripsi singkat program
a. Kelas Abstrak `Transportasi`

Menjadi dasar bagi semua jenis transportasi. Menyimpan atribut umum seperti `id, nama, tarifDasar, dan kapasitas`.
Juga memiliki method abstrak `hitungTarif()` yang wajib diimplementasikan oleh kelas turunannya.

b. Kelas Turunan:

- `Taksi` → menghitung tarif berdasarkan jarak perjalanan.

- `Bus` → tarif dihitung dari jumlah penumpang, dengan tambahan biaya jika ada WiFi.

- `Pesawat` → tarif tergantung kelas penerbangan (Ekonomi atau Bisnis), dengan faktor pengali tertentu.

c. Kelas `Pemesanan`
Mewakili transaksi pemesanan transportasi oleh pelanggan. Menyimpan data seperti `ID pemesanan, nama pelanggan, jenis transportasi, jumlah penumpang, dan total tarif.`
Juga memiliki method `cetakStruk()` untuk menampilkan struk pemesanan.

d. Fungsi Global

- `buatPemesanan()` → membuat objek pemesanan baru secara otomatis.

- `tampilSemuaPemesanan()` → menampilkan semua data pemesanan dalam bentuk daftar.

`main()`
Membuat beberapa objek transportasi (taksi, bus, pesawat), menampilkan informasinya, lalu membuat dan menampilkan daftar pemesanan pelanggan seperti Serly, Anna, dan Elsa.
