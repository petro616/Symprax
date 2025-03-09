import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowImageForCategories extends StatelessWidget {
  final File image;
  const ShowImageForCategories({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
      height: 400.h,
      width: 100.w,
      child: Image.file(image, fit: BoxFit.cover),
    );
  }
}
