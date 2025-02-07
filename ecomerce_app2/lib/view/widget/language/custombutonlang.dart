import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Custombutonlang extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Custombutonlang({super.key, required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 200.w,
      color: Colors.orange[100],
      textColor: Colors.red,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
