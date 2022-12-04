
import 'package:docs_and_nurs/services/data/app_urls.dart';
import 'package:docs_and_nurs/Screens/root_page.dart';
import 'package:flutter/material.dart';
import 'package:docs_and_nurs/Welcome/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:docs_and_nurs/services/data/dependencies.dart' as dep;
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString(APPURLS.TOKEN);
  print('main user token: $token');
  runApp(MyApp(token: token ?? ''));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.token}) : super(key: key);
  final String token;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Rubik',
          ),
          home:
          // token == '' ? const Splash() :
          const RootPage(),
        );
      },
    );
  }
}
