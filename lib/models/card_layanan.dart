import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';

class CardLayanan {
  final String nama;
  final String desc;
  final Color color;
  final String imgPath;

  CardLayanan({
    required this.nama,
    required this.desc,
    required this.color,
    required this.imgPath,
  });

  static List<CardLayanan> list = [
    CardLayanan(
      nama: "Layanan \nPerawat",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      color: kHealthCareColor,
      imgPath: "assets/image/perawat.png",
    ),
    CardLayanan(
      nama: "Layanan \nBidan",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      color: kHealthCareColor,
      imgPath: "assets/image/bidan.png",
    ),
  ];
}
