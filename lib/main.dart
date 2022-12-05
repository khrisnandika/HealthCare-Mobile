import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/models/ChatModels/UserModel.dart';
import 'package:healthcare/pages/LoginRegister/login_pages.dart';
import 'package:healthcare/pages/NavigatorBar/navbar.dart';
import 'package:healthcare/pages/Onboarding/onboarding_page.dart';
import 'package:uuid/uuid.dart';

import 'models/ChatModels/FirebaseHelper.dart';

var uuid = Uuid();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 
  User? currentUser = FirebaseAuth.instance.currentUser;
  if(currentUser != null) {
    // Logged In
    UserModel? thisUserModel = await FirebaseHelper.getUserModelById(currentUser.uid);
    if(thisUserModel != null) {
      runApp(MyAppLoggedIn());
    }
    else {
      runApp(MyApp());
    }
  }
  else {
    // Not logged in
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        ),
      home: LoginPage(),
    );
  }
}

class MyAppLoggedIn extends StatelessWidget {
  

  const MyAppLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigasiBar(),
    );
  }
}

