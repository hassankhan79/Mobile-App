import 'package:flutter/material.dart';
import 'package:myapp2/main_screens/home_sreen.dart';
import 'package:myapp2/main_screens/profile_screen.dart';
import 'package:myapp2/main_screens/status_screen.dart';

class main_screen extends StatefulWidget {
  const main_screen({super.key});

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {

int currentindex=0;

    final List<Widget> tabs =[
      const home_screen(),
      const status_screen(),
      const ProfileScreen()
    ];

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: tabs[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (index){
          print('this is index $index');
          setState(() {
            currentindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ]
        ),
    );
  }
}