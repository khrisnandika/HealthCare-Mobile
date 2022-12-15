import 'dart:convert';

import 'package:healthcare/models/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'http://10.0.2.2/healthcare-admin/api/getFaq.php';

  Future getData() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
      );
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Album> album = it.map((e) => Album.fromJson(e)).toList();
        return album;
      }
    } catch (e) {}
  }
}