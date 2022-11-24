import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/models/card_medis.dart';
import 'package:healthcare/pages/DaftarPerawat/detail_perawat.dart';
import 'package:healthcare/widgets/search_bar.dart';

class DaftarPerawat extends StatefulWidget {
  const DaftarPerawat({super.key});

  @override
  State<DaftarPerawat> createState() => _DaftarPerawatState();
}

class _DaftarPerawatState extends State<DaftarPerawat> {
  List<CardMedis> cardMedis = CardMedis.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 24,
                ),
                child: SearchBar(),
              ),
              ...cardMedis.map(
                (data) {
                  return GestureDetector(
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPerawat(
                        data,
                      ),
                    ),
                  );
                },
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color: data.color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage(
                              "${data.imgPath}",
                            ),
                            height: 90,
                            width: 45,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text(
                                    "${data.nama}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${data.profesi}",
                                  style: TextStyle(
                                    color: Colors.black26,
                                    height: 1.5,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "${data.poli}",
                                  style: TextStyle(
                                    color: Colors.black26,
                                    height: 1.3,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 12),
                          //   child: Text(
                          //     "\$${data.price.toInt()}",
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 18,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
