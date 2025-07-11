import 'package:flutter/material.dart';

class heading_text extends StatelessWidget {
  final String h_text;
  final double? f_size;
  final Color? f_color;


  const heading_text(
    {super.key,
    required this.h_text,
    required this.f_size,
    required this.f_color
    }
    );

  @override
  Widget build(BuildContext context) {
    return Text(
      h_text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: f_size,
        color: f_color,
      ),
    );
  }
}
