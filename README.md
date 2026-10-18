AMBIGU SPORT STORE

Program Kasir Sederhana Menggunakan Pascal

1. Deskripsi Program

Ambigu Sport Store adalah program kasir sederhana yang dibuat menggunakan bahasa pemrograman Pascal untuk memenuhi tugas UTS mata kuliah Dasar Pemrograman.

Program ini digunakan untuk membantu proses penjualan perlengkapan olahraga, mulai dari memilih barang, memasukkan barang ke keranjang, menghitung diskon, melakukan pembayaran, hingga menampilkan struk belanja.

2. Anggota Kelompok
	1.	Gibran Zafif (261401092) — DP6
	2.	Teuku Pasha Al Danish (261401078) — DP6
	3.	Karlos Kristian Siregar (261401060) — DP5

Kom: C

3. Fitur Program

Program Ambigu Sport Store memiliki beberapa fitur utama:
	1.	Lihat Katalog: Menampilkan nama produk, harga, dan stok barang yang tersedia.
	2.	Belanja: Memilih barang dan menentukan jumlah barang yang ingin dibeli.
	3.	Lihat Keranjang: Menampilkan barang yang sudah dipilih beserta total harganya.
	4.	Checkout dan Diskon: Menghitung total belanja dan diskon berdasarkan jenis member serta jumlah belanja.
	5.	Pembayaran: Memasukkan uang pembayaran dan menghitung uang kembalian.
	6.	Cetak Struk: Menampilkan ringkasan transaksi setelah pembayaran berhasil.
	7.	Pengelolaan Stok: Mengurangi stok barang setelah transaksi berhasil.
	8.	Menu Keluar: Mengakhiri program ketika pengguna memilih menu keluar.

4. Konsep Pemrograman yang Digunakan

Program ini menggunakan beberapa konsep dasar pemrograman Pascal.

Konsep	Penjelasan
Variabel dan Tipe Data	Menyimpan informasi seperti nama barang, harga, stok, dan jumlah pembelian.
Array	Menyimpan data beberapa produk dalam satu kelompok variabel.
Input dan Output	Menerima masukan pengguna dan menampilkan hasil menggunakan readln, write, dan writeln.
If-Then-Else	Memeriksa kondisi, seperti jumlah pembelian dan kecukupan uang pembayaran.
Case-Of	Menentukan fitur yang dijalankan berdasarkan pilihan menu pengguna.
Nested If	Menentukan bonus diskon berdasarkan jumlah belanja.
For-Do	Mengulang proses dengan jumlah pengulangan yang sudah ditentukan, misalnya menampilkan katalog.
While-Do	Mengulang proses belanja sampai pengguna selesai.
Repeat-Until	Mengulang tampilan menu sampai pengguna memilih keluar.
Break dan Continue	Menghentikan perulangan atau melanjutkan ke putaran berikutnya sesuai kondisi.
Procedure	Memisahkan program menjadi beberapa bagian, seperti menampilkan katalog dan memproses pembayaran.
Function	Menghitung subtotal seluruh barang yang ada di keranjang.

5. Aturan Diskon

Program memberikan diskon berdasarkan jenis member dan jumlah belanja.

Jenis Member	Diskon
Reguler	0%
Silver	5%
Gold	10%

Selain diskon member, terdapat bonus diskon berdasarkan jumlah belanja:
	•	Belanja kurang dari Rp500.000: tidak mendapat bonus diskon.
	•	Belanja Rp500.000 sampai Rp999.999: mendapat bonus diskon 5%.
	•	Belanja minimal Rp1.000.000: mendapat bonus diskon 10%.

Catatan: Diskon member dan bonus belanja dijumlahkan oleh program.

6. File dalam Repositori GitHub

Repositori GitHub kelompok berisi tiga file utama:
	•	README.md: Penjelasan tentang program, anggota kelompok, dan fitur yang tersedia.
	•	KasirToko_AmbiguSport.pas: Kode program kasir yang dibuat menggunakan Pascal.
	•	dokumentasi.pdf: Berisi screenshot program saat dijalankan, seperti tampilan katalog, keranjang, dan struk pembayaran.

7. Kesimpulan

Ambigu Sport Store merupakan program kasir sederhana yang membantu proses penjualan perlengkapan olahraga.

Melalui program ini, kami menerapkan konsep dasar pemrograman Pascal, seperti variabel, array, percabangan, perulangan, procedure, dan function.

Program ini juga membantu pengguna melakukan transaksi dengan lebih mudah, mulai dari memilih barang hingga menyelesaikan pembayaran.
