import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/pages/NavigatorBar/navbar.dart';
import 'package:lottie/lottie.dart';

import 'card_kesehatan.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardKesehatanData(
      title: "Layanan Kami",
      subtitle:
         "Kami memberikan pelayanan yang dapat membantu anda untuk mengatasi keluhan penyakit yang sedang diderita.",
      image: const AssetImage("assets/image/health1.png"),
      backgroundColor: kWhiteColor,
      titleColor: kHealthCareColor,
      subtitleColor: kTitleTextColor,
      background: LottieBuilder.asset("assets/animation/bg-4.json"),
    ),
    CardKesehatanData(
      title: "Dirumah Saja",
      subtitle: "Sekarang anda dapat menyampaikan keluhan yang sedang anda alami kepada perawat atau bidan tanpa keluar rumah.",
      image: const AssetImage("assets/image/health4.png"),
      backgroundColor: kOnboardingColor,
      titleColor: kTitleTextColor,
      subtitleColor: kTitleTextColor,
      background: LottieBuilder.asset("assets/animation/bg-2.json"),
    ),
    CardKesehatanData(
      title: "Lebih Mudah",
      subtitle: "Terdapat fitur chat yang dapat memudahkan anda dalam melakukan konsultasi secara online kepada perawat atau bidan.",
      image: const AssetImage("assets/image/health2.png"),
      backgroundColor: kHealthCareColor,
      titleColor: kWhiteColor,
      subtitleColor: kWhiteColor,
      background: LottieBuilder.asset("assets/animation/bg-5.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return CardKesehatan(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NavigasiBar()),
          );
        },
      ),
    );
  }
}
