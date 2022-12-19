import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/core/flutter_icons.dart';
import 'package:healthcare/models/ChatModels/UIHelper.dart';
import 'package:healthcare/pages/Akun/akun_profile.dart';
import 'package:healthcare/pages/NavigatorBar/navbar.dart';

class EditAkun extends StatefulWidget {
  @override
  State<EditAkun> createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  void _alertDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Akun"),
          content: SizedBox(
            height: 95,
            child: Column(
              children: [
                const Text("Apakah anda benar ingin mengedit akun?"),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 38,
                      width: 90,
                      child: ElevatedButton(
                        child: Text("Batal"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kHealthCareColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 90,
                      child: ElevatedButton(
                        child: Text("Simpan"),
                        onPressed: () {
                          editData();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kdeleteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String alamat = '';
  String gender = '';
  String fullname = '';
  String profilepic = '';

  Future getDocId() async {
    var result = await _firebaseFirestore
        .collection('users')
        .where('uid', isEqualTo: user?.uid)
        .get();
    setState(() {
      fullname = result.docs[0]['fullname'];
      alamat = result.docs[0]['address'];
      gender = result.docs[0]['gender'];
      profilepic = result.docs[0]['profilepic'];
    });
  }

  // Future updateData() async {
  //   var result = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(_emailController.text)
  //       .update({
  //     "fullname": _namaController.text,
  //     "address": _alamatController.text,
  //     "gender": _genderController.text,
  //   });
  // }

  void editData() async {
    try {
      if (_namaController.text != '') {
        user?.updateDisplayName(_namaController.text).then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavigasiBar(),
            ),
          );
          UIHelper.showAlertDialog(
            context, "Berhasil", "Akun anda berhasil diubah !");
        });
        
      }
    } catch (e) {
      UIHelper.showAlertDialog(context, "Kesalahan terjadi", e.toString());
    }
    ;
  }

  @override
  void initState() {
    getData();
    getDocId();
    super.initState();
  }

  getData() {
    setState(() {
      _namaController.text = user!.displayName!;
      _emailController.text = user!.email!;
      _alamatController.text = alamat;
      _genderController.text = gender;
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
          "Edit Akun",
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
                      backgroundImage: NetworkImage(profilepic),
                      radius: 70,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.edit,
                        ),
                        backgroundColor: kHealthCareColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 10,
              ),
              child: TextField(
                controller: _namaController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kHealthCareColor,
                      ),
                    ),
                    labelText: 'Nama Lengkap',
                    labelStyle: GoogleFonts.montserrat(
                        color: kHealthCareColor, fontSize: 14),
                    hintText: user!.displayName,
                    hintStyle: GoogleFonts.montserrat(fontSize: 14)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 10,
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    filled: true,
                    enabled: false,
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kHealthCareColor,
                      ),
                    ),
                    labelText: 'Email',
                    labelStyle: GoogleFonts.montserrat(
                        color: kHealthCareColor, fontSize: 14),
                    hintText: user!.email!,
                    hintStyle: GoogleFonts.montserrat(fontSize: 14)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 10,
              ),
              child: TextField(
                controller: _alamatController..text = alamat,
                decoration: InputDecoration(
                    filled: true,
                    enabled: false,
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kHealthCareColor,
                      ),
                    ),
                    labelText: 'Alamat',
                    labelStyle: GoogleFonts.montserrat(
                        color: kHealthCareColor, fontSize: 14),
                    hintStyle: GoogleFonts.montserrat(fontSize: 14)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 10,
              ),
              child: TextField(
                controller: _genderController..text = gender,
                decoration: InputDecoration(
                    filled: true,
                    enabled: false,
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kHealthCareColor,
                      ),
                    ),
                    labelText: 'Jenis Kelamin',
                    labelStyle: GoogleFonts.montserrat(
                        color: kHealthCareColor, fontSize: 14),
                    hintStyle: GoogleFonts.montserrat(fontSize: 14)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.84,
              child: ElevatedButton(
                onPressed: () {
                  _alertDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kHealthCareColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
