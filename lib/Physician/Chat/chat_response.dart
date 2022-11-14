
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Helpers/user_model.dart';

class PhysicianChatInbox extends StatefulWidget {
  const PhysicianChatInbox({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<PhysicianChatInbox> createState() => _PhysicianChatInboxState();
}

class _PhysicianChatInboxState extends State<PhysicianChatInbox> {
  @override
  Widget build(BuildContext context) {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(widget.user.image,
                height: 35.h, width: 35.h, fit: BoxFit.cover,),
            ),
            SizedBox(width: 10.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.user.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF0F0F0F),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text('Online', style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 11.sp, color: const Color(0xFFAAAAAA),
                ),)
              ],
            ),
          ],
        ),
        actions: [
          SvgPicture.asset('assets/svg/chat-call.svg', width: 24.w, height: 24.h,),
          SizedBox(width: 20.w,),
          SvgPicture.asset('assets/svg/chat-calender.svg', width: 24.w, height: 24.h,),
          SizedBox(width: 15.w,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 15, bottom: 35.h),
                  decoration: BoxDecoration(),
                ),
                Container(),
                Container()
              ],
            ),
          ),
          //Send a message area
        ],
      ),
    );
  }
}

// Container(
//   width: double.infinity,
//   height: 90.h,
//   decoration: const BoxDecoration(
//     color: Designs.whiteColor,
//     boxShadow: [
//       BoxShadow(
//         color: Color(0xFFDEDEDE),
//         spreadRadius: 0.3, blurRadius: 0.3,
//       )
//     ]
//   ),
//   child: Padding(
//     padding: EdgeInsets.only(left: 16.w, right: 12.w, top: 9.h, bottom: 15.h),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SvgPicture.asset('assets/svg/file.svg',
//         width: 32.w, height: 32.h,),
//         SizedBox(width: 16.w,),
//         SizedBox(
//           height: 40.h, width: 248.w,
//           child: Expanded(
//             child: TextField(
//               // controller: ,
//               textCapitalization: TextCapitalization.sentences,
//              textAlign: TextAlign.start,
//              decoration: InputDecoration(
//                hintText: 'Type Message',
//                hintStyle: TextStyle(
//                  color: const Color(0xFFAAAAAA),
//                  fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: 'Inter'
//                ),
//                contentPadding: EdgeInsets.only(left: 16.w, top: 10.h, bottom: 11.h),
//
//              ),
//             ),
//           ),
//         ),
//         SizedBox(width: 16.w,),
//         SvgPicture.asset('assets/svg/chat-mic.svg',
//           width: 32.w, height: 32.h,),
//       ],
//     ),
//   ),
// ),
