import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingButtonView extends StatelessWidget {
  final void Function() onPressed;
  const FloatingButtonView({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      onPressed: onPressed,
      child: Icon(
        Icons.add_circle,
        color: Colors.white,
      ),
    );
  }
}
