import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/models/card_informasi.dart';

class DetailInformasi extends StatefulWidget {
  // const DetailInformasi({super.key});
  final CardInformasi cardInformasi;

  DetailInformasi(this.cardInformasi);

  @override
  State<DetailInformasi> createState() => _DetailInformasiState();
}

class _DetailInformasiState extends State<DetailInformasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.cardInformasi.imgBg),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        height: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.21,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${widget.cardInformasi.nama}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.cardInformasi.deskripsi}",
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "FAQ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: kTitleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.cardInformasi.faq,
                        style: TextStyle(
                          height: 1.6,
                          color: kTitleTextColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   // height: MediaQuery.of(context).size.height * .7,
              //   // width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     color: kBackgroundColor,
              //     borderRadius: BorderRadius.vertical(
              //       top: Radius.circular(50),
              //     ),
              //   ),

              //   child: Container(
              //     padding: EdgeInsets.only(top: 180, left: 16, right: 16),
              //     color: Colors.white,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           width: 300,
              //           child: Text(
              //             "${widget.cardInformasi.nama}",
              //             style: TextStyle(
              //               fontSize: 32,
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 16,
              //         ),
              //         Text(
              //           "${widget.cardInformasi.deskripsi}",
              //         ),
              //         SizedBox(
              //           height: 24,
              //         ),
              //         Text(
              //           "FAQ",
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 16,
              //         ),
              //         Text(
              //           "${widget.cardInformasi.faq}",
              //           style: TextStyle(
              //             color: Colors.black38,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 24,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
