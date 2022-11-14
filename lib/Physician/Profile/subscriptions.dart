
import 'package:docs_and_nurs/Physician/Auth/select_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Helpers/designs.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new,
            size: 24.sp, color: const Color(0xFF000000),),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 69.w),
          child: Text('Subscription',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1F1F1F),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 17.h),
              child: Container(
                height: 266.h, width: 314.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Designs.whiteColor,),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 26.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Details',
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500,
                              color: const Color(0xFF0F0F0F)),),
                          SizedBox(height: 27.h,),
                          Text('Plan',
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400,
                                color: const Color(0xFF767676)),),
                          SizedBox(height: 7.h,),
                          Text('One Month plan',
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,
                                color: const Color(0xFF737373)),),
                          SizedBox(height: 13.h,),
                          Text('Billing Amount',
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400,
                                color: const Color(0xFF767676)),),
                          SizedBox(height: 7.h,),
                          Text('N 3,500',
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,
                                color: const Color(0xFF737373)),),
                          SizedBox(height: 13.h,),
                          Text('Next Payment Date',
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400,
                                color: const Color(0xFF767676)),),
                          SizedBox(height: 7.h,),
                          Text('April 21st, 2022',
                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,
                                color: const Color(0xFF737373)),),
                        ],
                      ),
                      Container(
                        height: 28.h, width: 114.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: Designs.yellowTheme,),
                        child: Center(child: Text('Active Subscription',
                        style: TextStyle(color: Designs.whiteColor,
                            fontWeight: FontWeight.w400, fontSize: 10.sp),),),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 299.h,),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){Get.to(()=> const SelectPlan());},
                child: Container(
                  height: 55.h, width: 296.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Designs.primaryColor),
                  child: Center(child: Text('Change Subscription', style: TextStyle(
                    fontSize: 15.sp, fontWeight: FontWeight.w500, color: Designs.whiteColor
                  ),),),
                ),
              ),
            ),
            SizedBox(height: 5.h,),
            Align(alignment: Alignment.center,
            child: TextButton(onPressed: () {},
            child: Text("Cancel Plan", style: TextStyle(color: const Color(0xFFFF6262),
            fontWeight: FontWeight.w500, fontSize: 16.sp),),),
            )
          ],
        ),
      ),
    );
  }
}
