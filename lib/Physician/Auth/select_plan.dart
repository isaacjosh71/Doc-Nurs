
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../root_page.dart';

class SelectPlan extends StatefulWidget {
  const SelectPlan({Key? key}) : super(key: key);

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {
  bool _select1 = true;
  bool _select2 = true;
  bool _select3 = true;
  bool _select4 = true;

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
          padding: EdgeInsets.symmetric(horizontal: 74.w),
          child: Text('Select Plan',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 0.33,
              color: const Color(0xFF1F1F1F),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Padding(padding:
      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: Column(
            children: [
              Container(
                height: 100.h, width: 314.w,
                decoration: BoxDecoration(
                  color: Designs.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 14.w, top: 13.h, bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Monthly Plan', style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11.sp,
                              color: const Color(0xFF3F8BCA)),),
                          SizedBox(height: 5.h,),
                          Text('N 2,500', style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp,
                              color: const Color(0xFF0F0F0F)),),
                          SizedBox(height: 3.h,),
                          Text('Cancel Anytime', style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10.sp,
                              color: const Color(0xFFAAAAAA)),),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _select1 =!_select1;
                          });
                        },
                        child: Icon(_select1 ? Icons.radio_button_off_rounded
                            : Icons.radio_button_on_rounded,
                            size: 20,color: Designs.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),Container(
                height: 100.h, width: 314.w,
                decoration: BoxDecoration(
                  color: Designs.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 14.w, top: 13.h, bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('3 Month Plan', style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11.sp,
                              color: const Color(0xFF3F8BCA)),),
                          SizedBox(height: 5.h,),
                          Text('N 5,500', style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp,
                              color: const Color(0xFF0F0F0F)),),
                          SizedBox(height: 3.h,),
                          Text('Cancel Anytime', style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10.sp,
                              color: const Color(0xFFAAAAAA)),),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _select2 =!_select2;
                          });
                        },
                        child: Icon(_select2 ? Icons.radio_button_off_rounded
                            : Icons.radio_button_on_rounded,
                            size: 20,color: Designs.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),Container(
                height: 100.h, width: 314.w,
                decoration: BoxDecoration(
                  color: Designs.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 14.w, top: 13.h, bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('6 Month Plan', style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 11.sp,
                                  color: const Color(0xFF3F8BCA)),),
                              SizedBox(width: 10.w,),
                              Container(height: 15.08.h, width: 49.23.w,
                              color: Designs.yellowTheme,
                                child: Center(
                                  child: Text('Required', style: TextStyle(
                                      fontSize: 7.5.sp, fontWeight: FontWeight.w400, color: Designs.whiteColor),),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5.h,),
                          Text('N 12,500', style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp,
                              color: const Color(0xFF0F0F0F)),),
                          SizedBox(height: 3.h,),
                          Text('Cancel Anytime', style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10.sp,
                              color: const Color(0xFFAAAAAA)),),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _select3 =!_select3;
                          });
                        },
                        child: Icon(_select3 ? Icons.radio_button_off_rounded
                            : Icons.radio_button_on_rounded,
                            size: 20,color: Designs.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),Container(
                height: 100.h, width: 314.w,
                decoration: BoxDecoration(
                  color: Designs.whiteColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 14.w, top: 13.h, bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Yearly Plan', style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11.sp,
                              color: const Color(0xFF3F8BCA)),),
                          SizedBox(height: 5.h,),
                          Text('N 25,000', style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp,
                              color: const Color(0xFF0F0F0F)),),
                          SizedBox(height: 3.h,),
                          Text('Cancel Anytime', style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 10.sp,
                              color: const Color(0xFFAAAAAA)),),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _select4 =!_select4;
                          });
                        },
                        child: Icon(_select4 ? Icons.radio_button_off_rounded
                            : Icons.radio_button_on_rounded,
                            size: 20,color: Designs.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 121.h,),
              Align(
                alignment: Alignment.center,
                child: Container(height: 55.h, width: 296.w,
                  decoration: BoxDecoration(
                    color: Designs.primaryColor,
                    borderRadius: BorderRadius.circular(5.r)
                  ),
                  child: Center(
                    child: Text('Make Payment', style: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w500, color: Designs.whiteColor),),
                  ),
                ),
              ),
              SizedBox(height: 14.h,),
              Align(
                alignment: Alignment.center,
                child: TextButton(onPressed: () {
                  Get.to(()=> const PhysicianRootPage());
                },
                  child: Text('Skip for later', style: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w500, color: Designs.primaryColor
                  ),),
                ),
              )
            ],
      ),
      ),
    );
  }
}
