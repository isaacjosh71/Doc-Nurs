
import 'dart:convert';

import 'package:docs_and_nurs/Patient Authentications/forgot_phone_password.dart';
import 'package:docs_and_nurs/Patient Authentications/log_in_otp.dart';
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Welcome/onboarding.dart';
import 'package:docs_and_nurs/services/models/loginphone_model.dart';
import 'package:docs_and_nurs/services/network_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/network_handle.dart';
import 'log_in_email.dart';
import '../Screens/root_page.dart';
import '../services/auth_services/auth_ctlr.dart';

class LogInNumber extends StatefulWidget {
  const LogInNumber({Key? key}) : super(key: key);

  @override
  State<LogInNumber> createState() => _LogInNumberState();
}

class _LogInNumberState extends State<LogInNumber> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController= TextEditingController();
  bool _obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  NetworkHandle networkHandle = NetworkHandle();
  dynamic accessToken;
  @override
  Widget build(BuildContext context) {
    // void _loginNumber(AuthController authControl){
    //   try {
    //     String phone = _phoneController.text.trim();
    //     String password = _passController.text.trim();
    //
    //     if(phone.isEmpty || !GetUtils.isPhoneNumber(phone)){
    //       Get.snackbar('Email', 'Please type in a valid phone');}
    //     else if(password.length < 6){
    //       Get.snackbar('Password', 'Password can\'t be less than 6 characters');}
    //     else{
    //       PhoneBody phoneBody = PhoneBody(
    //         phone: phone,
    //         password: password,
    //       );
    //       authControl.loginPhone(phoneBody).then((status){
    //         if(!status.isError){
    //           print('successful registration');
    //           Get.to(()=> const RootPage());
    //         } else{Get.snackbar('Error', 'Wrong Authentication');}
    //       });
    //     }
    //   }
    //   catch(e){
    //     final snackBar = SnackBar(content: Text(e.toString()));
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   }
    // }

    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        leading: GestureDetector(
          onTap: (){
            Get.to(()=> const OnBoardingScreen());
          },
          child: Icon(Icons.arrow_back_ios_new,
            size: 24.sp, color: const Color(0xFF000000),),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 90.w),
          child: Text('Log In',
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
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone Number', style: Designs.labelFont,),
                                    SizedBox(height: 18.h,),
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
                                      height: 0.4.h,
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
                            SizedBox(height: 7.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 191.w),
                              child: TextButton(onPressed: () {
                                Get.to(()=>const LogInEmail());
                              },
                                child: Text('Login with email',
                                  style: TextStyle(color: Designs.primaryColor,
                                      fontSize: 15.sp, fontWeight: FontWeight.w400),),),
                            ),
                            SizedBox(height: 20.h,),
                            Text('Password',style: Designs.labelFont,),
                            TextFormField(
                              controller: _passController,
                              obscureText: _obscureText,
                              onSaved: (value){},
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
                                hintStyle: Designs.hintFont,
                                suffixIcon:GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _obscureText =!_obscureText;
                                    });
                                  },
                                  child: Icon(_obscureText ? Icons.visibility_off
                                      : Icons.visibility,
                                      size: 20,color: const Color(0xFFB4B4B4)),
                                ),
                              ),
                            ),
                            SizedBox(height: 7.h,),
                            Padding(
                              padding: EdgeInsets.only(left: 180.w),
                              child: TextButton(onPressed: () {
                                Get.to(()=>const ForgotPhonePassword());
                              },
                                child: Text('Forgot Password?',
                                  style: TextStyle(color: const Color(0xFFEE8322),
                                      fontSize: 15.sp, fontWeight: FontWeight.w400),),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(height: 317.h),
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
                      var authController = Get.find<AuthController>();
                      String phone = _phoneController.text.trim();
                      String password = _passController.text.trim();
                      if(phone.isEmpty || !GetUtils.isPhoneNumber(phone)){
                        Get.snackbar('Email', 'Please type in a valid phone');}
                      else if(password.length < 6){
                        Get.snackbar('Password', 'Password can\'t be less than 6 characters');}
                      else{
                        PhoneBody phoneBody = PhoneBody(
                          phone: phone,
                          password: password,
                        );
                        // authController.loginPhone(phoneBody).then((status){
                        //   if(!status.isError){
                            print('successful registration');
                            Get.offAll(()=> const RootPage());
                        //   } else{Get.snackbar('Error', 'Wrong Authentication');}
                        // });
                      }
                    // catch(e){
                    //   final snackBar = SnackBar(content: Text(e.toString()));
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // }
                    // try {
                    //   String phone = _phoneController.text.trim();
                    //   String password = _passController.text.trim();
                    //   //validate
                    //   if(phone.isEmpty || !GetUtils.isPhoneNumber(phone)){
                    //     Get.snackbar('Email', 'Please type in a valid phone');}
                    //   else if(password.length < 6){
                    //     Get.snackbar('Password', 'Password can\'t be less than 6 characters');}
                    //   else{
                    //     Map<String, String>data = {
                    //       "phone_number":phone,
                    //       "password":password,
                    //     };
                    //     print(data);
                    //     var response = await networkHandle.post("/patient/login/phone-number", data);
                    //     if(response.statusCode==200 || response.statusCode==201){
                    //       Map<String, dynamic> output = json.decode(response.body);
                    //       print(output['data']['access_token']);
                    //       // _saveUserToken(output['data']['access_token']);
                    //       // await storage.write(key: 'token', value: output['data'].toString());
                    //       // Get.offAll(()=> const RootPage());
                    //     } else{
                    //       Get.snackbar('Error', 'Wrong number or password');
                    //     }
                    //     //     .then((status){
                    //     //   if(!status.isError){
                    //     //     print('Successful Registration');
                    //     //     Get.offAll(()=> const RootPage());
                    //     //   } else{
                    //     //     Get.snackbar('Error', 'Wrong number or password');
                    //     //   }
                    //     // });
                    //   }
                    // }
                    // catch(e){
                    //   final snackBar = SnackBar(content: Text(e.toString()));
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // }
                  },


                  child: const Center(child: Text('Log In')),),
              ),
            ],
          ),
        )
    );
      }

  // _saveUserToken(dynamic accessToken) async{
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('access_token', accessToken);
  //   print('save token $accessToken');
  // }
  }

