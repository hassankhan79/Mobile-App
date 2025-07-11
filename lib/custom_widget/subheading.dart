import 'package:flutter/material.dart';

class sub_heading extends StatelessWidget {

    final String sub_text;
  final double? f_size;
  final Color? f_color;

  const sub_heading(
    {super.key,
      required this.sub_text,
    required this.f_size,
    required this.f_color
    
    });

  @override
  Widget build(BuildContext context) {
    return  Text(
      sub_text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: f_size,
        color: f_color,
      ),
    );;
  }
}