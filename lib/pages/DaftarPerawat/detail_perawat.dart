import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
import 'package:healthcare/models/ApiModels/perawat.dart';
import 'package:healthcare/models/card_medis.dart';
import 'package:healthcare/pages/Chat/Verdul.dart';
import 'package:healthcare/widgets/app_clipper.dart';

class DetailPerawat extends StatefulWidget {
  final PerawatApi perawatApi;

  DetailPerawat(this.perawatApi);

  @override
  State<DetailPerawat> createState() => _DetailPerawatState();
}

class _DetailPerawatState extends State<DetailPerawat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHealthCareColor,
      appBar: AppBar(
        backgroundColor: kHealthCareColor,
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
                    padding: EdgeInsets.only(top: 200, left: 20, right: 20),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.perawatApi.nama,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Email : "),
                            Text(widget.perawatApi.email)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Profesi : "),
                            Text(widget.perawatApi.profesi)
                          ],
                        ),
                        Row(
                          children: [
                            Text("Poli : "),
                            Text(widget.perawatApi.nama_poli)
                          ],
                        ),
                        Row(
                          children: [
                            Text("No. STR : "),
                            Text(widget.perawatApi.no_str)
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Tentang Saya",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "ini tentang saya",
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
                image: const AssetImage("assets/image/doctor2.png"),
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
                  builder: (context) => Verdul(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 50,
              ),
              decoration: BoxDecoration(
                color: kHealthCareColor,
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
