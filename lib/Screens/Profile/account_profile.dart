
import 'dart:io';
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Screens/Profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/auth_services/auth_ctlr.dart';
import '../../services/auth_services/profile_ctlr.dart';

class AccountProfile extends StatefulWidget {
  const AccountProfile({Key? key}) : super(key: key);

  @override
  State<AccountProfile> createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  @override
  void initState() {
    super.initState();
    loadImage();
  }
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? _imagePath;
  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<ProfileController>().getUserProfile();
      print('User Logged In');
    }
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new,
            size: 24.sp, color: const Color(0xFF000000),),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 89.w),
          child: Text('Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1F1F1F),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: GetBuilder<ProfileController>(builder: (profControl){
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 19.h,),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      _imagePath!= null ? ClipRRect(
                        borderRadius: BorderRadius.circular(35.r),
                        child: Image(
                          height: 132.h, width: 132.w,
                          image: FileImage(File(_imagePath!)),
                          fit: BoxFit.cover,),
                      ) : ClipRRect(
                        borderRadius: BorderRadius.circular(35.r),
                        child: Image(
                          height: 132.h, width: 132.w,
                          fit: BoxFit.cover, image: _getImage(),
                        ),
                      ),
                      SizedBox(height: 7.h,),
                      TextButton(onPressed: () async{
                        image = await _picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          image = image;
                        });
                        _saveImage(image!.path);
                      },
                          child: Text('Change Image',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500, color: Designs.yellowTheme),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 21.h,),
                Text('Full Name',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: const Color(0xFF373737), fontSize: 15.sp)),
                SizedBox(
                  width: 325.w,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: profControl.data.fullName,
                        hintStyle: TextStyle(
                            color: const Color(0xFF1F1F1F), fontSize: 15.sp,
                            fontWeight: FontWeight.w400, fontStyle: FontStyle.normal
                        )),
                  ),
                ),
                SizedBox(height: 35.h,),
                Text('Email',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: const Color(0xFF373737), fontSize: 15.sp)),
                SizedBox(
                  width: 325.w,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: profControl.data.email,
                        hintStyle: TextStyle(
                            color: const Color(0xFF1F1F1F), fontSize: 15.sp,
                            fontWeight: FontWeight.w400, fontStyle: FontStyle.normal
                        )),
                  ),
                ),
                SizedBox(height: 35.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone Number', style: TextStyle(
                            fontWeight: FontWeight.w600, color: const Color(0xFF373737), fontSize: 15.sp),),
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
                        SizedBox(height: 14.h,),
                        Container(
                          width: 78.w,
                          height: 0.5.h,
                          color: const Color(0xFF898A8D),
                        ),
                      ],
                    ),
                    SizedBox(width: 2.w,),
                    Padding(
                      padding: EdgeInsets.only(top: 19.h),
                      child: SizedBox(
                        width: 221.w,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: profControl.data.phoneNumber,
                              hintStyle: TextStyle(
                                color: const Color(0xFF1F1F1F), fontSize: 15.sp,
                                fontWeight: FontWeight.w400, fontStyle: FontStyle.normal,
                              ),
                              suffixIcon: Icon(Icons.check_circle, size: 24.sp,
                                color: const Color(0xFF00A84D),)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                GestureDetector(
                  onTap: (){},
                  child: Text('Change Phone Number',
                    style: TextStyle(color: Designs.primaryColor, fontSize: 15.sp, fontWeight: FontWeight.w500),),
                ),
                SizedBox(height: 96.h,),
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
                      onPressed: () {

                      },
                      child: const Center(child: Text('Save changes')),),
                  ),
                ),
              ],
            ),
          ),
        );
      })
    );
  }

  ImageProvider _getImage() {
    final image = this.image;
    if (image != null) {
      return FileImage(File(image.path));
    }
    return const AssetImage('assets/images/Frame 2000000940.png');
  }

  void _saveImage (path) async{
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    saveImage.setString('imagepath', path);
  }

  void loadImage() async{
    SharedPreferences saveImage = await SharedPreferences.getInstance();
    setState((){
      _imagePath = saveImage.getString('imagePath');
    });
  }
}
