
import 'package:docs_and_nurs/Screens/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Helpers/designs.dart';

class AppointmentSuccessful extends StatelessWidget {
  const AppointmentSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM').format(now);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 163.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 91.w),
            child: SvgPicture.asset('assets/svg/Appointment Booked.svg',
            width: 193.w, height: 72.h,
            ),
          ),
          SizedBox(height: 17.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 61.w),
            child: Column(
              children: [
                Text('Your appointment has been',style: TextStyle(
                    color: const Color(0xFF767676),
                        fontSize: 15.sp, letterSpacing: -0.33.sp,
                        fontWeight: FontWeight.w400
                ),),
                SizedBox(height: 1.sp,),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: ' scheduled for ',
                              style: TextStyle(color: const Color(0xFF767676),
                                  fontSize: 15.sp, letterSpacing: -0.33.sp,
                                  fontWeight: FontWeight.w400
                              )),

                          TextSpan(
                              text: formattedDate,
                              style: TextStyle(color: const Color(0xFF1F1F1F),
                                  fontSize: 15.sp,letterSpacing: -0.33.sp,
                                  fontWeight: FontWeight.w600
                              )),

                        ]
                    )),
              ],
            ),
          ),
          SizedBox(height: 79.h,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset('assets/images/Frame 1000000947.png',
                      width: 45.w, height: 45.h, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dr.Ellen Omorogbe', style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: const Color(0xFF0F0F0F),
                        ),),
                        SizedBox(height: 3.sp,),
                        Text('Hepatologist', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: const Color(0xFFAAAAAA),
                        ),),
                      ],
                    ),),
                  SizedBox(width: 17.w,),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('4.5',
                              style: TextStyle(fontSize: 12.sp,
                                  color: const Color(0xFFAAAAAA), fontWeight: FontWeight.w400),),
                            SizedBox(width: 2.w,),
                            Icon(Ionicons.ios_heart,
                                size: 12.sp, color: const Color(0xFFF1C644)),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('3km away',
                              style: TextStyle(fontSize: 12.sp,
                                  color: const Color(0xFFAAAAAA), fontWeight: FontWeight.w400),),
                            SizedBox(width: 2.w,),
                            Icon(Icons.percent_rounded,
                                size: 12.sp, color: Designs.primaryColor),
                          ],
                        ),
                      ]
                  )
                ],
              ),
              SizedBox(height: 15.h,),
              InkWell(
                onTap: (){},
                child: Container(
                  width: 327.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Designs.whiteColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 20.h),
                        child: Text('Chat with physician', style: TextStyle(fontSize: 16.sp,
                            fontWeight: FontWeight.w400, color: const Color(0xFF373737)),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.h),
                        child: SvgPicture.asset('assets/svg/message-physician.svg',
                          height: 40.h, width: 40.w,),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              InkWell(
                onTap: (){},
                child: Container(
                  height: 60.h, width: 327.w,
                  decoration: BoxDecoration(
                    color: Designs.whiteColor,
                    borderRadius: BorderRadius.circular(7.r),),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Get Location', style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: const Color(0xFF373737)),),
                        SvgPicture.asset('assets/svg/map.svg',
                          height: 40.h, width: 40.w,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 155.h,),

            ],
          ),

          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
              ),
              height: 55.h,
              width: 296.w,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Designs.primaryColor),
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 49.w, vertical: 17.h)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal
                    ),)
                ),
                onPressed: (){
                  Get.off(()=> const RootPage());
                },
                child: const Center(child: Text('Ok')),),
            ),
          ),
        ],
      ),
    );
  }
}
