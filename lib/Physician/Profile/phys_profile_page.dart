

import 'package:docs_and_nurs/Physician/Profile/phys_account_profile.dart';
import 'package:docs_and_nurs/Physician/Profile/subscriptions.dart';
import 'package:docs_and_nurs/Screens/Profile/payment_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Helpers/designs.dart';

class PhysicianProfilePage extends StatelessWidget {
  const PhysicianProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 59.h),
          child: Text('Profiler',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: const Color(0xFF0F0F0F),
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 23.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/Frame 10000009422.png',
                  height: 74.h, width: 74.w,
                ),
                SizedBox(width: 22.w,),
                Padding(
                  padding: EdgeInsets.only(top: 17.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Joshua Osazuwa',
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: const Color(0xFF1F1F1F)),),
                      SizedBox(height: 6.h,),
                      Text('joshuaosazuwa@gmail.com',
                        style: TextStyle(fontSize: 15.sp,
                            fontWeight: FontWeight.w400, color: const Color(0xFF767676)),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 31.h,),
          Padding(
            padding: EdgeInsets.only(left: 19.w, top: 15.h, bottom: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){Get.to(()=> const PhysicianAccountProfile());},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/person.svg',
                        height: 22.h, width: 22.w,
                      ),
                      SizedBox(width: 8.w,),
                      Text('Account', style: TextStyle(
                          fontWeight: FontWeight.w400, color: const Color(0xFF1F1F1F), fontSize: 16.sp),)
                    ],
                  ),
                ),
                SizedBox(height: 44.h,),
                GestureDetector(
                  onTap: (){Get.to(()=> const Subscription());},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/moneys.svg',
                        height: 22.h, width: 22.w,
                      ),
                      SizedBox(width: 8.w,),
                      Text('Subscription', style: TextStyle(
                          fontWeight: FontWeight.w400, color: const Color(0xFF1F1F1F), fontSize: 16.sp),)
                    ],
                  ),
                ),
                SizedBox(height: 44.h,),
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/bell.svg',
                        height: 22.h, width: 22.w,
                      ),
                      SizedBox(width: 8.w,),
                      Text('Notification', style: TextStyle(
                          fontWeight: FontWeight.w400, color: const Color(0xFF1F1F1F), fontSize: 16.sp),)
                    ],
                  ),
                ),
                SizedBox(height: 44.h,),
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/password.svg',
                        height: 22.h, width: 22.w,
                      ),
                      SizedBox(width: 8.w,),
                      Text('Change Password', style: TextStyle(
                          fontWeight: FontWeight.w400, color: const Color(0xFF1F1F1F), fontSize: 16.sp),)
                    ],
                  ),
                ),
                SizedBox(height: 44.h,),
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/help.svg',
                        height: 22.h, width: 22.w,
                      ),
                      SizedBox(width: 8.w,),
                      Text('Help', style: TextStyle(
                          fontWeight: FontWeight.w400, color: const Color(0xFF1F1F1F), fontSize: 16.sp),)
                    ],
                  ),
                ),
                SizedBox(height: 34.h,),
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/about.svg',
                        height: 22.h, width: 22.w,
                      ),
                      SizedBox(width: 8.w,),
                      Text('About', style: TextStyle(
                          fontWeight: FontWeight.w400, color: const Color(0xFF1F1F1F), fontSize: 16.sp),)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
