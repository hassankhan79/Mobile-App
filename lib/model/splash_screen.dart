import 'package:chat_app/login_screens/login_screen.dart';
import 'package:chat_app/mainScreens/main_screen.dart';
import 'package:chat_app/model/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  void checkUser() async{
    Future.delayed(Duration(seconds: 3), (){
      final User? user= FirebaseAuth.instance.currentUser;
      if(user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => mainScreen()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => login_screen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body:  Center(
          child: Text("Splash Screen",
            style: TextStyle(
                color: AppColors.mainColor,
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
