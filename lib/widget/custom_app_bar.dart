import 'package:flutter/material.dart';
import 'package:note_app/widget/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.text, required this.icon, this.onPressed});
  final String text;
  final Icon icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
        const Spacer(
          flex: 1,
        ),
        CustomIcon(onPressed: onPressed, icon: icon)
      ],
    );
  }
}
