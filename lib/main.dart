import 'package:firebase_core/firebase_core.dart';
import 'package:tripzone/controllers/device_controller.dart';
import 'package:tripzone/themes/colors.dart';
import 'package:tripzone/views/screen/blog/blogScreen.dart';
import 'package:tripzone/views/screen/engagement/engagement.dart';
import 'package:tripzone/views/screen/home/homeScreen.dart';
import 'package:tripzone/views/screen/root_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(DeviceController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
    Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent, // navigation bar color
            statusBarColor: Colors.transparent, // status bar color
            statusBarIconBrightness: Brightness.dark, // status bar icons' color
            systemNavigationBarIconBrightness: Brightness.dark,
        ));
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            // translationsKeys: Get.find<AppTranslation>().keys,
            // translations: Get.find<AppTranslation>(),
            // locale: languageController.mLocale,
            title: 'tripzone',
            theme: ThemeData(
                primaryColor: Colors.transparent,
                appBarTheme: AppBarTheme(

                ),
            ),
            home: RootApp(),
        );
    }
}