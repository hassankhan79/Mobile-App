import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class custom_Buttons extends StatelessWidget {
  final void Function()? onPressed;
  final String b_Text;
  final Color b_textColor;
  
  
  const custom_Buttons({
    super.key,
    required this.onPressed,
    required this.b_Text,
    required this.b_textColor
  }
      );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          b_Text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: b_textColor
          ),
        ));
  }
}
