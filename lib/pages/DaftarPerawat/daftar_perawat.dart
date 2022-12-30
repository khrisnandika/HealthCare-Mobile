import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:healthcare/core/api_service.dart/perawat_api.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/models/ApiModels/perawat.dart';
import 'package:healthcare/models/card_medis.dart';
import 'package:healthcare/pages/DaftarPerawat/detail_perawat.dart';
import 'package:healthcare/widgets/Skelton.dart';
import 'package:healthcare/widgets/search_bar.dart';

class DaftarPerawat extends StatefulWidget {
  const DaftarPerawat({super.key});

  @override
  State<DaftarPerawat> createState() => _DaftarPerawatState();
}

class _DaftarPerawatState extends State<DaftarPerawat> {
  TextEditingController searchController = TextEditingController();
  late bool _isLoading;
  List<CardMedis> cardMedis = CardMedis.list;

  List<PerawatApi> listPerawat = [];
  List<PerawatApi> cariPerawat = [];
  RepoPerawat perawatRepo = RepoPerawat();

  onSearch(String text) async {
    cariPerawat.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    listPerawat.forEach((element) {
      if (element.nama.contains(text) ||
          element.profesi.contains(text) ||
          element.nama_poli.contains(text)) cariPerawat.add(element);
    });
    setState(() {});
  }

  getData() async {
    listPerawat = await perawatRepo.getData();
  }

  @override
  void initState() {
    getData();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => addValue());
    _isLoading = true;
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          _isLoading = false;
        });
      },
    );
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
        title: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: kSearchBackgroundColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: searchController,
                onChanged: onSearch,
                decoration: InputDecoration.collapsed(
                  hintText: 'Cari Perawat atau bidan',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {
                  searchController.clear();
                  onSearch('');
                  print(cariPerawat);
                },
                color: kHealthCareColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            ),
          ],
        ),
        titleSpacing: 25,
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _isLoading
                ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: 8,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CardSkelton(),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      );
                    },
                  )
                : cariPerawat.length != 0 || searchController.text.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: cariPerawat.length,
                        itemBuilder: (context, index) {
                          cariPerawat;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPerawat(cariPerawat[index]),
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 30, right: 30, bottom: 15),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                          child: Text(
                                            cariPerawat[index].nama,
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
                                          cariPerawat[index].profesi,
                                          style: TextStyle(
                                            color: Colors.black26,
                                            height: 1.5,
                                            fontSize: 13,
                                          ),
                                        ),
                                        Text(
                                          cariPerawat[index].nama_poli,
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
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: listPerawat.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPerawat(listPerawat[index]),
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 30, right: 30, bottom: 15),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
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
                                          listPerawat[index].nama_poli,
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
    );
  }
}

class CardSkelton extends StatelessWidget {
  const CardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Skelton(
            width: 60,
            height: 60,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skelton(width: 80, height: 10),
                SizedBox(height: 8),
                Skelton(width: 120, height: 10),
                SizedBox(height: 8),
                Skelton(width: 150, height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
