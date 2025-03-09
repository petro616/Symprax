import 'package:Symprax/controller/settings_controller.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/view/widget/cart/firstbackgroundcolor_title.dart';
import 'package:Symprax/view/widget/settings/account_settings_title.dart';
import 'package:Symprax/view/widget/settings/cards_settings.dart';
import 'package:Symprax/view/widget/settings/first_hi_.dart';
import 'package:Symprax/view/widget/settings/firstbackgroundcolor_favourite.dart';
import 'package:Symprax/view/widget/settings/function_change_lang.dart';
import 'package:Symprax/view/widget/settings/white_space_for_elements.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.put(SettingsController());
    return SizedBox(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              FirstbackgroundcolorSettings(
                  color: Color.fromARGB(255, 223, 177, 104)),
              Row(
                children: [
                  Firstbackgroundcolortitle(
                      title: "96".tr, icon: EvaIcons.settings)
                ],
              ),
              WhiteSpaceForElementsSettings(
                  widget: Column(
                children: [
                  FirstHey(),
                  AccountSettingsTitle(),
                  const SizedBox(height: 15),
                  CardsSettings(
                      onTap: () {
                        Get.toNamed(AppRoute.viewadress);
                      },
                      title: "99".tr,
                      icon: Icons.location_on),
                  SizedBox(height: 12.h),
                  CardsSettings(
                      onTap: () {
                        changelanguage(context);
                      },
                      title: "100".tr,
                      icon: Icons.language),
                  SizedBox(height: 12.h),
                  CardsSettings(
                      onTap: () {
                        Get.toNamed(AppRoute.pendingsorders);
                      },
                      title: "101".tr,
                      icon: Icons.fact_check_sharp),
                  SizedBox(height: 12.h),
                  CardsSettings(
                      onTap: () {
                        Get.toNamed(AppRoute.archieveorders);
                      },
                      title: "102".tr,
                      icon: Icons.archive_rounded),
                  SizedBox(height: 12.h),
                  CardsSettings(
                      onTap: () async {
                        await launchUrl(Uri.parse("tel:0939140515"));
                      },
                      title: "103".tr,
                      icon: Icons.call),
                  SizedBox(height: 12.h),
                  CardsSettings(
                      onTap: () {
                        settingsController.logout();
                      },
                      title: "104".tr,
                      icon: Icons.logout)
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
