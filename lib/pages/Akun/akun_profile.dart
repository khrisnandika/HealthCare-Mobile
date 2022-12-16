import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/pages/Akun/detail_setting.dart';
import 'package:healthcare/pages/Akun/edit_akun.dart';
import 'package:healthcare/pages/Akun/detail_faq.dart';
import 'package:healthcare/pages/Akun/ubah_password.dart';
import 'package:healthcare/pages/LoginRegister/login_pages.dart';

class AkunProfile extends StatefulWidget {
  const AkunProfile({super.key});

  @override
  State<AkunProfile> createState() => _AkunProfileState();
}

class _AkunProfileState extends State<AkunProfile> {
  Future logOut(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.signOut().then(
        (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LoginPage(),
            ),
          );
        },
      );
    } catch (e) {
      print("error");
    }
  }

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  String fullname = '';
  String profilepic = '';

  Future getDocId() async {
    var result = await _firebaseFirestore
        .collection('users')
        .where('uid', isEqualTo: user?.uid)
        .get();
    setState(() {
      fullname = result.docs[0]['fullname'];
      profilepic = result.docs[0]['profilepic'];
    });
  }

  @override
  void initState() {
    super.initState();
    getDocId();
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
          "Akun",
          style: TextStyle(
            color: kTitleTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                      backgroundImage: NetworkImage(
                        profilepic,
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
              user!.displayName.runtimeType == Null
                  ? '-'
                  : user!.displayName.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              user!.email!.runtimeType == Null ? '-' : user!.email!.toString(),
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
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
            _FaqButton(context),
            _settingButton(context),
            _logoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _FaqButton(BuildContext context) {
    return Column(
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
                    builder: (context) => FaqPage(),
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
                    child: Icon(
                      Icons.question_answer,
                      color: kHealthCareColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Faq',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kTitleTextColor.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _settingButton(BuildContext context) {
    return Column(
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
                    builder: (context) => DetailSetting(),
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
                    'Pengaturan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kTitleTextColor.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _logoutButton(BuildContext context) {
    return Column(
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
                logOut(context);
              },
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
                    'Keluar',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kTitleTextColor.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
