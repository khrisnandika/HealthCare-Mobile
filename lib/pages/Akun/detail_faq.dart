import 'dart:async';

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getwidget/getwidget.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
import 'package:healthcare/models/ApiModels/faq.dart';
import 'package:healthcare/core/api_service.dart/faq_api.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<Faq> listFaq = [];
  Repository repository = Repository();

  getData() async {
    listFaq = await repository.getData();
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
      // counter ;
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
          "Faq",
          style: TextStyle(
            color: kTitleTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FlutterIcons.left_open_1,
            color: kTitleTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Accordion(
                    maxOpenSections: 2,
                    headerPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    headerBackgroundColor: kHealthCareColor,
                    paddingListTop: 0,
                    paddingListBottom: 0,
                    // leftIcon: Icon(Icons.audiotrack, color: Colors.white),
                    children: [
                      AccordionSection(
                        contentBorderColor: kHealthCareColor,
                        headerBackgroundColor: kHealthCareColor,
                        isOpen: false,
                        header: Text(
                          listFaq[index].pertanyaan,
                          style:
                              TextStyle(color: kBackgroundColor, fontSize: 15),
                        ),
                        content: Text(listFaq[index].jawaban),
                      ),
                      // AccordionSection(
                      //   isOpen: true,
                      //   headerText: 'About Us',
                      //   content: Icon(Icons.airline_seat_flat,
                      //       size: 120, color: Colors.blue[200]),
                      // ),
                      // AccordionSection(
                      //   isOpen: true,
                      //   headerText: 'Company Info',
                      //   content: Icon(Icons.airplay,
                      //       size: 70, color: Colors.green[200]),
                      // ),
                    ],
                  ),
                  // GFAccordion(
                  //   title: listFaq[index].pertanyaan,
                  //   content: listFaq[index].jawaban,
                  //   expandedTitleBackgroundColor: kHealthCareColor,
                  //   collapsedTitleBackgroundColor:
                  //       kHealthCareColor.withOpacity(0.2),
                  //   titleBorderRadius: BorderRadius.circular(10),
                  //   contentBorderRadius: BorderRadius.circular(10),
                  // ),
                  // Text(
                  //   listFaq[index].pertanyaan,
                  // ),
                  // Text(
                  //   listFaq[index].jawaban,
                  // ),
                  // Text(counter.toString()),
                ],
              );
            },
            itemCount: listFaq.length,
          ),
        ),
      ),
    );
  }
}
