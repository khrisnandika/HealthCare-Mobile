class Profil {
  int id;
  String nama;
  String email;
  String jk;
  String alamat;
  

  Profil(
      {required this.id, required this.nama, required this.email, required this.jk, required this.alamat,});

  factory Profil.fromMap(Map<String, dynamic> map) {
    return Profil(
      id: map['id'],
      nama: map['nama'],
      email: map['email'],
      jk: map['jk'],
      alamat: map['alamat'],
      
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this.id;
    map['nama'] = nama;
    map['email'] = email;
    map['jk'] = jk;
    map['alamat'] = alamat;
    return map;
  }
}