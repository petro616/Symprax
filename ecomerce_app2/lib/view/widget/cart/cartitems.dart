import 'package:Symprax/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartitems extends StatelessWidget {
  final String title;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onadd;
  final void Function()? ondelete;
  const Cartitems(
      {super.key,
      required this.title,
      required this.price,
      required this.count,
      required this.onadd,
      required this.imagename,
      required this.ondelete});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(100.r, 100.r),
              bottomRight: Radius.elliptical(100.r, 100.r))),
      margin: EdgeInsets.only(left: 5.w, top: 5.h, right: 5.w),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(50.r, 50.r),
                      bottomRight: Radius.elliptical(50.r, 50.r)),
                  child: CachedNetworkImage(
                    imageUrl: "${Applink.imageitems}/$imagename",
                    fit: BoxFit.cover,
                    height: 110.h,
                  ))),
          Expanded(
              flex: 4,
              child: ListTile(
                title: Container(
                    margin: EdgeInsets.only(bottom: 4.h),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.bold),
                    )),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5.h),
                      child: Text(
                        price,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18.5.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "BebasNeue"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.h),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: ondelete,
                            child: Container(
                                height: 20.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 17.w,
                                )),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 12.w, right: 12.w),
                              child: Text(
                                count,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "BebasNeue"),
                              )),
                          InkWell(
                            onTap: onadd,
                            child: Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 17.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
