
import 'package:docs_and_nurs/Patient Authentications/log_in_number.dart';
import 'package:docs_and_nurs/Patient Authentications/log_in_otp.dart';
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Welcome/onboarding.dart';
import 'package:get/get.dart';
import 'forgot_email_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPhonePassword extends StatefulWidget {
  const ForgotPhonePassword({Key? key}) : super(key: key);

  @override
  State<ForgotPhonePassword> createState() => _ForgotPhonePasswordState();
}

class _ForgotPhonePasswordState extends State<ForgotPhonePassword> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
      elevation: 0,
      backgroundColor:Designs.scaffoldTheme,
      leading: GestureDetector(
        onTap: (){
          Get.to(()=>const LogInNumber());
        },
        child: Icon(Icons.arrow_back_ios_new,
          size: 24.sp, color: const Color(0xFF000000),),
      ),
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 49.w),
        child: Text('Forgot Password',
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
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 29.h,
                  ),
                  Text('Enter your linked phone number',
                    style: TextStyle(
                      color: const Color(0xFF767676),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const ForgotEmailPassword());
                    },
                    child: Text('Reset with email',
                      style: TextStyle(
                        color: Designs.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Phone Number', style: Designs.labelFont,),
                                  SizedBox(height: 19.h,),
                                  Row(
                                    children: [
                                      Image.asset('assets/images/Group 1000000731.png',
                                        width: 27.w,height: 20.h,
                                      ),
                                      SizedBox(width: 10.w,),
                                      Text('+234', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400,
                                          color: const Color(0xFF767676)),)
                                    ],
                                  ),
                                  SizedBox(height: 16.h,),
                                  Container(
                                    width: 78.w,
                                    height: 0.3.h,
                                    color: const Color(0xFF898A8D),
                                  ),
                                ],
                              ),
                              SizedBox(width: 2.w,),
                              Padding(
                                padding: EdgeInsets.only(top: 19.h),
                                child: SizedBox(
                                    width: 221.w,
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: _phoneController,
                                      onSaved: (value){},
                                      decoration: InputDecoration(
                                        hintText: 'Enter Phone Number',
                                        hintStyle: Designs.hintFont,
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(height: 444.h),
            Container(
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
                onPressed: () {

                  Get.to(const LogInOtp());
                },
                child: const Center(child: Text('Reset')),),
            ),
          ],
        ),
      ),
    );
  }
}
