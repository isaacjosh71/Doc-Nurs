
import 'package:docs_and_nurs/Screens/Profile/notification_page.dart';
import 'package:docs_and_nurs/Screens/Profile/payment_history.dart';
import 'package:docs_and_nurs/Welcome/onboarding.dart';
import 'package:docs_and_nurs/services/auth_services/auth_ctlr.dart';
import 'package:docs_and_nurs/services/auth_services/profile_ctlr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Helpers/designs.dart';
import 'package:docs_and_nurs/Screens/Profile/account_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // bool circular = true;
  // NetworkHandle networkHandle = NetworkHandle();
  // Data data = Data();
  //
  // @override
  // void initState() {
  //   fetchProfile();
  //   super.initState();
  // }
  //
  // void fetchProfile() async{
  //   var response = await networkHandle.get('/patient/profile');
  //   setState((){
  //     data = Data.fromJson(jsonDecode(response));
  //     circular = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<ProfileController>().getUserProfile();
      print('User Logged In');
    }
    return Scaffold(
        backgroundColor: Designs.scaffoldTheme,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Designs.scaffoldTheme,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(left: 24.w, top: 59.h),
            child: Text('Profile',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color(0xFF0F0F0F),
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body:
        GetBuilder<ProfileController>(
          builder: (profControl) {
            return _userLoggedIn ? (profControl.isLoading ?
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/Frame 10000009422.png',
                        height: 74.h, width: 74.w,
                      ),
                      SizedBox(width: 22.w,),
                      Padding(
                        padding: EdgeInsets.only(top: 17.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(profControl.data.fullName,
                              style: TextStyle(fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1F1F1F)),),
                            SizedBox(height: 6.h),
                            Text(profControl.data.email,
                              style: TextStyle(fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF767676)),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 31.h),
                Padding(
                  padding: EdgeInsets.only(left: 19.w, top: 15.h, bottom: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const AccountProfile());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/person.svg',
                              height: 22.h, width: 22.w,
                            ),
                            SizedBox(width: 8.w,),
                            Text('Account', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1F1F1F),
                                fontSize: 16.sp),)
                          ],
                        ),
                      ),
                      SizedBox(height: 44.h,),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const PaymentHistory());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/moneys.svg',
                              height: 22.h, width: 22.w,
                            ),
                            SizedBox(width: 8.w,),
                            Text('Payment History', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1F1F1F),
                                fontSize: 16.sp),)
                          ],
                        ),
                      ),
                      SizedBox(height: 44.h,),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const NotificationPage());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/bell.svg',
                              height: 22.h, width: 22.w,
                            ),
                            SizedBox(width: 8.w,),
                            Text('Notification', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1F1F1F),
                                fontSize: 16.sp),)
                          ],
                        ),
                      ),
                      SizedBox(height: 44.h,),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/password.svg',
                              height: 22.h, width: 22.w,
                            ),
                            SizedBox(width: 8.w,),
                            Text('Change Password', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1F1F1F),
                                fontSize: 16.sp),)
                          ],
                        ),
                      ),
                      SizedBox(height: 44.h,),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/help.svg',
                              height: 22.h, width: 22.w,
                            ),
                            SizedBox(width: 8.w,),
                            Text('Help', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1F1F1F),
                                fontSize: 16.sp),)
                          ],
                        ),
                      ),
                      SizedBox(height: 44.h,),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/about.svg',
                              height: 22.h, width: 22.w,
                            ),
                            SizedBox(width: 8.w,),
                            Text('About', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1F1F1F),
                                fontSize: 16.sp),)
                          ],
                        ),
                      ),
                      SizedBox(height: 44.h,),
                      GestureDetector(
                        onTap: (){
                          if(Get.find<AuthController>().userLoggedIn()){
                            Get.find<AuthController>().clearedSharedData();
                            Get.offAll(()=> const OnBoardingScreen());
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/logout.svg',
                              height: 22.h, width: 22.w,
                            ),
                            SizedBox(width: 8.w,),
                            Text('Logout', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFF7C74),
                                fontSize: 16.sp),)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ) :
            const Center(child: CircularProgressIndicator(),))
                : const Center(child: Text('Profile Page'),);
          },
        )
    );
  }
  }

