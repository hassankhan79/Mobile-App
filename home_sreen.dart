import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp2/files/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp2/models/User_detail.dart';
import 'package:myapp2/models/usermodel.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  anonymous aUser = anonymous(email: '', name: '', dob: '', gender: '');

  final fireStore = FirebaseFirestore.instance;
  final userAuth = FirebaseAuth.instance;

  // List<anonymous>? ListA;
  List<anonymous> userList = [
    anonymous(email: "email", name: "name", dob: "dob", gender: "gender"),
    anonymous(email: "email", name: "name", dob: "dob", gender: "gender"),
    anonymous(email: "email", name: "name", dob: "dob", gender: "gender"),
    anonymous(email: "email", name: "name", dob: "dob", gender: "gender")
  ];

  bool isDataFetcehd = false;

  @override
  void initState() {
    super.initState();

    getUserInfo();
  }

  getUserInfo() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final userInfo =
        await FirebaseFirestore.instance.collection('user').doc(userId).get();

    final user_list = await fireStore.collection("user").get();

    if (user_list.docs.isNotEmpty) {
      userList = user_list.docs
          .map((UserDetail) => anonymous.fromJason(UserDetail.data()))
          .toList();
      print('this is user List ${userList.first.email}');
    }

    if (userInfo.exists) {
      aUser = anonymous.fromJason(userInfo.data()!);

      print('thisi is user email: ${aUser.email}');

      
    }
    setState(() {
        isDataFetcehd = true;
      });
  }

  void SignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loginscreen()));
    } catch (ex) {
      print(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: !isDataFetcehd
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text(userList[index].name),
                      subtitle: Text(userList[index].email),
                    );
                    
                  }),
            ),
      drawer: Drawer(
        child: ListView(
          children: [
            !isDataFetcehd
                ? CircularProgressIndicator()
                : UserAccountsDrawerHeader(
                    accountName: Text(
                      aUser.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    accountEmail: Text(aUser.email),
                    currentAccountPicture: Image.asset('assets/profile.PNG'),
                  ),
            ListTile(
              title: const Text('help'),
              leading: const Icon(Icons.help),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
              onTap: SignOut,
            )
          ],
        ),
      ),
    );
  }
}
