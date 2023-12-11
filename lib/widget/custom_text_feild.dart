import 'package:note_app/constans.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintext,
    this.maxline = 1,
    this.onSaved,
    this.onChanged,
  });
  final String hintext;
  final int maxline;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "felid is requried";
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxline,
        cursorColor: kPrimarcolor,
        decoration: InputDecoration(
            hintText: hintext,
            // labelStyle: const TextStyle(color: kPrimarcolor),
            enabledBorder: buildborder(),
            focusedBorder: buildborder(kPrimarcolor),
            border: buildborder()));
  }

  OutlineInputBorder buildborder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
