import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FirstbackgroundcolorSettings extends StatelessWidget {
  final Color color;
  const FirstbackgroundcolorSettings({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70.r),
              bottomLeft: Radius.circular(70.r)),
          color: color),
      height: 310.h,
      width: Get.width.w,
    );
  }
}
