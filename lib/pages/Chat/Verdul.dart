import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
import 'package:healthcare/models/card_medis.dart';
import 'package:healthcare/pages/Chat/HomePage.dart';

import '../../models/ChatModels/UIHelper.dart';
import '../../models/ChatModels/UserModel.dart';

class Verdul extends StatefulWidget {
  final CardMedis cardMedis;

  Verdul(this.cardMedis);

  @override
  _VerdulState createState() => _VerdulState();
}

class _VerdulState extends State<Verdul> {
  bool _obscureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkValues() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == "" || password == "") {
      UIHelper.showAlertDialog(
          context, "Data tidak lengkap", "Harap lengkapi semua kolom");
    } else {
      logIn(email, password);
    }
  }

  void logIn(String email, String password) async {
    UserCredential? credential;

    UIHelper.showLoadingDialog(context, "Masuk..");

    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      // Close the loading dialog
      Navigator.pop(context);

      // Show Alert Dialog
      UIHelper.showAlertDialog(
          context, "Kesalahan terjadi", ex.message.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;

      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      UserModel userModel =
          UserModel.fromMap(userData.data() as Map<String, dynamic>);

      // Go to HomePage
      print("Masuk sukses!");
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return HomePage(
              userModel: userModel, firebaseUser: credential!.user!);
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kHealthCareColor,
        elevation: 0,
        title: Text("Verifikasi dua langkah"),
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Masukkan email dan password yang anda buat ketika Register",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kHealthCareColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kHealthCareColor,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: kHealthCareColor,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: kHealthCareColor,
                      ),
                      filled: true,
                      fillColor: kHealthCareColor.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kHealthCareColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: kHealthCareColor,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.vpn_key_sharp,
                        color: kHealthCareColor,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kGreyColor.withOpacity(0.7),
                        ),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: kHealthCareColor,
                      ),
                      filled: true,
                      fillColor: kHealthCareColor.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      checkValues();
                    },
                    color: kHealthCareColor,
                    child: Text("Masuk"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
