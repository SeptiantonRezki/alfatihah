part of './index.dart';

class Doa {
  String? idDoa;
  String? nama;
  String? lafal;
  String? transliterasi;
  String? arti;
  String? riwayat;
  String? keterangan;

  Doa({this.idDoa, this.nama, this.lafal, this.transliterasi, this.arti, this.riwayat, this.keterangan});

  Doa.fromJson(Map<String, dynamic> json) {
    idDoa = json['id_doa'];
    nama = json['nama'];
    lafal = json['lafal'];
    transliterasi = json['transliterasi'];
    arti = json['arti'];
    riwayat = json['riwayat'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_doa'] = this.idDoa;
    data['nama'] = this.nama;
    data['lafal'] = this.lafal;
    data['transliterasi'] = this.transliterasi;
    data['arti'] = this.arti;
    data['riwayat'] = this.riwayat;
    data['keterangan'] = this.keterangan;
    return data;
  }
}
