import "package:Symprax/controller/onboarding_controller.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/view/widget/onboarding/customslider.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Onboarding extends StatelessWidget {
  const Onboarding({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.colorScaffoldonboarding,
        body: SafeArea(child: CustomSliderOnBoarding()));
  }
}
