import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
import 'package:healthcare/models/card_layanan.dart';
import 'package:healthcare/widgets/app_clipper.dart';

class DetailLayanan extends StatefulWidget {
  const DetailLayanan({super.key, required this.cardLayanan});

  final CardLayanan cardLayanan;

  @override
  State<DetailLayanan> createState() => _DetailLayananState();
}

class _DetailLayananState extends State<DetailLayanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.cardLayanan.color,
      appBar: AppBar(
        backgroundColor: widget.cardLayanan.color,
        elevation: 0,
        title: Text("Layanan Kami"),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Image(
                image: AssetImage('assets/image/bg_shape.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1, left: 200),
              child: Hero(
                tag: "hero${widget.cardLayanan.imgPath}",
                child: Image(
                  width: MediaQuery.of(context).size.width * .45,
                  image: AssetImage("${widget.cardLayanan.imgPath}"),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Expanded(
                    child: ClipPath(
                      clipper: AppClipper(
                        cornerSize: 50,
                        diagonalHeight: 180,
                        roundedBottom: false,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                            padding:
                                EdgeInsets.only(top: 100, left: 20, right: 20),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    "${widget.cardLayanan.nama}",
                                    style: TextStyle(
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  "Deskripsi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "${widget.cardLayanan.desc}",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * .8,
            //     width: MediaQuery.of(context).size.width,
            //     child: ClipPath(
            //       clipper: AppClipper(
            //         cornerSize: 50,
            //         diagonalHeight: 180,
            //         roundedBottom: false,
            //       ),
            //       child: SingleChildScrollView(
            //         child: Container(
            //           padding: EdgeInsets.only(top: 110, left: 20, right: 20),
            //           color: Colors.white,
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Container(
            //                 width: 200,
            //                 child: Text(
            //                   "${widget.cardLayanan.nama}",
            //                   style: TextStyle(
            //                     fontSize: 32,
            //                   ),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 24,
            //               ),
            //               Text(
            //                 "Deskripsi",
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 15,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 16,
            //               ),
            //               Text(
            //                 "${widget.cardLayanan.desc}",
            //                 style: TextStyle(
            //                   color: Colors.black54,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 24,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
