import 'dart:convert';
import 'package:docs_and_nurs/Patient Authentications/create_account_option.dart';
import 'package:docs_and_nurs/Patient Authentications/sign_up_otp.dart';
import 'package:docs_and_nurs/Screens/root_page.dart';
import 'package:docs_and_nurs/services/auth_services/auth_ctlr.dart';
import 'package:docs_and_nurs/services/models/otp_model.dart';
import 'package:docs_and_nurs/services/models/sign_up_body_model.dart';
import 'package:docs_and_nurs/services/network_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Helpers/designs.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _obscureText = true; bool _reObscureText = true;
  bool buttonIsActive = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if(buttonIsActive){
      _onPressed=() async{
        try {
          var authController = Get.find<AuthController>();
          String name = _nameController.text.trim();
          String phone = _phoneController.text.trim();
          String mail = _mailController.text.trim();
          String password = _passController.text.trim();
          String passwordConfirm = _passConfirmController.text.trim();

          if(name.isEmpty){Get.snackbar('Name', 'Please type in your name');}
          else if(phone.isEmpty || !GetUtils.isPhoneNumber(phone)) {
            Get.snackbar('Phone', 'Please type in a valid phone number');}
          else if(mail.isEmpty || !GetUtils.isEmail(mail)){
            Get.snackbar('Email', 'Please type in a valid email');}
          else if(password.length < 6){
            Get.snackbar('Password', 'Password can\'t be less than 6 characters');}
          else if(password != passwordConfirm){
            Get.snackbar('Password Confirmation', 'Password does not match');}
          else{
            SignUpBody signUpBody = SignUpBody(name: name, phone: phone, mail: mail, password: password, passwordConfirmation: passwordConfirm);
            print(signUpBody);
            // authController.registration(signUpBody).then((status){
              // if(!status.isError){
              //   print('successful registration');
                Get.offAll(()=> SignUpOtp(phoneNo: phone,));
              // } else{Get.snackbar('Error', 'Wrong Authentication');}
            // });
          }
        }
        catch(e){
          final snackBar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      };
    }
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        leading: GestureDetector(
          onTap: (){
            Get.to(()=> const CreateAccountOption());
          },
          child: Icon(Icons.arrow_back_ios_new,
            size: 24.sp, color: const Color(0xFF000000),),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.w),
          child: Text('Create Account',
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
      body: GetBuilder<AuthController>(builder: (authControl){
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phone Number', style: Designs.labelFont,),
                              SizedBox(height: 4.h,),
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
                              SizedBox(height: 10.h,),
                              Container(
                                width: 76.w,
                                height: 0.3.h,
                                color: const Color(0xFF898A8D),
                              ),
                            ],
                          ),
                          SizedBox(width: 2.w,),
                          SizedBox(
                            width: 221.w,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              controller: _phoneController,
                              onSaved: (value){},
                              decoration: InputDecoration(
                                hintText: 'Enter Phone Number',
                                hintStyle: Designs.hintFont,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h,),
                      Text('Email', style: Designs.labelFont,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: _mailController,
                        onSaved: (value){},
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
                          hintStyle: Designs.hintFont,
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      Text('Full Name', style: Designs.labelFont,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        onSaved: (value){},
                        decoration: InputDecoration(
                          hintText: 'Enter Name',
                          hintStyle: Designs.hintFont,
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      Text('Password', style: Designs.labelFont,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        obscureText: _obscureText,
                        controller: _passController,
                        key: const ValueKey('password'),
                        onSaved: (value){},
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
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
                      SizedBox(height: 25.h,),
                      Text('Password Confirmation', style: Designs.labelFont,),
                      TextFormField(
                        obscureText: _reObscureText,
                        controller: _passConfirmController,
                        onChanged: (value){
                          setState((){
                            buttonIsActive = value.isNotEmpty?true:false;
                          });
                        },
                        key: const ValueKey('password Confirmation'),
                        onSaved: (value){},
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                          hintText: 'Re-enter Password',
                          hintStyle: Designs.hintFont,
                          suffixIcon:GestureDetector(
                            onTap: (){
                              setState(() {
                                _reObscureText =!_reObscureText;
                              });
                            },
                            child: Icon(_obscureText ? Icons.visibility_off
                                : Icons.visibility,
                                size: 20,color: const Color(0xFFB4B4B4)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 41.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 25.w),
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'By continuing, you confirm you’ve read and agree to our',
                              style: TextStyle(color: const Color(0xFF767676),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300
                              )),
                          TextSpan(
                              text: ' Terms of Service',
                              style: TextStyle(color: const Color(0xFF3F8BCA),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300
                              )),
                          TextSpan(
                              text: ' and ',
                              style: TextStyle(color: const Color(0xFF767676),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300
                              )),
                          TextSpan(
                              text: 'Privacy Notice ',
                              style: TextStyle(color: const Color(0xFF3F8BCA),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300
                              )),
                          TextSpan(
                              text: 'on how we collect, use, disclose and process your personal data.',
                              style: TextStyle(color: const Color(0xFF767676),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300
                              )),

                        ]
                    )),
              ),
              SizedBox(
                  height: 84.h),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  height: 55.h,
                  width: 289.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            buttonIsActive ? Designs.primaryColor : null
                        ),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 49.w, vertical: 17.h)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        ),)
                    ),
                    onPressed: _onPressed,
                    child: const Text('Create Account'),),
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}

