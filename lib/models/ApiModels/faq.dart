class Faq {
  final int id;
  final String pertanyaan;
  final String jawaban;

  const Faq({
    required this.id,
    required this.pertanyaan,
    required this.jawaban,
  });

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      id: json['id'],
      pertanyaan: json['pertanyaan'],
      jawaban: json['jawaban'],
    );
  }
}
