import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
import 'package:healthcare/models/card_medis.dart';
import 'package:healthcare/pages/Chat/chatroom.dart';
import 'package:healthcare/widgets/app_clipper.dart';

class DetailPerawat extends StatefulWidget {
  final CardMedis cardMedis;

  DetailPerawat(this.cardMedis);

  @override
  State<DetailPerawat> createState() => _DetailPerawatState();
}

class _DetailPerawatState extends State<DetailPerawat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.cardMedis.colorbg,
      appBar: AppBar(
        backgroundColor: widget.cardMedis.colorbg,
        elevation: 0,
        title: Text("Tenaga Medis"),
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
              // margin: EdgeInsets.only(left: 200, top: 8),
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Image(
                image: AssetImage('assets/image/bg_shape.png'),
                height: 260,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: AppClipper(
                    cornerSize: 50,
                    diagonalHeight: 180,
                    roundedBottom: false,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 190, left: 20, right: 20),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            "${widget.cardMedis.nama}",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Profesi : "),
                            Text("${widget.cardMedis.profesi}")
                          ],
                        ),
                        Row(
                          children: [
                            Text("Poli : "),
                            Text("${widget.cardMedis.poli}")
                          ],
                        ),
                        Row(
                          children: [
                            Text("No. STR : "),
                            Text("${widget.cardMedis.str}")
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Tentang ${widget.cardMedis.profesi}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "${widget.cardMedis.deskripsi}",
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: _buildBottom(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image(
                width: MediaQuery.of(context).size.width * .50,
                image: AssetImage("${widget.cardMedis.imgPath}"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildBottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Konsultasi Sekarang",
                style: TextStyle(
                  color: kTitleTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Gratis",
                style: TextStyle(
                  color: kTitleTextColor,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatRoom(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 50,
              ),
              decoration: BoxDecoration(
                color: AppColors.greenColor,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Text(
                "Chat",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
