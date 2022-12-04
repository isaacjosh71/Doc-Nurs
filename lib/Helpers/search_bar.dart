
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchedBar extends StatelessWidget {
  final Widget child;
  const SearchedBar({Key? key,
    required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 325.w,
      decoration: BoxDecoration(
          color: const Color(0xFFEDEDED),
      borderRadius: BorderRadius.circular(5.r)),
      padding: EdgeInsets.only(left: 12.w),
      child: child,
    );
  }
  }