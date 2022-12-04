

import 'dart:async';
import 'package:docs_and_nurs/Patient Authentications/complete_registration.dart';
import 'package:docs_and_nurs/Patient Authentications/create_patient_account.dart';
import 'package:docs_and_nurs/Screens/root_page.dart';
import 'package:docs_and_nurs/services/models/otp_model.dart';
import 'package:docs_and_nurs/services/network_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Helpers/designs.dart';
import '../services/auth_services/auth_ctlr.dart';

class SignUpOtp extends StatefulWidget {
  const SignUpOtp({Key? key, this.phoneNo}) : super(key: key);
  final dynamic phoneNo;

  @override
  State<SignUpOtp> createState() => _SignUpOtpState();
}

class _SignUpOtpState extends State<SignUpOtp> {
  final TextEditingController _code = TextEditingController();
  NetworkHandler networkHandler = NetworkHandler();
  int start = 60;
  bool wait = false;
  bool request = false;

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
          onTap: (){
            Get.to(()=> const CreateAccount());
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
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: const Color(0xFF767676))),
                  SizedBox(height: 6.h),
                  Text(widget.phoneNo,
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: const Color(0xFF373737))),
                  SizedBox(height: 51.h),
                  SizedBox(
                    height: 53.h,
                    width: 116.w,
                    child: TextField(
                      style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 45.sp, color: const Color(0xFF373737),),
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
                        color: const Color(0xFF373737), fontWeight: FontWeight.w300, fontSize: 12.sp),),
                  SizedBox(height: 5.h),
                  _text(),
                ],
              ),
            ),
            SizedBox(height: 184.h,),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                height: 55.h,
                width: 296.w,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Designs.primaryColor),
                      foregroundColor: MaterialStateProperty.all(Designs.whiteColor),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 17.h)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal
                      ),)
                  ),
                  onPressed: () async{
                    try {
                      var authController = Get.find<AuthController>();
                      String code = _code.text.trim();
                      String phone = widget.phoneNo;
                      if(code.isEmpty){Get.snackbar('OTP code', 'Please type in otp code');}
                      else{
                        OtpBody otpBody =OtpBody(
                            phone: phone,
                            otpCode: code);
                        print(otpBody);
                        // authController.verifyCode(otpBody).then((status){
                          // if(!status.isError){
                          //   print('successful registration');
                            Get.to(()=> const CompleteRegistration());
                          // } else{Get.snackbar('Error', status.message);}
                        // });
                    }
                    }
                    catch(e){
                      final snackBar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Center(child: Text('Complete Registration')),),
              ),
            ),
          ],
        ),
      )
    );
  }
  void startTimer (){
    const onSec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onSec, (timer){
      if (start == 0){
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
  Widget _text(){
    return wait ? InkWell(
      onTap: (){
        startTimer();
        setState(() {
          start= 60;
          wait= true;
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
