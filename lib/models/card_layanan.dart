// import 'package:flutter/material.dart';

// class CardLayanan {
//   final String nama;
//   final String imgPath;

//   CardLayanan({
//     required this.nama,
//     required this.imgPath,
//   });

//   static List<CardLayanan> list = [
//     CardLayanan(
//       nama: "Layanan \nPerawat",
//       imgPath: "assets/image/perawat.png",
//     ),
//     CardLayanan(
//       nama: "Layanan \nBidan",
//       imgPath: "assets/image/bidan.png",
//     ),
//   ];
// }

import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';

class CardInfo {
  final String nama;
  final String deskripsi;
  final String faq;
  final Color color;
  final String imgPath;
  final String imgBg;

  CardInfo({
    required this.nama,
    required this.deskripsi,
    required this.faq,
    required this.color,
    required this.imgPath,
    required this.imgBg,
  });

  static List<CardInfo> list = [
    CardInfo(
      nama: "Kandungan",
      deskripsi: "lorem ipsum",
      faq: "lorem",
      color: kHealthCareColor,
      imgPath: "assets/icons/pregnant.png",
      imgBg: "assets/image/bg_pregnant.jpg",
    ),
    CardInfo(
      nama: "Gigi",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\Fusce porta nibh arcu, ut bibendum metus venenatis nec. Sed laoreet varius mauris ut dapibus. Proin vehicula dignissim luctus. Fusce purus mauris, luctus tempus mollis quis, aliquet vel mauris.",
      faq: "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      color: kBlueColor,
      imgPath: "assets/icons/dental_surgeon.png",
      imgBg: "assets/image/gigi.png",
    ),
    CardInfo(
      nama: "Jantung",
      deskripsi: "lorem ipsum",
      faq: "lorem",
      color: kOrangeColor,
      imgPath: "assets/icons/heart_surgeon.png",
      imgBg: "",
    ),
    CardInfo(
      nama: "Mata",
      deskripsi: "lorem ipsum",
      faq: "lorem",
      color: kYellowColor,
      imgPath: "assets/icons/eye_specialist.png",
      imgBg: "",
    ),
  ];
}
