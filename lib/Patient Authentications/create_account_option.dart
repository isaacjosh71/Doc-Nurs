
import 'package:docs_and_nurs/Physician/Auth/create_physician_acc.dart';
import 'package:docs_and_nurs/Welcome/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Helpers/designs.dart';
import 'create_patient_account.dart';

class CreateAccountOption extends StatelessWidget {
  const CreateAccountOption ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      backgroundColor: Designs.scaffoldTheme,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                height: 408.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/Ellipse 1137.png',
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
              top: 43.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: Image.asset('assets/images/Group 1000000764.png',
                height: 154.05.h,
                  width: 235.76.h,
                ),
              )),
          Positioned(
              top: 409.h,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 77.w),
                    child: Text('Create an account',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25.sp,
                      color: const Color(0xFF000000)
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 66.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 43.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      height: 55.h,
                      width: 289.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(Designs.primaryColor),
                            foregroundColor: MaterialStateProperty.all(Designs.whiteColor),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 54.w, vertical: 17.h)),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal
                            ),)
                        ),
                        onPressed: () {
                          Get.to(const CreateAccount());
                        },
                        child: const Text('I\'m a patient'),),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 43.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      height: 55.h,
                      width: 289.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            side: MaterialStateProperty.all(const BorderSide(
                                color: Designs.primaryColor
                            )),
                            backgroundColor: MaterialStateProperty.all(const Color(0xFFF5F5F5)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(horizontal: 31.7.w, vertical: 17.h)),
                            foregroundColor: MaterialStateProperty.all(Designs.primaryColor),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal
                            ),)
                        ),
                        onPressed: () {Get.to(()=> const CreatePhysicianAccount());},
                        child: const Text('I\'m a physician'),),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
