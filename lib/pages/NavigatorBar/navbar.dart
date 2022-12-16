import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healthcare/core/const.dart';
import 'package:healthcare/pages/Akun/akun_profile.dart';
import 'package:healthcare/pages/DaftarPerawat/daftar_perawat.dart';
import 'package:healthcare/pages/Dashboard/dasboard_page.dart';
import 'package:healthcare/pages/Jadwal/jadwal.dart';
import 'package:healthcare/pages/NavigatorBar/global.dart';

class NavigasiBar extends StatefulWidget {
  const NavigasiBar({super.key});

  @override
  State<NavigasiBar> createState() => _NavigasiBarState();
}

class _NavigasiBarState extends State<NavigasiBar> {
  final global = Global();
  List pindah = [DashboardPage(), DaftarPerawat(), JadwalPage(), AkunProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: pindah[global.index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
          child: GNav(
            selectedIndex: global.index,
            backgroundColor: kWhiteColor,
            color: kTitleTextColor,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xff0ab885),
            gap: 8,
            onTabChange: (i) {
              setState(() {
                global.index = i;
              });
            },
            padding: EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.dashboard_outlined,
                text: 'Beranda',
              ),
              GButton(
                icon: Icons.list_alt_rounded,
                text: 'Tenaga Medis',
              ),
              GButton(
                icon: Icons.edit_calendar_outlined,
                text: 'Jadwal',
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
