
import 'package:docs_and_nurs/Helpers/notification_json.dart';
import 'package:docs_and_nurs/Screens/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Helpers/designs.dart';
import '../../Helpers/rated_pre_list.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 59.w),
          child: Text('Notifications',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1F1F1F),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: (){},
            child: Padding(
              padding: EdgeInsets.only(right: 24.w, top: 22.h),
              child: Text('Clear all',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF727F8D)),),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){},
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFFDBEDFF),
                            radius: 22,
                              child: Center(child: Icon(Ionicons.ios_notifications_outline,
                              color: Designs.primaryColor, size: 24.sp,
                              ),
                            ),
                            ),
                            SizedBox(width: 14.w,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(notificationList[index]['title'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: const Color(0xFF1F1F1F),
                                  ),),
                                  SizedBox(height: 10.sp,),
                                  Text(notificationList[index]['message'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.sp,
                                    color: const Color(0xFFAAAAAA),
                                  ),),
                                ],
                              ),),
                            SizedBox(width: 18.w,),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(notificationList[index]['time'],
                                    style: TextStyle(fontSize: 12.sp,
                                        color: const Color(0xFF727F8D), fontWeight: FontWeight.w400),),
                                  SizedBox(height: 16.h,),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Icon(Icons.more_horiz_rounded,
                                        size: 18.sp, color: const Color(0xFF444C55)),
                                  ),
                                ]
                            )
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Container(
                          width: 327.w,
                          height: 1.h,
                          color: const Color(0xFFEBEBEB),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
