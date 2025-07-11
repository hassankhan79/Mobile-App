import 'package:flutter/cupertino.dart';

class AnonymousUser {
  final String? uid;
  final String name;
  final String email;
  final String dob;
  final String gender;
  AnonymousUser({
    this.uid,
    required this.name,
    required this.email,
    required this.dob,
    required this.gender

    
});
  Map<String, dynamic> toJason(){
    return{
      "uid" : uid,
      "name" : name,
      "email" : email,
      "dob" : dob,
      "gender" : gender,
      "CreatedAt" :DateTime.now().toIso8601String()

    };

  }
  factory AnonymousUser.fromJason(Map<String, dynamic> Jason){
    return AnonymousUser(
        name: Jason['name'],
        email: Jason['email'],
        dob: Jason['dob'],
        gender: Jason['gender']
    );
    }
}
