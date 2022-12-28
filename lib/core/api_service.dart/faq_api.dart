import 'dart:convert';

import 'package:healthcare/models/ApiModels/faq.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://healthcare.wstif3b-bws.id/api/getFaq.php';

  Future getData() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
      );
      if (response.statusCode == 200) {
        // print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Faq> album = it.map((e) => Faq.fromJson(e)).toList();
        return album;
      }
    } catch (e) {}
  }
}
