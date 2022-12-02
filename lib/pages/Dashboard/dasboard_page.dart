import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/models/card_informasi.dart';
import 'package:healthcare/models/card_layanan.dart';
import 'package:healthcare/pages/Dashboard/detail_informasi.dart';
import 'package:healthcare/pages/Dashboard/detail_layanan.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  List<CardInformasi> cardInformasi = CardInformasi.list;
  List<CardLayanan> cardLayanan = CardLayanan.list;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  String fullname = '';

  Future getDocId() async {
    var result = await _firebaseFirestore
        .collection('users')
        .where('uid', isEqualTo: user?.uid)
        .get();
    setState(() {
      fullname = result.docs[0]['fullname'];
    });
  }

  @override
  void initState() {
    super.initState();
    getDocId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Hi, ",
                      style: GoogleFonts.montserrat(
                        color: kTitleTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: fullname,
                      style: GoogleFonts.montserrat(
                        color: kTitleTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Temukan Perawat\nyang Anda Inginkan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: kTitleTextColor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Informasi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kTitleTextColor,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 135,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30),
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: cardInformasi.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailInformasi(
                              cardInformasi[index],
                            ),
                          ),
                        );
                      },
                      child: _buildInformasi(index));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Layanan Kami',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kTitleTextColor,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: cardLayanan.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailLayanan(
                            cardLayanan: cardLayanan[index],
                          ),
                        ),
                      );
                    },
                    child: _buildLayanan(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayanan(int index) {
    return Container(
      height: 150,
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: kHealthCareColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Text(
              cardLayanan[index].nama,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 80, top: 8),
            child: Image.asset('assets/image/bg_shape.png'),
          ),
          Container(
            margin: EdgeInsets.only(left: 160, top: 10),
            child: Hero(
              tag: "hero${cardLayanan[index].imgPath}",
              child: Image.asset(
                cardLayanan[index].imgPath,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformasi(int index) {
    return Container(
      width: 130,
      height: 150,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 105,
              height: 125,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  cardInformasi[index].nama,
                  style: TextStyle(
                    color: kTitleTextColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: cardInformasi[index].color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                cardInformasi[index].imgPath,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
