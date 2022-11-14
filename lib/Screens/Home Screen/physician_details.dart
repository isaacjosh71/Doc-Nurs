
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Screens/Home%20Screen/make_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PhysicianDetails extends StatefulWidget {
  const PhysicianDetails({Key? key, this.id}) : super(key: key);
  final dynamic id;

  @override
  State<PhysicianDetails> createState() => _PhysicianDetailsState();
}

class _PhysicianDetailsState extends State<PhysicianDetails> {
  DateTime _selectedDate = DateTime.now();
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
          padding: EdgeInsets.symmetric(horizontal: 59.w),
          child: Text('Physician Details',
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
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(widget.id['img'],
                      width: 45.w, height: 45.h, fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.id['name'], style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: const Color(0xFF0F0F0F),
                        ),),
                        SizedBox(height: 3.sp,),
                        Text(widget.id['job'], style: TextStyle(
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
                            Text(widget.id['rating'],
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
                            Text(widget.id['distance'],
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
              SizedBox(height: 10.h,),
              Container(
                width: 326.w,
                height: 1.h,
                color: const Color(0xFFEBEBEB),
              ),
              SizedBox(height: 10.h,),
              Text('Profile', style: TextStyle(
                  letterSpacing: 0.33,
                  color: const Color(0xFF1F1F1F),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
              ),),
              SizedBox(height: 10.h,),
              RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Dr. Ellen Omorogbe, is a Gynecologist. He practices at RSIA Bina Medika Bintaro. The medical services that he can provide include : Consultation ...',
                            style: TextStyle(color: const Color(0xFF767676),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400
                            )),
                        TextSpan(
                            text: ' Read More',
                            style: TextStyle(color: Designs.primaryColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400
                            )),
                      ]
                  )),
              SizedBox(height: 10.h,),
              Container(
                width: 326.w,
                height: 1.h,
                color: const Color(0xFFEBEBEB),
              ),
              SizedBox(height: 10.h,),
              Text('Schedule', style: TextStyle(
                letterSpacing: 0.33,
                  color: const Color(0xFF1F1F1F),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
              ),),
              SizedBox(height: 10.h,),
              DatePicker(
                DateTime.now(),
                width: 50.w,
                initialSelectedDate: DateTime.now(),
                selectionColor: Designs.primaryColor,
                selectedTextColor: Colors.white,
                dateTextStyle:  TextStyle(color: const Color(0xFF1F1F1F).withOpacity(0.7)),
                dayTextStyle: TextStyle(color: const Color(0xFF1F1F1F).withOpacity(0.7)),
                monthTextStyle: TextStyle(color: const Color(0xFF1F1F1F).withOpacity(0.7)),
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });},
              ),
              SizedBox(height: 10.h,),
              Container(
                width: 326.w,
                height: 1.h,
                color: const Color(0xFFEBEBEB),
              ),
              SizedBox(height: 10.h,),
              Container(
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
              SizedBox(height: 10.h,),
              Container(
                width: 326.w,
                height: 1.h,
                color: const Color(0xFFEBEBEB),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Reviews', style: TextStyle(
                      letterSpacing: 0.33,
                      color: const Color(0xFF1F1F1F),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal
                  ),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('4.5(382)', style: TextStyle(color: const Color(0xFF1F1F1F),
                      fontSize: 13.sp, fontWeight: FontWeight.w300),),
                      SizedBox(width: 5.w,),
                      Icon(Ionicons.ios_heart, size: 12.sp, color: const Color(0xFFF1C644),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h,),
              Container(
                width: 327.w,
                decoration: BoxDecoration(
                    color: Designs.whiteColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), topLeft: Radius.circular(8.r))
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w,right: 16.w, top: 22.h),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.only(bottom: 13.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Cynthia', style: TextStyle(fontWeight: FontWeight.w500,
                                  color: const Color(0xFF0F0F0F), fontSize: 14.sp),),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('4.5', style: TextStyle(color: const Color(0xFF1F1F1F),
                                          fontSize: 13.sp, fontWeight: FontWeight.w300),),
                                      SizedBox(width: 5.w,),
                                      Icon(Ionicons.ios_heart, size: 12.sp, color: const Color(0xFFF1C644),),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              Text('2 days ago', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400,
                              color: const Color(0xFFAAAAAA)),),
                              SizedBox(height: 7.h,),
                              Text('I feel very comfortable with doctor Ellen', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400,
                              color: const Color(0xFF373737)),),
                              SizedBox(height: 13.h,),
                              Container(
                                width: 295.w,
                                height: 1.h,
                                color: const Color(0xFFEBEBEB),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 101.h, width: 375.w,
        color: Designs.scaffoldTheme,
        child: Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: (){Get.to(()=> const MakeAppointment());},
            child: Container(
              height: 55.h, width: 296.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r),
                color: Designs.primaryColor,),
              child: Center(child: Text('Make an appointment', style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16.sp, color: Designs.whiteColor
              ),),),
            ),
          ),
        )
      ),
    );
  }
}
