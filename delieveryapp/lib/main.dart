import 'package:DelieveryApp/binding/initialbinding.dart';
import 'package:DelieveryApp/core/localization/changelocal.dart';
import 'package:DelieveryApp/core/localization/translation.dart';
import 'package:DelieveryApp/core/services/servisess.dart';
import 'package:DelieveryApp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            translations: Mytranslation(),
            locale: controller.language,
            debugShowCheckedModeBanner: false,
            theme: controller.apptheme,
            initialRoute: "/",
            getPages: routes,
            initialBinding: Initialbindings(),
          );
        });
  }
}
