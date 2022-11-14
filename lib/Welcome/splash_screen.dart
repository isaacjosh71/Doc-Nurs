

import 'dart:async';
import 'package:docs_and_nurs/Welcome/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(
                builder: (context)=>const OnBoardingScreen()
            )));
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: const Color(0xFF3F8BCA),
          body:
          Padding(
            padding: EdgeInsets.only(left: 99.w, right: 98.8.w, top: 250.h, bottom: 372.5.h),
            child:
                  Image.asset('assets/images/Group 1000000726.png',
                    height: 189.h,
                    width: 177.w,
                  ),
            )
        );
  }
}

