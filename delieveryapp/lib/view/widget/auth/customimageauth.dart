import "package:DelieveryApp/core/constant/imageasset.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Customimageauth extends StatelessWidget {
  const Customimageauth({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.r),
        child: Image.asset(
          AppImageAsset.logInLogo,
          height: 80.h,
        ),
      ),
    );
  }
}
