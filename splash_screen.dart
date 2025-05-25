import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp2/files/login.dart';
import 'package:myapp2/files/loginscreen.dart';
import 'package:myapp2/main_screens/mainsreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    CheckUser();
  }

  void CheckUser() async {
    Future.delayed(Duration(seconds: 2), () {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => main_screen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => loginscreen()));
      }
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash screen"),
      ),
    );
  }
}
