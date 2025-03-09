import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Customappbar extends StatelessWidget {
  final void Function()? onPressedSearch;
  final String titlehintText;
  final TextEditingController mycontroller;
  final void Function(String)? onChanged;
  const Customappbar(
      {super.key,
      required this.onPressedSearch,
      required this.titlehintText,
      required this.onChanged,
      required this.mycontroller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: onPressedSearch,
            icon: Icon(
              EvaIcons.search,
              color: Colors.grey,
              size: 22.w,
            ),
          ),
          hintText: titlehintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.all(5.w),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(200.r),
              borderSide: BorderSide(color: Colors.white, width: 3.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.r),
              borderSide: BorderSide(color: Colors.white, width: 3.w)),
          filled: true,
          fillColor: Colors.white),
    );
  }
}
