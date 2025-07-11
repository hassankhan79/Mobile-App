import 'package:chat_app/custom_widget/userDetail.dart';
import 'package:chat_app/login_screens/login_screen.dart';
import 'package:chat_app/model/SubjectModel.dart';
import 'package:chat_app/model/colors.dart';
import 'package:chat_app/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> {
  AnonymousUser aUser = AnonymousUser(name: "", email: "", dob: "", gender: "");

  List<SubjectDetail> UserList = [];

  bool isdatafetched =false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async{
    try{
      final UserId = FirebaseAuth.instance.currentUser!.uid;
      final userInfo =
      await FirebaseFirestore.instance.collection('user').doc(UserId).get();
      final userlis = await FirebaseFirestore.instance.collection('subject').get();
      if(userInfo.exists){
        aUser =AnonymousUser.fromJason(userInfo.data()!);
        print("this is user email: ${aUser.email}");

      }
      if(userlis.docs.isNotEmpty){
        UserList = userlis.docs.map((UserDetail) => SubjectDetail.fromJason(UserDetail.data()))
            .toList();

      }else{
      }
      setState(() {
        isdatafetched = true;
      });
    }catch(ex){
      print(ex.toString());
    }
  }

  void signOut() async{
    try{
      await FirebaseAuth.instance.signOut();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => login_screen()));

    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),

          ),
          backgroundColor: AppColors.appbar_C,
        ),
        body: !isdatafetched ? Center(child: CircularProgressIndicator(),):
        Center(
          child: ListView.builder(
              itemCount: UserList.length,
              itemBuilder: (context, Index){
                return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        UserDetail(userData: UserList[Index])));
                  },
                  title: Text(UserList[Index].sub_name),
                  subtitle: Text(UserList[Index].sub_teacher),
                  leading: Text(UserList[Index].cridetHours),
                );
              }),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              !isdatafetched ? Center(child: CircularProgressIndicator(),):
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.appbar_C
                ),
                accountName: Text(
                  aUser.name
                ),
                accountEmail: Text(
                  aUser.email
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
              ),
              ListTile(
                title: Text("help"),
                leading: Icon(Icons.help),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: signOut,
              )
            ],
          ),
        ),
      ),
    );
  }
}
