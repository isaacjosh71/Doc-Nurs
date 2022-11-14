
import 'package:docs_and_nurs/Helpers/upcoming_pre_list.dart';
import 'package:docs_and_nurs/Screens/Events/upcoming_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../Helpers/designs.dart';

class PhysicianUpcomingList extends StatefulWidget {
  const PhysicianUpcomingList({Key? key}) : super(key: key);

  @override
  State<PhysicianUpcomingList> createState() => _PhysicianUpcomingListState();
}

class _PhysicianUpcomingListState extends State<PhysicianUpcomingList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: upcomingPreList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Container(
                height: 136.h,
                width: 327.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Designs.primaryColor
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18.w, right: 15.w, top: 23.h),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(upcomingPreList[index]['img'],
                                  height: 40.h, width: 40.w, fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 9.h,),
                              Padding(
                                padding: EdgeInsets.only(top: 4.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(upcomingPreList[index]['name'],
                                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFFEBEBEB)),),
                                    SizedBox(height: 2.h,),
                                    Text(upcomingPreList[index]['job'],
                                      style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400, color: const Color(0xFFE0E0E0)),),
                                  ],),
                              ),
                            ],),
                          InkWell(
                            onTap: (){},
                            child: Container(height: 33.h, width: 52.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Designs.yellowTheme,
                              ),
                              child: Center(
                                child: Text('View',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Designs.whiteColor,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Inter'
                                  ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 15.w,),
                      child: Container(
                        height: 40.h, width: 295.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: const Color(0xFF1A69AB),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.w, right: 21.w, top: 12.h, bottom: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Ionicons.ios_calendar,
                                    size: 13.sp, color: const Color(0xFFDEDEDE),),
                                  SizedBox(width: 8.w,),
                                  Text(upcomingPreList[index]['date'],
                                    style: TextStyle(color: const Color(0xFFE0E0E0),
                                        fontSize: 11.sp, fontWeight: FontWeight.w400),),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Ionicons.ios_time,
                                    size: 13.sp, color: const Color(0xFFDEDEDE),),
                                  SizedBox(width: 8.w,),
                                  Text(upcomingPreList[index]['time'],
                                    style: TextStyle(color: const Color(0xFFE0E0E0),
                                        fontSize: 11.sp, fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
