import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
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
      backgroundColor: widget.cardInformasi.color,
      appBar: AppBar(
        backgroundColor: widget.cardInformasi.color,
        elevation: 0,
        title: Text("Informasi ${widget.cardInformasi.nama}"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FlutterIcons.left_open_1,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
