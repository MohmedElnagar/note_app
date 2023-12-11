import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final void Function()? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
          child: IconButton(
        onPressed: onPressed,
        icon: icon,
      )),
    );
  }
}
