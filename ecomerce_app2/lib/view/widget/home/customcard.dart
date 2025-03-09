import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Customcard extends StatelessWidget {
  final String texttitle;
  final String image;
  const Customcard({super.key, required this.texttitle, required this.image});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 150.h,
          width: 400.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 2.h,
          left: 7.w,
          child: Text(
            texttitle,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
      ],
    );
  }
}
