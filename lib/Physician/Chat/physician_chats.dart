

import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Helpers/message_model.dart';
import 'package:docs_and_nurs/Physician/Chat/chat_response.dart';
import 'package:docs_and_nurs/Screens/Chat/chat_inbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Helpers/search_bar.dart';

class PhysicianChatList extends StatefulWidget {
  const PhysicianChatList({Key? key}) : super(key: key);

  @override
  State<PhysicianChatList> createState() => _PhysicianChatListState();
}

class _PhysicianChatListState extends State<PhysicianChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 59.h),
          child: Text('Chats',
            textAlign: TextAlign.start,
            style: TextStyle(
              letterSpacing: 0.33,
              color: const Color(0xFF0F0F0F),
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SearchedBar(
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/Form.svg',
                      width: 24.w, height: 24.h,),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 19.h),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: const Color(0xFF959AA1),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 22.w),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index){
                    final Message message = messages[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=> PhysicianChatInbox(
                            user: message.sender,
                          ));
                        },
                        child: Column(
                          children: [
                            Dismissible(
                              secondaryBackground: Container(
                                height: 53.h, width: 121.w, color: const Color(0xFFE8505B),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 22.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.delete_outline_rounded,
                                        color: const Color(0xFFFFFFFF), size: 12.sp,),
                                      SizedBox(width: 3.w,),
                                      Text('Delete', style: TextStyle(color: const Color(0xFFFFFFFF),
                                          fontSize: 10.sp, fontWeight: FontWeight.w400),)
                                    ],
                                  ),
                                ),
                              ),
                              key: UniqueKey(),
                              onDismissed: (direction) {},
                              child: SizedBox(
                                height: 53.h, width: 329.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.6.r),
                                      child: Image.asset(message.sender.image,
                                        width: 52.w, height: 52.h, fit: BoxFit.cover,),
                                    ),
                                    SizedBox(width: 10.w,),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(message.sender.name, style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: const Color(0xFF0F0F0F),
                                          ),),
                                          SizedBox(height: 2.sp,),
                                          Text(message.text,
                                            maxLines: 2,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                              color: const Color(0xFFAAAAAA),
                                            ),),
                                        ],
                                      ),),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          message.unread ? Text('12:45 PM',
                                            style: TextStyle(fontSize: 12.sp,
                                                color: Designs.yellowTheme, fontWeight: FontWeight.w400),)
                                              : Text('12:45 PM',
                                            style: TextStyle(fontSize: 12.sp,
                                                color: const Color(0xFFAAAAAA), fontWeight: FontWeight.w400),),
                                          SizedBox(height: 5.h,),
                                          message.unread ? CircleAvatar(
                                            radius: 10.r,
                                            backgroundColor: Designs.yellowTheme,
                                            child: Text('3', style: TextStyle(
                                                color: Designs.whiteColor,fontSize: 12.sp,fontWeight: FontWeight.w400
                                            ),),
                                          )  : Container(),
                                        ]
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
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
          ],
        ),
      ),
    );
  }
}
