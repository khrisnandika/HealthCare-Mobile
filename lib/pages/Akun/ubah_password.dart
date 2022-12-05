import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
import 'package:healthcare/models/ChatModels/UIHelper.dart';
import 'package:healthcare/pages/LoginRegister/login_pages.dart';

class ubahPassword extends StatefulWidget {
  @override
  State<ubahPassword> createState() => _ubahPasswordState();
}

class _ubahPasswordState extends State<ubahPassword> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController= TextEditingController();

  void _changePassword(String currentPassword, String newPassword) async {
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: currentPasswordController.text);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        UIHelper.showAlertDialog(
            context, "Berhasil", "Kata Sandi anda berhasil diubah !");
      }).catchError(
        (error) {
          UIHelper.showAlertDialog(
              context, "Kesalahan terjadi", error.message.toString());
        },
      );
    }).catchError((err) {
      UIHelper.showAlertDialog(
          context, "Kesalahan terjadi", err.message.toString());
    });
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
          "Ubah Password",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 30,
              //     vertical: 10,
              //   ),
              //   child: TextField(
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       labelText: 'Password Awal',
              //       hintText: 'Password Awal',
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: TextField(
                  controller: currentPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password Lama',
                    hintText: 'Masukkan password lama anda',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password Baru',
                    hintText: 'Masukkan password baru anda',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 335,
                child: ElevatedButton(
                  onPressed: () {
                    _changePassword(currentPasswordController.text,
                        newPasswordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kHealthCareColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Simpan'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
