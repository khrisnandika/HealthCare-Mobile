import 'dart:convert';

import 'package:healthcare/models/ApiModels/faq.dart';
import 'package:healthcare/models/ApiModels/jadwal.dart';
import 'package:healthcare/models/ApiModels/perawat.dart';
import 'package:http/http.dart' as http;

class RepoJadwal {
  final _baseUrl = 'https://healthcare.wstif3b-bws.id/api/getJadwal.php';

  Future getData() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
      );
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<JadwalApi> jadwal_api = it.map((e) => JadwalApi.fromJson(e)).toList();
        return jadwal_api;
      }
    } catch (e) {}
  }
}
