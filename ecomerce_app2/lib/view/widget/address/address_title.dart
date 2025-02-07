import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressTitle extends StatelessWidget {
  final String title;
  const AddressTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontFamily: "BebasNeue",
            fontSize: 22.sp),
      ),
    );
  }
}
