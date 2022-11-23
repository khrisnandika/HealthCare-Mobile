import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
import 'package:healthcare/models/card_informasi.dart';
import 'package:healthcare/models/card_layanan.dart';
import 'package:healthcare/pages/detail_informasi.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<CardInformasi> cardInformasi = CardInformasi.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Hi, krisna',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: kTitleTextColor,
                ),
              ),
            ),
            SizedBox(
              height: 8,
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
          ],
        ),
      ),
    );
  }
  Widget _buildInformasi(int index) {
    return Container(
      width: 130,
      height: 160,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 105,
              height: 125,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
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
