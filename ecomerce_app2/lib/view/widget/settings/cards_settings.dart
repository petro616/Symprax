import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardsSettings extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData? icon;
  const CardsSettings(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        color: Colors.grey[200],
        child: ListTile(
          title: Text(
            title,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
          trailing: Icon(
            icon,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
