import 'package:note_app/constans.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key, required this.text, this.ontap, this.isloading = false});
  final String text;
  final VoidCallback? ontap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kPrimarcolor,
          ),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
              child: isloading
                  ? const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : Text(
                      text,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    )),
        ),
      ),
    );
  }
}
