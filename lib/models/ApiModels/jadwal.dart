class JadwalApi {
  final int id;
  final String nama;
  final String no_str;
  final String jadwal_mulai;
  final String jadwal_selesai;
  final String profesi;

  const JadwalApi({
    required this.id,
    required this.nama,
    required this.no_str,
    required this.jadwal_mulai,
    required this.jadwal_selesai,
    required this.profesi,
  });

  factory JadwalApi.fromJson(Map<String, dynamic> json) {
    return JadwalApi(
      id: json['id'],
      nama: json['nama'],
      no_str: json['no_str'],
      jadwal_mulai: json['jadwal_mulai'],
      jadwal_selesai: json['jadwal_selesai'],
      profesi: json['profesi'],
    );
  }
}
