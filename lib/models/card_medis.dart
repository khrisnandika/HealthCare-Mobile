import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';

class CardMedis {
  final String nama;
  final String email;
  final String deskripsi;
  final String profesi;
  final String str;
  final String poli;
  final Color color;
  final Color colorbg;
  final String imgPath;
  final String imgBg;

  CardMedis({
    required this.nama,
    required this.email,
    required this.deskripsi,
    required this.profesi,
    required this.str,
    required this.poli,
    required this.color,
    required this.colorbg,
    required this.imgPath,
    required this.imgBg,
  });

  static List<CardMedis> list = [
    CardMedis(
      nama: "Krisna Choiril Andika",
      email: "krisna@gmail.com",
      deskripsi: "lorem ipsum",
      profesi: "Perawat",
      str: "1021012021910219",
      poli: "Poli Mata",
      color: kHealthCareColor.withOpacity(0.1),
      colorbg: kHealthCareColor,
      imgPath: "assets/image/doctor2.png",
      imgBg: "",
    ),
    CardMedis(
      nama: "Indra Prasetyo Wijaya",
      email: "indra@gmail.com",
      deskripsi: "lorem ipsum",
      profesi: "Perawat",
      str: "1021012021910219",
      poli: "Poli Jantung",
      color: kOrangeColor.withOpacity(0.1),
      colorbg: kOrangeColor,
      imgPath: "assets/image/doctor2.png",
      imgBg: "",
    ),
    CardMedis(
      nama: "Iqbal Maulana",
      email: "iqbal@gmail.com",
      deskripsi: "lorem ipsum",
      profesi: "Perawat",
      str: "1021012021910219",
      poli: "Poli Gigi",
      color: kBlueColor.withOpacity(0.1),
      colorbg: kBlueColor,
      imgPath: "assets/image/doctor2.png",
      imgBg: "",
    ),
    CardMedis(
      nama: "Fara Derliana",
      email: "fara@gmail.com",
      deskripsi: "lorem ipsum",
      profesi: "Bidan",
      str: "1021012021910219",
      poli: "Poli Kandungan",
      color: kHealthCareColor.withOpacity(0.1),
      colorbg: kHealthCareColor,
      imgPath: "assets/image/doctor1.png",
      imgBg: "",
    ),
    CardMedis(
      nama: "Elisa Febrian Sholeha",
      email: "elisa@gmail.com",
      deskripsi: "lorem ipsum",
      profesi: "Bidan",
      str: "1021012021910219",
      poli: "Poli Kandungan",
      color: kOrangeColor.withOpacity(0.1),
      colorbg: kOrangeColor,
      imgPath: "assets/image/doctor3.png",
      imgBg: "",
    ),
    CardMedis(
      nama: "Siapa ya",
      email: "elisa@gmail.com",
      deskripsi: "lorem ipsum",
      profesi: "Bidan",
      str: "1021012021910219",
      poli: "Poli Kandungan",
      color: kOrangeColor.withOpacity(0.1),
      colorbg: kOrangeColor,
      imgPath: "assets/image/doctor3.png",
      imgBg: "",
    ),
  ];
}

