
import 'package:docs_and_nurs/Patient Authentications/forgot_phone_password.dart';
import 'package:docs_and_nurs/Patient Authentications/log_in_email.dart';
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotEmailPassword extends StatefulWidget {
  const ForgotEmailPassword({Key? key}) : super(key: key);

  @override
  State<ForgotEmailPassword> createState() => _ForgotEmailPasswordState();
}

class _ForgotEmailPasswordState extends State<ForgotEmailPassword> {
  final TextEditingController _mailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        leading: GestureDetector(
          onTap: (){
            Get.to(()=> const LogInEmail());
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
                  Text('Enter your linked email address',
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
                      Get.to(()=>const ForgotPhonePassword());
                    },
                    child: Text('Reset with phone number',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email', style: Designs.labelFont,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _mailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                              if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)){
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter Email Address',
                                hintStyle: Designs.hintFont
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(height: 450.h),
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

                },
                child: const Center(child: Text('Reset')),),
            ),
          ],
        ),
      ),
    );
  }
}
