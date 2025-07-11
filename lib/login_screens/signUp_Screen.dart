import 'package:chat_app/custom_widget/Custom_Button.dart';
import 'package:chat_app/custom_widget/custom_field.dart';
import 'package:chat_app/custom_widget/heading_text.dart';
import 'package:chat_app/mainScreens/main_screen.dart';
import 'package:chat_app/model/colors.dart';
import 'package:chat_app/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final formkey = GlobalKey<FormState>();

  bool isPasswordVisible = true;
  bool readonly = true;
  String Gender = 'Male';
  bool? isCheck = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final paswordController = TextEditingController();
  final confirmPass_Controller = TextEditingController();
  final dateController = TextEditingController();

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;


  void signUp() async{
    try{
 await auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: paswordController.text.toString(),
      );

      final anonymous_User = await auth.signInAnonymously();
      if(anonymous_User.user != null ){
        print("this is user email: ${anonymous_User.user!.email}");

        final userModel = AnonymousUser(
          name : nameController.text,
          email : emailController.text,
          dob : dateController.text,
          gender : Gender,   );

        await fireStore
            .collection("user")
            .doc(anonymous_User.user!.uid)
            .set(userModel.toJason());
        print("Userdata svaed Successfully");
      }
    }
    catch(e){
      print(e.toString());
    }
  }



  Future<void> pickDate() async{
    final DateTime?  pickDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2003),
    lastDate: DateTime.now());

    if(pickDate != null){
      dateController.text =pickDate.toString().split(' ')[0];
      print("Pick date is ${dateController.text}");
      setState(() {

      });
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

                  //Heading text
                   heading_text(
                       h_text: "SingUp Here!",
                       f_size: 40,
                       f_color: AppColors.subColor
                   ),
                  SizedBox(height: 40,),

                  //Name Feild
                  custom_textfield(
                    controller: nameController,
                      labeltext: "Name",
                      prefixicon: Icon(Icons.person)
                  ),
                  SizedBox(height: 20,),

                  //Email field
                  custom_textfield(
                    controller: emailController,
                      labeltext: "Email",
                      prefixicon: Icon(Icons.email),
                    Validator: (value){
                      if(value == null || value.isEmpty){
                        return " Please Enter your Email";
                      }
                      if(!value.contains('@')){
                        return "Invalid Email";
                      }
                    },
                  ),
                  SizedBox(height: 20,),

                  //Password field
                  custom_textfield(
                    controller: paswordController,
                    labeltext: "Password",
                    isHide: isPasswordVisible,
                    prefixicon: Icon(Icons.lock),
                    suffixicon: Icon(
                        isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                    onpressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                        print("icon pressed");
                      });
                    },
                    Validator: (value){
                      if (value == null || value.isEmpty){
                        return "Please Enter Password";
                      }
                      if(value.length < 8){

                        return "Password must 8 Characters";
                      }
                    },
                  ),
                  SizedBox(height: 20,),

                  //ConfirmPassword Field
                  custom_textfield(
                    controller: confirmPass_Controller,
                    labeltext: "Confirm Password",
                    isHide: isPasswordVisible,
                    prefixicon: Icon(Icons.lock),
                    suffixicon: Icon(
                        isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                    onpressed: () {
                      setState(() {
                       isPasswordVisible = !isPasswordVisible;
                        print("icon pressed");
                      });
                    },
                    Validator: (value){
                      if (value == null || value.isEmpty){
                        return "Please Enter Password";
                      }
                      if(value.length < 8){

                        return "Password must 8 Characters";
                      }
                    },
                  ),
                  SizedBox(height: 20,),

                  //dob
                  custom_textfield(
                    controller: dateController,
                      isreadonly: readonly,
                      labeltext: "dob",
                      prefixicon: Icon(Icons.calendar_month),
                    onTap: () => pickDate(),
                  ),
                  SizedBox(height: 20,),

                  //Gender
                  Text(
                    "Gender",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.subColor
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "Male",
                          groupValue: Gender,
                          onChanged: (value){
                            print("male");
                            setState(() {
                              Gender = value.toString();
                            });
                          }),
                      Text("Male"),
                      SizedBox(width: 15,),

                      Radio(
                          value: "Female",
                          groupValue: Gender,
                          onChanged: (value){
                            print("Female");
                            setState(() {
                              Gender = value.toString();
                            });
                          }),
                      Text("Female"),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(
                          value: isCheck,
                          onChanged: (value){
                            setState(() {
                              isCheck = value;
                              print("Checked");
                            });
                          }
                      ),
                      Text(
                        "I accept the term and condition!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.subColor
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 10,),

                  // SignUp Button

                  custom_Buttons(
                      onPressed:  (){
                        if(formkey.currentState!.validate()){
                          signUp();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => mainScreen()));
                        }



                      },
                      b_Text: "Sign Up",
                      b_textColor: AppColors.subColor
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("I have account",
                        style: TextStyle(
                          color: AppColors.subColor,
                        ),
                      ),

                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          print("Login clicked");
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),



                ],
              )
          ),
        ),
      ),
    );
  }
}
