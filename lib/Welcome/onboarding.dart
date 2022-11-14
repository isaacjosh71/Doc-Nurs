import 'package:docs_and_nurs/Patient Authentications/create_account_option.dart';
import 'package:docs_and_nurs/Patient Authentications/log_in_number.dart';
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Helpers/designs.dart';
import '../Helpers/onboarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Expanded(
            child:  PageView.builder(
                controller: _controller,
                onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                scrollBehavior: const ScrollBehavior(
                  androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
                ),
                itemCount: contents.length,
                itemBuilder: (_,i){
                  return Column(
                    children: [
                      SizedBox(height: 135.h),
                      Image.asset(
                          contents[i].image,
                          height: 288.sp,
                        width: 375.sp,
                      ),
                      SizedBox(height: 65.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        List.generate(contents.length, (index){
                          return buildDot(index, context);
                        }),
                      ),
                      SizedBox(
                          height: 26.h),
                      Text(
                        contents[i].text,
                        textAlign: TextAlign.center,
                        style: Designs.bigFont),
                      SizedBox(
                          height: 15.h
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 55.sp, right: 55.sp),
                        child: Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: Designs.smallFont),
                      ),
                      SizedBox(
                          height: 75.h
                      ),
                    ],
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  height: 55.h,
                  width: 155.w,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Designs.primaryColor),
                        foregroundColor: MaterialStateProperty.all(Designs.whiteColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 54.w, vertical: 17.h)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        ),)
                    ),
                    onPressed: () {
                      Get.to(()=> const LogInNumber());
                    },
                    child: const Text('Log In'),),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  height: 55.h,
                  width: 155.w,
                  child: TextButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all( BorderSide(
                            color: Designs.primaryColor
                        )),
                        backgroundColor: MaterialStateProperty.all(const Color(0xFFF5F5F5)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            color: Designs.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        ),)
                    ),
                    onPressed: () {
                      Get.offAll(() => const CreateAccountOption());
                    },
                    child: const Text('Create Account'),),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
        ],
      ),
    );
  }
  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: 10.0,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? const Color(0xFF3F8BCA):const Color(0xFFD9D9D9)
      ),
    );
  }
}
