import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp2/files/signup.dart';
import 'package:myapp2/main_screens/mainsreen.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final formkey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(22),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Wellcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.orange,
                ),
              ),
              Text(
                'let you can sign in first',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email not be emoty';
                    }
                    if (!value.contains('@')) {
                      return 'invalid email';
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: isPasswordVisible,
                decoration: InputDecoration(
                    labelText: 'password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                validator: (value) {
                  print('thia ia validated value');
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  if (value.length < 8) {
                    return 'password must be atleast 8 characters';
                  }
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    //  Navigator.push(
                    //       context, MaterialPageRoute(builder: buil),
                    //       );
                  },
                  child: Text('forget your password'),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: (){
                  print('asdghgfds');
                  if(formkey.currentState!.validate()){
                    print('button vcxcvbv');
                  }
                  print('bnmsdfvdsv');
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (context) => main_screen()));
                },
                child: Text('login'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have account',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                      print('signup clicked');
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
