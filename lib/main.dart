import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vehicle_task/pages/splash/splash_bindings.dart';

import 'api_service/dio_client.dart';
import 'common/constants/color_constants.dart';
import 'routes/app_pages.dart';

void main(main) {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MyApp());
}

initServices() async {
  await Get.putAsync<DioClient>(() => DioClient().init());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ColorConstants.blackColor,
        systemNavigationBarDividerColor: ColorConstants.greyBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: ColorConstants.primaryColor,
        colorScheme: const ColorScheme.highContrastLight(
          primary: ColorConstants.primaryColor,
        ),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        focusColor: ColorConstants.whiteColor,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBindings(),
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
    );
  }
}
