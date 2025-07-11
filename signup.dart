import 'package:flutter/material.dart';
import 'package:myapp2/files/loginscreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String Gender = 'Male';
  bool? ischeck = false;
  bool ispassvisible = false;
  final datecontroller = TextEditingController();
  final namecontroller = TextEditingController();

  Future<void> pickDate() async {
    final DateTime? pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2007),
        lastDate: DateTime.now());

    if (pickDate != null) {
      datecontroller.text = pickDate.toString().split('')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'SIGN UP HERE!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.deepPurple),
            ),
            Text(
              'Create an account!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey),
            ),
            SizedBox(height: 35),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.deepPurple,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.deepPurple,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: ispassvisible,
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.deepPurple,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispassvisible = !ispassvisible;
                      });
                    },
                    icon: Icon(ispassvisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.deepPurple,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispassvisible = !ispassvisible;
                      });
                    },
                    icon: Icon(ispassvisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: datecontroller,
              readOnly: true,
              decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: Colors.deepPurple,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onTap: pickDate,
            ),
            SizedBox(height: 20),
            Text(
              'GENDER',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            Row(
              children: [
                Radio(
                    value: 'Male',
                    groupValue: Gender,
                    onChanged: (value) {
                      print('male');
                      setState(() {
                        Gender = value.toString();
                      });
                    }),
                Text('Male'),
                SizedBox(height: 20),
                Radio(
                    value: 'Female',
                    groupValue: Gender,
                    onChanged: (value) {
                      setState(() {
                        Gender = value.toString();
                      });
                    }),
                Text('Female')
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                    value: ischeck,
                    onChanged: (value) {
                      setState(() {
                        ischeck = value;
                      });
                    }),
                Text(
                  'I have accept term and condition',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepPurple),
                )
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  print('signup cliked');
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepPurple),
                )),
                SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'i have have account',
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                    print('login clicked');
                  },
                  child: Text(
                    'login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
