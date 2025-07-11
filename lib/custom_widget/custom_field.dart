import 'package:chat_app/model/colors.dart';
import 'package:flutter/material.dart';

class custom_textfield extends StatelessWidget {
  final String labeltext;
  final Widget? prefixicon;
  final TextEditingController? controller;
  final Widget suffixicon;
  final Function()? onpressed;
  final bool isHide;
  final void Function()? onTap;
  final String? Function(String?)? Validator;
  final bool isreadonly;

  const custom_textfield(
      {super.key,
      required this.labeltext,
      required this.prefixicon,
      this.controller,
      this.suffixicon = const SizedBox(),
      this.onpressed,
      this.isHide = false,
        this.onTap,
        this.Validator,
        this.isreadonly = false


      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHide,
      controller: controller,
      decoration: InputDecoration(
        labelText: labeltext,
        prefixIcon: prefixicon,
        suffixIcon: IconButton(
          onPressed: onpressed,
          icon: suffixicon,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: AppColors.mainColor)),
      ),
      onTap: onTap,
      validator: Validator,
      readOnly: isreadonly,
    );
  }
}
