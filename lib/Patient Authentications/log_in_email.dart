
import 'package:docs_and_nurs/Patient Authentications/forgot_email_password.dart';
import 'package:docs_and_nurs/Patient Authentications/log_in_number.dart';
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Screens/root_page.dart';
import 'package:docs_and_nurs/Welcome/onboarding.dart';
import 'package:docs_and_nurs/services/models/logInEmail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../services/auth_services/auth_ctlr.dart';

class LogInEmail extends StatefulWidget {
  const LogInEmail({Key? key}) : super(key: key);

  @override
  State<LogInEmail> createState() => _LogInEmailState();
}

class _LogInEmailState extends State<LogInEmail> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController= TextEditingController();
  bool _obscureText = true;
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
            Navigator.pop(context, MaterialPageRoute(
                builder: (builder)=> const OnBoardingScreen()));
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
                    height: 24.h,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email',style: Designs.labelFont,),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _mailController,
                            onSaved: (value){},
                            decoration: InputDecoration(
                                hintText: 'Enter Email',
                                hintStyle: Designs.hintFont,
                            ),
                          ),
                          SizedBox(height: 7.h,),
                          Padding(
                            padding: EdgeInsets.only(left: 128.w),
                            child: TextButton(onPressed: () {
                              Get.to(const LogInNumber());
                            },
                              child: Text('Login with phone number',
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
                              Get.to(const ForgotEmailPassword());
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
            SizedBox(height: 325.h),
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
                onPressed: () async {
                  try {
                    var authController = Get.find<AuthController>();
                    String mail = _mailController.text.trim();
                    String password = _passController.text.trim();
                    //validate
                    if(mail.isEmpty || !GetUtils.isEmail(mail)){
                      Get.snackbar('Email', 'Please type in a valid email');}
                    else if(password.length < 6){
                      Get.snackbar('Password', 'Password can\'t be less than 6 characters');}
                    else {
                      EmailBody emailBody = EmailBody(
                        email: mail,
                        password: password,
                      );
                      print(emailBody);
                      // authController.loginEmail(emailBody).then((status){
                      //   if(!status.isError){
                          print('successful registration');
                          Get.offAll(()=> const RootPage());
                      //   } else{Get.snackbar('Error', 'Wrong Authentication');}
                      // });
                    }
                    }
                  catch(e){
                    final snackBar = SnackBar(content: Text(e.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Center(child: Text('Log In')),),
            ),
          ],
        ),
      ),
    );
  }
}
