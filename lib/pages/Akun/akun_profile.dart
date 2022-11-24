import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
import 'package:healthcare/pages/Akun/edit_akun.dart';
import 'package:healthcare/pages/Akun/setting.dart';

class AkunProfile extends StatefulWidget {
  const AkunProfile({super.key});

  @override
  State<AkunProfile> createState() => _AkunProfileState();
}

class _AkunProfileState extends State<AkunProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Akun",
          style: TextStyle(
            color: kTitleTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     FlutterIcons.left_open_1,
        //     color: kTitleTextColor,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: kHealthCareColor,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/image/avatar.png',
                      ),
                      radius: 70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Krisna",
              style: TextStyle(
                color: kTitleTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "khrisnandika@gmail.com",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new SizedBox(
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAkun(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kHealthCareColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Edit'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  width: 450,
                  height: 75,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kGreyColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Image(
                              image: AssetImage(
                                'assets/icons/setting.png',
                              ),
                              width: 25,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Setting',
                            style: TextStyle(
                                color: kTitleTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 450,
                  height: 75,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: TextButton(
                      onPressed: () => null,
                      style: TextButton.styleFrom(
                        backgroundColor: kGreyColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Image(
                              image: AssetImage(
                                'assets/icons/logout.png',
                              ),
                              width: 25,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                                color: kTitleTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
