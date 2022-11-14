
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Physician/Appointments/phys_upc_page.dart';
import 'package:docs_and_nurs/Physician/Chat/physician_chats.dart';
import 'package:docs_and_nurs/Physician/Home/welcome_page.dart';
import 'package:docs_and_nurs/Physician/Profile/phys_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PhysicianRootPage extends StatefulWidget {
  const PhysicianRootPage({Key? key}) : super(key: key);

  @override
  State<PhysicianRootPage> createState() => _PhysicianRootPageState();
}

class _PhysicianRootPageState extends State<PhysicianRootPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      bottomNavigationBar: getFooter(),
      body: IndexedStack(
        index: pageIndex,
        children: const [
          WelcomePage(),
          PhysicianUpcomingAppointments(),
          PhysicianChatList(),
          PhysicianProfilePage(),
        ],
      ),
    );
  }

  Widget getFooter(){
    List bottomNavigation = [
      'assets/svg/home.svg',
      'assets/svg/calendar.svg',
      'assets/svg/message.svg',
      'assets/svg/user.svg'
    ];
    return Container(
      width: double.infinity,
      height: 79.h,
      decoration: BoxDecoration(
        color: Designs.whiteColor,
        border: Border(
          top: BorderSide(
            width: 0.5, color: Designs.scaffoldTheme.withOpacity(0.3),
          ),
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.only(
          top: 14.h,
          left: 39.5.w,
          right: 39.5.w,
          bottom: 33.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomNavigation.length,
                (index) => InkWell(
              onTap: (){
                setState(() {
                  pageIndex = index;
                });
              },
              child: SvgPicture.asset(
                bottomNavigation[index],
                height: 32.h, width: 32.w,
                color: pageIndex == index ?
                Designs.yellowTheme : Designs.primaryColor,
              ),
            ),),
        ),
      ),
    );
  }
}

