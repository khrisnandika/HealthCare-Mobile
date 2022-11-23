import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';

class DaftarPerawat extends StatefulWidget {
  const DaftarPerawat({super.key});

  @override
  State<DaftarPerawat> createState() => _DaftarPerawatState();
}

class _DaftarPerawatState extends State<DaftarPerawat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text("Daftar Perawat"),
      ),
    );
    ;
  }
}
