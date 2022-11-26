import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_register/login_pages.dart';

import '../Dashboard/dasboard_page.dart';

class registerPages extends StatelessWidget {
  const registerPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/image/log_img.png"))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 380),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            // hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.teal))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            // suffix: Icon(Icons.remove_red_eye),
                            labelText: 'Password',
                            // hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.teal))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            // suffix: Icon(Icons.remove_red_eye),
                            labelText: 'Konfirmasi Password',
                            // hintText: 'Konfirmasi Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.teal))),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.teal)),
                          onPressed: () {
                            Get.to(DashboardPage());
                          },
                          child: Text('Register & Masuk')),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sudah Memiliki Akun?'),
                        TextButton(
                            onPressed: () {
                              Get.to(loginPages());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            )),
                      ],
                    )
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
