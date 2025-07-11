import 'package:chat_app/mainScreens/subject.dart';
import 'package:chat_app/model/SubjectModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final SubjectDetail userData;
  const UserDetail({
    super.key,
    required this.userData
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListTile(
          title: Text(userData.sub_name),
          subtitle: Text(userData.sub_teacher),
          leading: Text(userData.cridetHours),

        ),
      ),
    );
  }
}
