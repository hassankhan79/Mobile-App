import 'package:flutter/material.dart';

class custom_textfield extends StatelessWidget {
  final TextEditingController? textcontroller;
  final String labeltext;
  final Widget prefixicon;
  final String? Function(String?)? fieldValidator;
  final bool hidePassword;
  final Widget suffixicon;
  final Function()? onSuffixPressed;
  final Function()? ontap;
  final bool readonly;

  const custom_textfield(
      {super.key,
      this.textcontroller,
      required this.labeltext,
      required this.prefixicon,
      this.fieldValidator,
      this.hidePassword = false,
      this.suffixicon = const SizedBox(),
      this.onSuffixPressed,
      this.ontap,
      this.readonly=true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textcontroller,
        // readOnly: readonly,
        obscureText: hidePassword,
        decoration: InputDecoration(
          labelText: labeltext,
          prefixIcon: prefixicon,
          suffixIcon: IconButton(
            onPressed: onSuffixPressed,
            icon: suffixicon,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.deepPurple)),
        ),
        onTap: ontap,
        validator: fieldValidator);
  }
}
