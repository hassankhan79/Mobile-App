import 'package:chat_app/mainScreens/homeScreen.dart';
import 'package:chat_app/mainScreens/subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  
  int currentIndex =0;

  final List<Widget> tabs = [
    const home_Screen(),
    const Subject(),
    const home_Screen(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
          onTap: (index){
          setState(() {
            currentIndex = index;
          });
          },
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Subjects"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          ]
      ),
    );
  }
}
