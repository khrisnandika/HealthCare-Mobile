import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthcare/core/api_service.dart/jadwal_api.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/models/ApiModels/jadwal.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  List<JadwalApi> listJadwal = [];
  RepoJadwal jadwalRepo = RepoJadwal();

  getData() async {
    listJadwal = await jadwalRepo.getData();
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Jadwal",
          style: TextStyle(
            color: kTitleTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: listJadwal.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: kBlueColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: kBlueColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: kTitleTextColor.withOpacity(0.6),
                              ),
                            ],
                          ),
                        ),
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${listJadwal[index].profesi} : ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: kTitleTextColor,
                                  ),
                                ),
                                Text(
                                  listJadwal[index].nama,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: kTitleTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Buka  : "),
                                Text(
                                  listJadwal[index].jadwal_mulai,
                                  style: TextStyle(
                                    color: kTitleTextColor.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Tutup : "),
                                Text(
                                  listJadwal[index].jadwal_selesai,
                                  style: TextStyle(
                                    color: kTitleTextColor.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
