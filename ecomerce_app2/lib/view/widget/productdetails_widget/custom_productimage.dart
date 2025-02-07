import 'package:cached_network_image/cached_network_image.dart';
import 'package:Symprax/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomProductimage extends GetView<ProductdetailsControllerimp> {
  // final String imagename;
  final List images;
  const CustomProductimage({
    super.key,
    // required this.imagename,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220.h,
          width: 490.w,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(0, 50),
                color: Colors.white,
                blurRadius: 200.0,
                spreadRadius: 10.0,
                blurStyle: BlurStyle.normal)
          ]),
          child: ClipRRect(
            clipBehavior: Clip.none,
            child: CardSwiper(
              padding: const EdgeInsets.only(),
              backCardOffset: const Offset(25, 45),
              cardsCount: images.length,
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) {
                return CachedNetworkImage(
                  imageUrl: images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
