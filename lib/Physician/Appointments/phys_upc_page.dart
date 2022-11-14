
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Physician/Appointments/phys_past_list.dart';
import 'package:docs_and_nurs/Physician/Appointments/phys_upc_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhysicianUpcomingAppointments extends StatefulWidget {
  const PhysicianUpcomingAppointments({Key? key}) : super(key: key);

  @override
  State<PhysicianUpcomingAppointments> createState() => _PhysicianUpcomingAppointmentsState();
}

class _PhysicianUpcomingAppointmentsState extends State<PhysicianUpcomingAppointments> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(left: 24.w, top: 59.h),
          child: Text('My Appointment',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 9.h,),
            Row(
              children: List.generate(selection.length,(index) =>
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          pageIndex = index;
                        });},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(selection[index],
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: pageIndex == index ? Designs.primaryColor : const Color(0xFFAAAAAA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,),
                          pageIndex == index
                              ? Container(
                            width: 69.w,
                            height: 1.h,
                            decoration: const BoxDecoration(
                              color: Designs.primaryColor,
                            ),)
                              : Container()
                        ],
                      ),
                    ),
                  ),
              ),
            ),
            SizedBox(height: 15.h,),
            IndexedStack(
              index: pageIndex,
              children: const [
                PhysicianUpcomingList(),
                PhysicianPastList(),
              ],
            )],
        ),
      ),
    );
  }
  List selection = [
    'Upcoming',
    'Past'
  ];
}