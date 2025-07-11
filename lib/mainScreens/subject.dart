import 'package:chat_app/custom_widget/Custom_Button.dart';
import 'package:chat_app/custom_widget/custom_field.dart';
import 'package:chat_app/custom_widget/heading_text.dart';
import 'package:chat_app/mainScreens/homeScreen.dart';
import 'package:chat_app/mainScreens/main_screen.dart';
import 'package:chat_app/mainScreens/subject.dart';
import 'package:chat_app/model/SubjectModel.dart';
import 'package:chat_app/model/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subject extends StatefulWidget {
  const Subject({super.key});

  @override
  State<Subject> createState() => _SubjectState();

}

class _SubjectState extends State<Subject> {
  final GlobalKey formkey = GlobalKey<FormState>();
  final sub_nameController = TextEditingController();
  final teacherNameController = TextEditingController();
  final midMarksController = TextEditingController();
  final finalMarksController = TextEditingController();
  final cridetHourController = TextEditingController();

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  String? get uid => auth.currentUser!.uid;

  void sub_detail() async{
    try{


        final sub_Model = SubjectDetail(
            sub_name: sub_nameController.text,
            sub_teacher: teacherNameController.text,
            cridetHours: cridetHourController.text,
            mid_marks: midMarksController.text,
            Final_marks: finalMarksController.text);

        if(uid == null){
          print("user data not saved");
          return;
        }

        await fireStore
            .collection('subject')
            .doc(auth.currentUser!.uid)
            .collection('subject')
            .add(sub_Model.toJson());
        print("user data saved sucessfully");



    }catch(ex){
      print("error occur:${ex.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.all(20),
          child: Form(
            key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  heading_text(
                      h_text: "Subject Detail",
                      f_size: 35,
                      f_color: AppColors.subColor
                  ),
                  SizedBox(height: 45,),

                  custom_textfield(
                    controller: sub_nameController,
                      labeltext: "Subject Name",
                      prefixicon: Icon(Icons.subject)),
                  SizedBox(height: 18,),
                  custom_textfield(
                    controller: teacherNameController,
                      labeltext: "Subject Teacher",
                      prefixicon: Icon(Icons.person)),
                  SizedBox(height: 18,),

                  custom_textfield(
                      controller: cridetHourController,
                      labeltext: "Credit Hour",
                      prefixicon: Icon(Icons.timer)),
                  SizedBox(height: 18,),

                  custom_textfield(
                    controller: midMarksController,
                      labeltext: "Mid marks",
                      prefixicon: Icon(Icons.calculate)),
                  SizedBox(height: 18,),

                  custom_textfield(
                    controller: finalMarksController,
                      labeltext: "Final Marks",
                      prefixicon: Icon(Icons.calculate)),
                  SizedBox(height: 22,),
                  custom_Buttons(
                      onPressed: (){

                        sub_detail();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => mainScreen()));
                      },
                      b_Text: "Submit",
                      b_textColor: AppColors.subColor,
                  )

                ],

          )),
        ),
      ),
    );
  }
}
