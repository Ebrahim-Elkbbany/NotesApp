import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxLine = 1, this.onSaved, this.onChanged});
  final int maxLine;
  final String hint;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
      },
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLine,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: borderBuild(),
        enabledBorder: borderBuild(),
        focusedBorder: borderBuild(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder borderBuild({color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
