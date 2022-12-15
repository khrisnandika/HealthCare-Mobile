import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthcare/core/api_service.dart/perawat_api.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/models/ApiModels/perawat.dart';
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
  

  List<PerawatApi> listPerawat = [];
  RepoPerawat perawatRepo = RepoPerawat();

  getData() async {
    listPerawat = await perawatRepo.getData();
  }

  @override
  void initState() {
    getData();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => addValue());
    super.initState();
  }

  Timer? timer;
  int counter = 0;

  void addValue() {
    setState(() {
      for (var counter = 1; counter <= 1; counter++) {
        timer?.cancel();
      }
    });
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 90,
        title: SearchBar(),
        titleSpacing: 25,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: listPerawat.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPerawat(listPerawat[index]),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        color: kHealthCareColor.withOpacity(0.1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage(
                              "assets/image/doctor2.png",
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
                                    listPerawat[index].nama,
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
                                  listPerawat[index].profesi,
                                  style: TextStyle(
                                    color: Colors.black26,
                                    height: 1.5,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  listPerawat[index].email,
                                  style: TextStyle(
                                    color: Colors.black26,
                                    height: 1.3,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // ...cardMedis.map(
              //   (data) {
              //     return GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => DetailPerawat(
              //               data,
              //             ),
              //           ),
              //         );
              //       },
              //       child: Container(
              //         margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
              //         padding: EdgeInsets.symmetric(horizontal: 24),
              //         decoration: BoxDecoration(
              //           color: data.color,
              //           borderRadius: BorderRadius.all(
              //             Radius.circular(15),
              //           ),
              //         ),
              //         child: Row(
              //           children: <Widget>[
              //             Image(
              //               image: AssetImage(
              //                 "${data.imgPath}",
              //               ),
              //               height: 90,
              //               width: 45,
              //             ),
              //             SizedBox(
              //               width: 16,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: <Widget>[
              //                   Container(
              //                     width: MediaQuery.of(context).size.width * .4,
              //                     child: Text(
              //                       "${data.nama}",
              //                       maxLines: 1,
              //                       overflow: TextOverflow.ellipsis,
              //                       style: TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 15,
              //                         height: 1.5,
              //                       ),
              //                     ),
              //                   ),
              //                   Text(
              //                     "${data.profesi}",
              //                     style: TextStyle(
              //                       color: Colors.black26,
              //                       height: 1.5,
              //                       fontSize: 13,
              //                     ),
              //                   ),
              //                   Text(
              //                     "${data.poli}",
              //                     style: TextStyle(
              //                       color: Colors.black26,
              //                       height: 1.3,
              //                       fontSize: 13,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
