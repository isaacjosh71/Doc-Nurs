import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Screens/Events/give_reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PastDetails extends StatefulWidget {
  const PastDetails({Key? key, this.id}) : super(key: key);
  final dynamic id;

  @override
  State<PastDetails> createState() => _PastDetailsState();
}

class _PastDetailsState extends State<PastDetails> {
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
          padding: EdgeInsets.symmetric(horizontal: 89.w),
          child: Text('Details',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 48.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h,),
              Container(
                height: 79.h, width: 327.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0EEFA),
                  borderRadius: BorderRadius.circular(6.r),),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/calendar2.svg',
                                  height: 16.h, width: 16.w,),
                                SizedBox(width: 5.w,),
                                Text(widget.id['date'], style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp,
                                    color: const Color(0xFF1F1F1F)),)
                              ],
                            ),
                            SizedBox(height: 12.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/svg/clock.svg',
                                  height: 16.h, width: 16.w,),
                                SizedBox(width: 5.w,),
                                Text(widget.id['time'], style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp,
                                    color: const Color(0xFF1F1F1F)),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 37.h, width: 86.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFAAAAAA), borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Center(
                          child: Text('Done', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,
                              color: Designs.whiteColor),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Physician info.', style: Designs.normalFont,),
                  TextButton(onPressed: (){}, child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('View profile',
                        style: TextStyle(color: Designs.primaryColor,fontSize: 14.sp, fontWeight: FontWeight.w400),),
                      SizedBox(width: 10.w,),
                      Icon(Icons.arrow_forward_ios, size: 12.sp, color: Designs.primaryColor,)
                    ],
                  ))
                ],
              ),
              SizedBox(height: 10.h,),
              Container(
                height: 194.h, width: 327.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: const Color(0xFFE9E7E7), width: 1.w,)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 20.h, bottom: 10.h),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(widget.id['img'],
                                  height: 52.h, width: 52.w, fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10.w,),
                              Padding(
                                padding: EdgeInsets.only(top: 4.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.id['name'],
                                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: const Color(0xFF0F0F0F)),),
                                    SizedBox(height: 3.h,),
                                    Text(widget.id['job'],
                                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400, color: const Color(0xFFAAAAAA)),),
                                  ],),
                              ),
                            ],
                          ),
                          SvgPicture.asset('assets/svg/upcomingMessages.svg',
                            height: 40.h,width: 40.w,)
                        ],
                      ),
                    ),
                    Container(height: 1.h, width: 327.w, color: const Color(0xFFEBEBEB),),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 10.h, bottom: 10.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Phone', style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: const Color(0xFFAAAAAA),
                                  ),),
                                  SizedBox(height: 4.sp,),
                                  Text("08229110***", style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: const Color(0xFF1F1F1F),
                                  ),),
                                ],
                              ),
                              SvgPicture.asset('assets/svg/call-calling.svg',
                                height: 24.h, width: 24.w,
                              ),
                            ],
                          ),
                          SizedBox(height: 11.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email', style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: const Color(0xFFAAAAAA),
                                  ),),
                                  SizedBox(height: 4.sp,),
                                  Text('email@gmail.com', style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: const Color(0xFF1F1F1F),
                                  ),),
                                ],
                              ),
                              SvgPicture.asset('assets/svg/sms.svg',
                                height: 24.h, width: 24.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Text('Physician info.',
                style: TextStyle(fontSize: 16.sp,
                    fontWeight: FontWeight.w500, color: const Color(0xFF1F1F1F)),),
              SizedBox(height: 10.h,),
              Container(
                height: 172.h, width: 327.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: const Color(0xFFE9E7E7), width: 1.w,)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 10.h, bottom: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Type', style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400, color:const Color(0xFFAAAAAA)),),
                            SizedBox(height: 4.h,),
                            Text('Third Party', style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500, color:const Color(0xFF1F1F1F)),)
                          ],
                        )),
                    Container(height: 1.h, width: 327.w, color: const Color(0xFFEBEBEB),),
                    Padding(
                        padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 10.h, bottom: 10.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name', style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400, color:const Color(0xFFAAAAAA)),),
                            SizedBox(height: 4.h,),
                            Text('Jason Moha', style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500, color:const Color(0xFF1F1F1F)),)
                          ],
                        )
                    ),
                    Container(height: 1.h, width: 327.w, color: const Color(0xFFEBEBEB),),
                    Padding(
                        padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 10.h, bottom: 5.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Relationship', style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400, color:const Color(0xFFAAAAAA)),),
                            SizedBox(height: 4.h,),
                            Text('Family', style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500, color:const Color(0xFF1F1F1F)),)
                          ],
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h,),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){Get.to(()=> const GiveReviews());},
                  child: Container(
                    height: 55.h, width: 296.w,
                    decoration:  BoxDecoration(
                      color: Designs.yellowTheme,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Center(child: Text('Give Your Reviews',
                      style: TextStyle(color: Designs.whiteColor, fontSize: 16.sp, fontWeight: FontWeight.w500),),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
