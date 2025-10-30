
// Kelas Abstrak Transportasi
abstract class Transportasi {
  String id;
  String nama;
  double _tarifDasar; // bersifat private
  int kapasitas;

  // Konstruktor
  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  // Getter untuk tarif dasar
  double get tarifDasar => _tarifDasar;

  // Method abstrak untuk menghitung tarif
  double hitungTarif(int jumlahPenumpang);

  // Method menampilkan info
  void tampilInfo() {
    print('--- Info Transportasi ---');
    print('ID: $id');
    print('Nama: $nama');
    print('Kapasitas: $kapasitas orang');
    print('Tarif Dasar: Rp${_tarifDasar.toStringAsFixed(0)}');
  }
}


// Kelas Turunan TAKSI
class Taksi extends Transportasi {
  double jarak; // dalam kilometer

  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
      : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Jenis: Taksi');
    print('Jarak: ${jarak} km');
    print('---------------------------\n');
  }
}

// Kelas Turunan BUS
class Bus extends Transportasi {
  bool adaWifi;

  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
      : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Jenis: Bus');
    print('Ada Wifi: ${adaWifi ? "Ya" : "Tidak"}');
    print('---------------------------\n');
  }
}


// Kelas Turunan PESAWAT
class Pesawat extends Transportasi {
  String kelasPenerbangan; // "Ekonomi" atau "Bisnis"

  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelasPenerbangan)
      : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    double faktor = (kelasPenerbangan == "Bisnis") ? 1.5 : 1.0;
    return tarifDasar * jumlahPenumpang * faktor;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Jenis: Pesawat');
    print('Kelas: $kelasPenerbangan');
    print('---------------------------\n');
  }
}


// Kelas PEMESANAN
class Pemesanan {
  String idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(
      this.idPemesanan, this.namaPelanggan, this.transportasi, this.jumlahPenumpang, this.totalTarif);

  // Menampilkan struk pemesanan
  void cetakStruk() {
    print('==============================');
    print('        STRUK PEMESANAN       ');
    print('==============================');
    print('ID Pemesanan : $idPemesanan');
    print('Nama Pelanggan : $namaPelanggan');
    print('Transportasi : ${transportasi.nama}');
    print('Jumlah Penumpang : $jumlahPenumpang');
    print('Total Tarif : Rp${totalTarif.toStringAsFixed(0)}');
    print('==============================\n');
  }

  // Konversi ke Map (simulasi database)
  Map<String, dynamic> toMap() {
    return {
      'idPemesanan': idPemesanan,
      'namaPelanggan': namaPelanggan,
      'transportasi': transportasi.nama,
      'jumlahPenumpang': jumlahPenumpang,
      'totalTarif': totalTarif,
    };
  }
}

// Fungsi Global: buatPemesanan()
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  double total = t.hitungTarif(jumlahPenumpang);
  String id = 'PM${DateTime.now().millisecondsSinceEpoch}'; // kode unik
  return Pemesanan(id, nama, t, jumlahPenumpang, total);
}


// Fungsi Global: tampilSemuaPemesanan()
void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  print('\n========= DAFTAR SEMUA PEMESANAN =========');
  for (var p in daftar) {
    p.cetakStruk();
  }
}


// Fungsi main()
void main() {
  // Membuat beberapa objek transportasi
  var taksi = Taksi('TX01', 'Blue Bird', 8000, 4, 12.5);
  var bus = Bus('BS01', 'TransJakarta', 3500, 40, true);
  var pesawat = Pesawat('PS01', 'Garuda Indonesia', 750000, 180, 'Bisnis');

  // Menampilkan info transportasi
  taksi.tampilInfo();
  bus.tampilInfo();
  pesawat.tampilInfo();

  // Membuat daftar pemesanan
  List<Pemesanan> daftarPemesanan = [];

  // Membuat beberapa pemesanan
  var p1 = buatPemesanan(taksi, 'Serly', 2);
  var p2 = buatPemesanan(bus, 'Anna', 5);
  var p3 = buatPemesanan(pesawat, 'Elsa', 3);

  // Menyimpan ke dalam list
  daftarPemesanan.addAll([p1, p2, p3]);

  // Menampilkan semua hasil transaksi
  tampilSemuaPemesanan(daftarPemesanan);
}
