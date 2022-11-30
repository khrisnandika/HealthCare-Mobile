import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/models/ChatModels/UIHelper.dart';
import 'package:healthcare/models/ChatModels/UserModel.dart';
import 'package:healthcare/pages/CompleteProfile.dart';
import 'package:healthcare/pages/LoginRegister/login_pages.dart';
import 'package:healthcare/widgets/animation.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureCText = true;

  void checkValues() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if (email == "" || password == "" || cPassword == "") {
      UIHelper.showAlertDialog(
          context, "Data tidak lengkap", "Harap lengkapi semua kolom");
    } else if (password != cPassword) {
      UIHelper.showAlertDialog(context, "Kesalahan terjadi",
          "Kata sandi yang anda masukkan tidak cocok!");
    } else {
      signUp(email, password);
    }
  }

  void signUp(String email, String password) async {
    UserCredential? credential;

    UIHelper.showLoadingDialog(context, "Membuat akun baru..");

    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      Navigator.pop(context);

      UIHelper.showAlertDialog(
          context, "Kesalahan terjadi", ex.message.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;
      // User? user = credential.user;
      // user?.updateDisplayName(namaController.text);
      UserModel newUser =
          UserModel(uid: uid, email: email, fullname: "", profilepic: "");
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(newUser.toMap())
          .then(
        (value) {
          print("New User Created!");
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return CompleteProfile(
                  userModel: newUser, firebaseUser: credential!.user!);
            }),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/background2.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 50,
                      top: 25,
                      width: 300,
                      height: 200,
                      child: FadeAnimation(
                        1.5,
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image/logoWhite.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: FadeAnimation(
                        1.6,
                        Container(
                          margin: EdgeInsets.only(top: 350),
                          child: Center(
                            child: Text(
                              "Daftar",
                              style: GoogleFonts.inter(
                                color: kHealthCareColor,
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.100),
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.100),
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
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
                                      color: kGreyColor.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: cPasswordController,
                                obscureText: _obscureCText,
                                decoration: InputDecoration(
                                  hintText: "Konfirmasi Password",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureCText = !_obscureCText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureCText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: kGreyColor.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      2,
                      GestureDetector(
                        onTap: () {
                          checkValues();
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(10, 184, 133, 1.000),
                                Color.fromRGBO(10, 184, 133, .600),
                              ])),
                          child: Center(
                            child: Text(
                              "Daftar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                      1.5,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Sudah Memiliki Akun?",
                                style: TextStyle(
                                  color: kGreyColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                  color: kHealthCareColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
