
program KasirToko_AmbiguSport;
{ ======================================================================
  PROGRAM KASIR "AMBIGU STORE"
  UTS Dasar Pemrograman DP5 dan DP6 - Kelompok Ambigu
  Anggota : Gibran Zafif            (261401092) (DP6)
            Teuku Pasha Al Danish   (261401078) (DP6)
            Karlos Kristian Siregar (261401060) (DP5)
  Kom     : C
  ----------------------------------------------------------------------
  Fitur: lihat katalog, belanja (keranjang), lihat keranjang,
         checkout + diskon + pembayaran + struk, keluar.
  ====================================================================== }

{ ---------- [1] KONSEP DASAR: DEKLARASI VARIABEL & TIPE DATA ----------
  const  : nilai tetap yang tidak berubah selama program berjalan.
  array  : kumpulan data bertipe sama yang diakses lewat nomor indeks.
  string : teks (nama produk, nama pelanggan).
  integer/longint : bilangan bulat (longint dipakai untuk uang agar
                    muat angka jutaan).
  boolean: bernilai true/false (dipakai sebagai penanda/flag).        }
uses crt;
const
  JML = 8;                                   { jumlah produk di toko }

var
  nama      : array[1..JML] of string;       { nama produk }
  harga     : array[1..JML] of longint;      { harga satuan (Rupiah) }
  stok      : array[1..JML] of integer;      { stok barang di toko }
  keranjang : array[1..JML] of integer;      { jumlah beli tiap produk }
  pilih     : integer;                       { pilihan menu utama }
  i         : integer;                       { pencacah pada program utama }

{ Mengisi data awal produk }
procedure IsiProduk;
begin
clrscr;
  nama[1] := 'Sepatu Lari Pro';     harga[1] := 450000; stok[1] := 10;
  nama[2] := 'Bola Sepak Size 5';   harga[2] := 180000; stok[2] := 15;
  nama[3] := 'Raket Badminton';     harga[3] := 320000; stok[3] := 12;
  nama[4] := 'Shuttlecock (Slop)';  harga[4] :=  95000; stok[4] := 30;
  nama[5] := 'Jersey Tim';          harga[5] := 150000; stok[5] := 20;
  nama[6] := 'Botol Minum 1L';      harga[6] :=  45000; stok[6] := 40;
  nama[7] := 'Sarung Tangan Gym';   harga[7] :=  85000; stok[7] := 25;
  nama[8] := 'Matras Yoga';         harga[8] := 200000; stok[8] :=  8;
end;

{ ---------- [3] PERULANGAN #1: for-to-do ----------
  for dipakai bila jumlah pengulangan SUDAH DIKETAHUI (di sini n kali). }
procedure Garis(n: integer; c: char);
var
  i: integer;
begin
  for i := 1 to n do
    write(c);
  writeln;
end;

{ Menulis teks rata kiri dengan lebar tetap (supaya kolom tabel rapi).
  Pascal standar hanya bisa rata kanan (write(x:10)), jadi kita
  tambahkan spasi sisa secara manual memakai for. }
procedure TulisKiri(s: string; lebar: integer);
var
  k: integer;
begin
  write(s);
  for k := length(s) + 1 to lebar do
    write(' ');
end;

{ Menampilkan katalog produk }
procedure TampilKatalog;
var
  i: integer;
begin
  writeln;
  Garis(52, '=');
  writeln('              KATALOG AMBIGU SPORT STORE');
  Garis(52, '=');
  writeln('No  Nama Produk              Harga (Rp)   Stok');
  Garis(52, '-');
  for i := 1 to JML do
  begin
    write(i:2, '  ');
    TulisKiri(nama[i], 22);
    { [1] PEMFORMATAN: harga[i]:10 = angka rata kanan selebar 10 kolom }
    write(harga[i]:10);
    writeln(stok[i]:7);
  end;
  Garis(52, '-');
end;

{ Menghitung total harga seluruh isi keranjang (function = mengembalikan nilai) }
function SubtotalKeranjang: longint;
var
  i: integer;
  t: longint;
begin
  t := 0;
  for i := 1 to JML do
    t := t + harga[i] * keranjang[i];
  SubtotalKeranjang := t;
end;

{ Menampilkan isi keranjang }
procedure TampilKeranjang;
var
  i: integer;
  kosong: boolean;
begin
  kosong := true;
  writeln;
  Garis(52, '=');
  writeln('                 KERANJANG BELANJA');
  Garis(52, '=');
  for i := 1 to JML do
  begin
    { [2] PENGKONDISIAN: if-then, hanya tampilkan produk yang dibeli }
    if keranjang[i] > 0 then
    begin
      kosong := false;
      TulisKiri(nama[i], 22);
      write(keranjang[i]:3, ' x ', harga[i]:7);
      writeln(' = ', keranjang[i] * harga[i]:8);
    end;
  end;
  if kosong then
    writeln('Keranjang masih kosong.')
  else
  begin
    Garis(52, '-');
    writeln('SUBTOTAL : Rp ', SubtotalKeranjang:0);
  end;
end;

{ ---------- FITUR BELANJA ----------
  [3] PERULANGAN #2: while-do  -> dipakai bila jumlah pengulangan
      TIDAK diketahui, berhenti ketika kasir memasukkan kode 0.
  [4] KONTROL LOOP:
      continue = lompati sisa isi loop, kembali ke awal putaran
                 (dipakai saat input salah, supaya diminta ulang).
      break    = keluar total dari loop (dipakai saat kode 0).      }
procedure Belanja;
var
  kode, qty: integer;
begin
  TampilKatalog;
  while true do
  begin
    write('Kode produk (0 = selesai) : ');
    readln(kode);

    if kode = 0 then
      break;                                   { keluar dari loop }

    if (kode < 1) or (kode > JML) then         { operator logika: or }
    begin
      writeln('>> Kode tidak valid, coba lagi!');
      continue;                                { ulang dari awal loop }
    end;

    write('Jumlah beli              : ');
    readln(qty);

    if qty <= 0 then
    begin
      writeln('>> Jumlah harus lebih dari 0!');
      continue;
    end;

    { sisa stok = stok toko dikurangi yang sudah ada di keranjang }
    if qty > stok[kode] - keranjang[kode] then
    begin
      writeln('>> Stok tidak cukup! Sisa: ', stok[kode] - keranjang[kode]);
      continue;
    end;

    keranjang[kode] := keranjang[kode] + qty;
    writeln('>> ', qty, ' x ', nama[kode], ' masuk keranjang.');
  end;
end;

{ ---------- FITUR CHECKOUT ---------- }
procedure Checkout;
var
  sub, potongan, total, bayar, kembali : longint;
  member, persenMember, persenBonus, persenTotal : integer;
  pelanggan : string;
  lunas : boolean;
  i : integer;
begin
  sub := SubtotalKeranjang;

  if sub = 0 then
  begin
    writeln('>> Keranjang kosong, belanja dulu ya!');
    exit;                                      { keluar dari procedure }
  end;

  TampilKeranjang;
  writeln;
  write('Nama pelanggan : ');
  readln(pelanggan);
  writeln('Jenis member  : 1=Reguler  2=Silver  3=Gold');
  write('Pilih member   : ');
  readln(member);

  { [2] PENGKONDISIAN: case-of, cocok untuk pilihan berdasarkan nilai }
  case member of
    1: persenMember := 0;
    2: persenMember := 5;
    3: persenMember := 10;
  else
    begin
      writeln('>> Pilihan tidak dikenal, dianggap Reguler.');
      persenMember := 0;
    end;
  end;

  { [2] PENGKONDISIAN: nested-if (if di dalam if) untuk bonus belanja.
    Aturan "else" selalu berpasangan dengan "if" terdekat di atasnya. }
  if sub >= 500000 then
    if sub >= 1000000 then
      persenBonus := 10           { belanja >= 1 juta }
    else
      persenBonus := 5            { belanja 500 ribu - 999 ribu }
  else
    persenBonus := 0;             { belanja < 500 ribu }

  persenTotal := persenMember + persenBonus;
  potongan    := sub * persenTotal div 100;    { div = pembagian bulat }
  total       := sub - potongan;

  writeln;
  writeln('Subtotal       : Rp ', sub:0);
  writeln('Diskon member  : ', persenMember, '%');
  writeln('Bonus belanja  : ', persenBonus, '%');
  writeln('Potongan       : Rp ', potongan:0);
  writeln('TOTAL BAYAR    : Rp ', total:0);
  writeln;

  { ---------- [3] PERULANGAN #3: repeat-until ----------
    repeat-until pasti berjalan MINIMAL SATU KALI (kondisi dicek di
    akhir), cocok untuk meminta input pembayaran sampai cukup.
    continue di repeat akan loncat ke pengecekan "until".            }
  lunas := false;
  repeat
    write('Uang bayar (0 = batal) : Rp ');
    readln(bayar);

    if bayar = 0 then
      break;                                   { batal membayar }

    if bayar < total then
    begin
      writeln('>> Uang kurang Rp ', total - bayar:0, '. Masukkan lagi!');
      continue;
    end;

    lunas := true;
  until lunas;

  if not lunas then
  begin
    writeln('>> Transaksi dibatalkan. Keranjang tetap tersimpan.');
    exit;
  end;

  kembali := bayar - total;

  { Cetak struk }
  writeln;
  Garis(52, '*');
  writeln('            AMBIGU SPORT STORE - STRUK');
  Garis(52, '*');
  writeln('Pelanggan : ', pelanggan);
  Garis(52, '-');
  for i := 1 to JML do
    if keranjang[i] > 0 then
    begin
      TulisKiri(nama[i], 22);
      write(keranjang[i]:3, ' x ', harga[i]:7);
      writeln(' = ', keranjang[i] * harga[i]:8);
      { stok toko berkurang & keranjang dikosongkan untuk pelanggan baru }
      stok[i] := stok[i] - keranjang[i];
      keranjang[i] := 0;
    end;
  Garis(52, '-');
  writeln('Subtotal  : Rp ', sub:0);
  writeln('Diskon    : Rp ', potongan:0, ' (', persenTotal, '%)');
  writeln('Total     : Rp ', total:0);
  writeln('Bayar     : Rp ', bayar:0);
  writeln('Kembali   : Rp ', kembali:0);
  Garis(52, '*');
  writeln('   Terima kasih, tetap semangat berolahraga!');
  Garis(52, '*');
end;

{ ====================== PROGRAM UTAMA ======================
  [5] MENU INTERAKTIF: repeat-until mengulang tampilan menu terus-
  menerus sampai pengguna memilih 5 (Keluar). Setiap pilihan
  diarahkan ke fitur (procedure) yang jelas memakai case-of.      }
begin
  IsiProduk;
  for i := 1 to JML do
    keranjang[i] := 0;                         { keranjang awal kosong }

  repeat
    writeln;
    Garis(52, '=');
    writeln('        AMBIGU SPORT STORE - SISTEM KASIR');
    Garis(52, '=');
    writeln(' 1. Lihat Katalog Produk');
    writeln(' 2. Belanja (Tambah ke Keranjang)');
    writeln(' 3. Lihat Keranjang');
    writeln(' 4. Checkout & Bayar');
    writeln(' 5. Keluar');
    Garis(52, '-');
    write('Pilih menu (1-5) : ');
    readln(pilih);

    case pilih of
      1: TampilKatalog;
      2: Belanja;
      3: TampilKeranjang;
      4: Checkout;
      5: writeln('Sampai jumpa di Ambigu Sport Store!');
    else
      writeln('>> Menu tidak tersedia, pilih 1-5.');
    end;
  until pilih = 5;
end.
