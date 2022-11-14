import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Designs {
  static const primaryColor = Color(0xFF3F8BCA);
  static const whiteColor = Color(0xFFFFFFFF);
  static const yellowTheme = Color(0xFFEE8322);
  static const scaffoldTheme = Color(0xFFF5F5F5);

  static TextStyle bigFont = TextStyle(
      color: const Color(0xFF000000),
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
  );
  static TextStyle smallFont = TextStyle(
      color: const Color(0xFF959AA2),
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal
  );
  static TextStyle normalFont = TextStyle(
      color: const Color(0xFF1F1F1F),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
  );
  static TextStyle labelFont = TextStyle(
      color: const Color(0xFF767676),
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal
  );static TextStyle hintFont = TextStyle(
      color: const Color(0xFF1F1F1F).withOpacity(0.3),
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal
  );
}
