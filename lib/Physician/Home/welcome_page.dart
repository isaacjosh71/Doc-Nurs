
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../Helpers/rated_pre_list.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66.h),
        child: AppBar(
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.5.w),
              child: GestureDetector(
                  onTap: (){},
                  child: SvgPicture.asset('assets/svg/notification-bing.svg',
                    height: 38.h, width: 32.w,)),
            )
          ],
          backgroundColor: Designs.scaffoldTheme,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.w, top: 9.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset('assets/images/Frame 1000000940.png',
                      height: 45.h, width: 45.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.w,),
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome Back',
                        style: TextStyle(fontSize: 10.sp,
                            color: const Color(0xFFAAAAAA), fontWeight: FontWeight.w400),),
                      SizedBox(height: 5.h,),
                      Text('Dr. Ellen Omorogbe', style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF0F0F0F),
                          fontSize: 15.sp
                      ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Upcoming appointment',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: const Color(0xFF1F1F1F)),),
                TextButton(onPressed: (){}, child:
                Text('View all',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: Designs.primaryColor),),
                )
              ],
            ),
            SizedBox(height: 5.h,),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Container(
                        height: 136.h,
                        width: 327.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Designs.primaryColor
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 18.w, right: 15.w, top: 23.h),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12.r),
                                        child: Image.asset('assets/images/Frame 1000000947.png',
                                          height: 40.h, width: 40.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 9.h,),
                                      Padding(
                                        padding: EdgeInsets.only(top: 4.h),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Mary Dangote',
                                              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFFEBEBEB)),),
                                            SizedBox(height: 2.h,),
                                            Text('Pharmacist',
                                              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400, color: const Color(0xFFE0E0E0)),),
                                          ],),
                                      ),
                                    ],),
                                  SvgPicture.asset('assets/svg/message-circle.svg',
                                    height: 32.h, width: 32.w,)
                                ],
                              ),
                            ),
                            SizedBox(height: 17.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 15.w,),
                              child: Container(
                                height: 40.h, width: 295.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: const Color(0xFF1A69AB),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 24.w, right: 21.w, top: 12.h, bottom: 12.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Ionicons.ios_calendar,
                                            size: 13.sp, color: const Color(0xFFDEDEDE),),
                                          SizedBox(width: 8.w,),
                                          Text('Mon, Jun 1, 22', style: TextStyle(color: const Color(0xFFE0E0E0),
                                              fontSize: 11.sp, fontWeight: FontWeight.w400),),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Ionicons.ios_time,
                                            size: 13.sp, color: const Color(0xFFDEDEDE),),
                                          SizedBox(width: 8.w,),
                                          Text('8:00AM-9:00AM', style: TextStyle(color: const Color(0xFFE0E0E0),
                                              fontSize: 11.sp, fontWeight: FontWeight.w400),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        //(For no appointment notice)
                        // child: Padding(
                        //   padding: EdgeInsets.only(top: 89.h, bottom: 24.h),
                        //   child: Center(
                        //     child: Text('No appointment yet',style: TextStyle(
                        //       color: const Color(0xFFAAAAAA),
                        //       fontWeight: FontWeight.w400, fontSize: 15.sp
                        //     ),),
                        //   ),
                        // ),
                      ),
                      SizedBox(height: 15.h,)
                    ],
                  );
                }),
          ],
        ),
        ),
      ),
    );
  }
}
