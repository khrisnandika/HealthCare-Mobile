import 'dart:convert';

import 'package:healthcare/models/ApiModels/faq.dart';
import 'package:healthcare/models/ApiModels/perawat.dart';
import 'package:http/http.dart' as http;

class RepoPerawat {
  final _baseUrl = 'https://healthcare.wstif3b-bws.id/api/listPerawat.php';

  Future getData() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
      );
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<PerawatApi> perawat_api = it.map((e) => PerawatApi.fromJson(e)).toList();
        return perawat_api;
      }
    } catch (e) {}
  }
}
