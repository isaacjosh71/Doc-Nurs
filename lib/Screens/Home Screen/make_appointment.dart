
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Screens/Home%20Screen/appointment_successful.dart';
import 'package:docs_and_nurs/services/data/paystack_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';


class MakeAppointment extends StatefulWidget {
  const MakeAppointment({Key? key}) : super(key: key);

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  DateTime _selectedDate = DateTime.now();
  String _selectedPatient = 'Whose this appointment for?';
  List<String> patientList= [
    'Me', 'Third-party'];
  final TextEditingController _commentController = TextEditingController();
  bool buttonIsActive = false;
  int price = 2500;
  String email = 'e@email.com';
  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if(buttonIsActive){
      _onPressed=(){
        MakePayment(ctx: context, email: email, price: price).chargeCard();
        // Get.to(()=> const AppointmentSuccessful());
      };
    }
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
          padding: EdgeInsets.symmetric(horizontal: 49.w),
          child: Text('Make Appointment',
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
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset('assets/images/Frame 1000000947.png',
                      width: 50.w, height: 55.h, fit: BoxFit.cover,),
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
                        Text(email, style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: const Color(0xFFAAAAAA),
                        ),),
                        SizedBox(height: 3.sp,),
                        Text('Hepatologist', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
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
              SizedBox(height: 10.h,),
              Container(
                width: 326.w,
                height: 1.h,
                color: const Color(0xFFEBEBEB),
              ),
              SizedBox(height: 21.h,),
              Text('Physician', style: TextStyle(
                  letterSpacing: 0.33,
                  color: const Color(0xFF1F1F1F),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
              ),),
              SizedBox(
                width: 325.w,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: DropDown(
                        showUnderline: false,
                        isExpanded: true,
                        items: const ["Me", "Third-party"],
                        hint: Text('$_selectedPatient', style: Designs.hintFont,),
                        icon: Icon(Icons.arrow_drop_down_rounded, size: 45.sp, color: Colors.black87,),
                        onChanged: (String? newValue){
                          setState((){
                            _selectedPatient = newValue!;
                          });},)
                  ),
                ),
              ),
              SizedBox(height: 17.h,),
              Container(
                width: 326.w,
                height: 1.h,
                color: const Color(0xFFEBEBEB),
              ),
              SizedBox(height: 21.h,),
              Text('Choose Date', style: TextStyle(
                  letterSpacing: 0.33,
                  color: const Color(0xFF1F1F1F),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
              ),),
              SizedBox(height: 15.h,),
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
              SizedBox(height: 20.h,),
              Container(
                width: 326.w,
                height: 1.h,
                color: const Color(0xFFEBEBEB),
              ),
              SizedBox(height: 20.h,),
              Text('Choose Time', style: TextStyle(
                  letterSpacing: 0.33,
                  color: const Color(0xFF1F1F1F),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
              ),),
              //time range
              SizedBox(height: 20.h,),
              Container(
                width: 326.w,
                height: 1.h,
                color: const Color(0xFFEBEBEB),
              ),
              SizedBox(height: 20.h,),
              Text('Message', style: TextStyle(
                  letterSpacing: 0.33,
                  color: const Color(0xFF767676),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal
              ),),
              TextField(
                controller: _commentController,
                onChanged: (value){
                  setState((){
                    buttonIsActive = value.isNotEmpty?true:false;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Comment (message)',
                    hintStyle: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w400,
                      color: const Color(0xFF767676).withOpacity(0.3),
                    )
                ),
              ),
              SizedBox(height: 20.h,),
              Text('Appointment fees', style: TextStyle(
                  letterSpacing: 0.33,
                  color: const Color(0xFF1F1F1F),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal
              ),),
              SizedBox(height: 11.h,),
              Container(
                width: 327.w, height: 60.h,
                decoration: BoxDecoration(
                    color: Designs.whiteColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), topLeft: Radius.circular(8.r))
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 21.h, bottom: 21.h),
                  child: Text('2500', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp,
                  color: const Color(0xFF373737)), )
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
            child: Container(
              height: 55.h, width: 296.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        buttonIsActive ? Designs.primaryColor : null),
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 49.w, vertical: 17.h)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Designs.whiteColor
                    ),)
                ),
                onPressed: _onPressed,
                child: const Center(child: Text('Make an appointment',),),
              ),
            ),
          )
      ),
    );
  }
}
