class PerawatApi {
  final int id;
  final String nama;
  final String email;
  final String no_str;
  final String nama_poli;
  final String profesi;
  final String about;

  const PerawatApi({
    required this.id,
    required this.nama,
    required this.email,
    required this.no_str,
    required this.nama_poli,
    required this.profesi,
    required this.about,
  });

  factory PerawatApi.fromJson(Map<String, dynamic> json) {
    return PerawatApi(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      no_str: json['no_str'],
      nama_poli: json['nama_poli'],
      profesi: json['profesi'],
      about: json['about'],
    );
  }
}
