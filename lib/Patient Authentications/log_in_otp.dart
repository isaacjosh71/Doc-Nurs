
import 'dart:async';

import 'package:docs_and_nurs/Patient Authentications/forgot_phone_password.dart';
import 'package:docs_and_nurs/Screens/root_page.dart';
import 'package:docs_and_nurs/Welcome/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Helpers/designs.dart';
import '../services/auth_services/auth_ctlr.dart';
import '../services/models/otp_model.dart';

class LogInOtp extends StatefulWidget {
  const LogInOtp({Key? key, this.phone}) : super(key: key);
  final dynamic phone;

  @override
  State<LogInOtp> createState() => _LogInOtpState();
}

class _LogInOtpState extends State<LogInOtp> {
  final TextEditingController _code = TextEditingController();
  int start = 60;
  bool wait = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => const ForgotPhonePassword());
          },
          child: Icon(Icons.arrow_back_ios_new,
            size: 24.sp, color: const Color(0xFF000000),),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 49.w),
          child: Text('OTP Verification',
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 29.h,),
                  Text('Enter the 4-digit code sent to:',
                      style: TextStyle(fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF767676))),
                  SizedBox(height: 6.h),
                  Text(widget.phone,
                      style: TextStyle(fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF373737))),
                  SizedBox(height: 51.h),
                  SizedBox(
                    height: 53.h,
                    width: 116.w,
                    child: TextField(
                        controller: _code,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0000',
                          hintStyle: TextStyle(
                            fontSize: 45.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFB4B4B4),
                          ),
                        )),
                  ),
                  SizedBox(height: 211.h,),
                  Text('Didn\'t recieve it?',
                    style: TextStyle(
                        color: const Color(0xFF373737),
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp),),
                  SizedBox(height: 5.h),
                  _text(),
                ],
              ),
            ),
            SizedBox(height: 194.h,),
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
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(
                          Designs.primaryColor),
                      foregroundColor: MaterialStateProperty.all(
                          Designs.whiteColor),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 17.h)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal
                      ),)
                  ),
                  onPressed: (){
                    try {
                      var authController = Get.find<AuthController>();
                      String code = _code.text.trim();
                      String phone = widget.phone;
                      if(code.isEmpty){Get.snackbar('OTP code', 'Please type in otp code');}
                      else{
                        OtpBody otpBody = OtpBody(
                          otpCode: code,
                          phone: phone,
                        );
                        authController.verifyCode(otpBody).then((status){
                          if(!status.isError){
                            print('successful registration');
                            Get.to(()=> const RootPage());
                          } else{Get.snackbar('Error', 'Error');}
                        });}
                    }
                    catch(e){
                      final snackBar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Center(child: Text('Log In')),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    const onSec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onSec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget _text() {
    return wait ? InkWell(
      onTap: () {
        startTimer();
        setState(() {
          start = 60;
          wait = true;
        });
      },
      child: Text('Request new code',
          style: TextStyle(color: Designs.primaryColor,
              fontSize: 15.sp
          )
      ),
    )
        :
    RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: 'Request new code in',
                  style: TextStyle(color: const Color(0xFF767676),
                      fontSize: 15.sp
                  )),
              TextSpan(
                  text: ' 00:$start',
                  style: TextStyle(color: const Color(0xFF767676),
                      fontSize: 15.sp
                  )),
            ]
        ));
  }
}