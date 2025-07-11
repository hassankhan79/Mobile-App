import 'package:auth_buttons/auth_buttons.dart';
import 'package:chat_app/custom_widget/custom_field.dart';
import 'package:chat_app/custom_widget/heading_text.dart';
import 'package:chat_app/custom_widget/subheading.dart';
import 'package:chat_app/login_screens/forget_password.dart';
import 'package:chat_app/login_screens/signUp_Screen.dart';
import 'package:chat_app/mainScreens/main_screen.dart';
import 'package:chat_app/model/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final formkey = GlobalKey<FormState>();
  bool ispass_visible = true;
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final auth = FirebaseAuth.instance;

  void signOut() async{
    try{
      await auth.signInWithEmailAndPassword(
          email: emailControler.toString(),
          password: passwordControler.toString()
      );
    }
    catch(ex){
    print(ex.toString());
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
                  h_text: "Wellcome Back!",
                  f_size: 35,
                  f_color: AppColors.mainColor
                ),
                const SizedBox(
                  height: 40,
                ),
                // sub_heading(
                //     sub_text: "let's get you Sign in",
                //     f_size: 23,
                //     f_color: Colors.grey),
                // SizedBox(
                //   height: 50,
                // ),

                //Email textfield
                custom_textfield(
                    labeltext: "Email",
                    controller: emailControler,
                    prefixicon: const Icon(Icons.email),
                    Validator: (value){
                      if(value == null || value.isEmpty){
                        return " Please Enter your Email";
                      }
                      if(!value.contains('@')){
                        return "Invalid Email";
                      }
                    },
                ),
                const SizedBox(
                  height: 20,
                ),

                //Password textfield
                custom_textfield(
                  controller: passwordControler,
                  labeltext: "Password",
                  isHide: ispass_visible,
                  prefixicon: Icon(Icons.password),
                  suffixicon: Icon(
                      ispass_visible ? Icons.visibility_off : Icons.visibility),
                  onpressed: () {
                    setState(() {
                      ispass_visible = !ispass_visible;
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

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        print("forget pressed");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
                      },
                      child: const Text("Forget password",
                      style: TextStyle(
                        color: AppColors.mainColor
                      ),
                      )),
                ),

                const SizedBox(
                  height: 35,
                ),

                //Login Button
                ElevatedButton(
                    onPressed: () {
                      if(formkey.currentState!.validate()){
                        signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => mainScreen()));

                      }
                    },
                    child: const Text("Login")),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Don't have account",
                    style: TextStyle(
                      color: AppColors.mainColor
                    ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        print("signup clicked");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15,),

                  //Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 50,
                        color: Colors.green,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(fontWeight: FontWeight.bold,),
                    ),
                    Expanded(
                      child: Divider(
                        height: 50,
                        color: Colors.green,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 40,),

                //Auth buttons
                GoogleAuthButton(
                  onPressed: (){
                    print("google button clicked");
                  },
                ),
                const SizedBox(height: 16,),

                FacebookAuthButton(
                  onPressed: (){
                    print("Facebook clicked");
                  },
                ),

                const SizedBox(height: 16,),
                AppleAuthButton(
                  onPressed: (){
                    print("Ios clicked");
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
