class Album {
  final int id;
  final String pertanyaan;
  final String jawaban;

  const Album({
    required this.id,
    required this.pertanyaan,
    required this.jawaban,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      pertanyaan: json['pertanyaan'],
      jawaban: json['jawaban'],
    );
  }
}
