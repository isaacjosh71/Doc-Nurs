
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Screens/Home%20Screen/physician_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../../Helpers/rated_pre_list.dart';
import '../../Helpers/search_bar.dart';

class TopPhysicians extends StatefulWidget {
  const TopPhysicians({Key? key}) : super(key: key);

  @override
  State<TopPhysicians> createState() => _TopPhysiciansState();
}

class _TopPhysiciansState extends State<TopPhysicians> {
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
          padding: EdgeInsets.symmetric(horizontal: 69.w),
          child: Text('Top Physicians',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 0.33,
              color: const Color(0xFF1F1F1F),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SearchedBar(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Ionicons.search,
                        color: Color(0xFF959AA1),),
                      onPressed: () {},),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 19.h),
                          hintText: 'Search for a physician',
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
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ratedPreList.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){Get.to(()=> PhysicianDetails(
                        id: ratedPreList[index],
                      ));},
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(ratedPreList[index]['img'],
                                    width: 45.w, height: 45.h, fit: BoxFit.cover,),
                                ),
                                SizedBox(width: 10.w,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(ratedPreList[index]['name'], style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.sp,
                                        color: const Color(0xFF0F0F0F),
                                      ),),
                                      SizedBox(height: 3.sp,),
                                      Text(ratedPreList[index]['job'], style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.sp,
                                        color: const Color(0xFFAAAAAA),
                                      ),),
                                    ],
                                  ),),
                                SizedBox(width: 17.w,),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(ratedPreList[index]['rating'],
                                            style: TextStyle(fontSize: 12.sp,
                                                color: const Color(0xFFAAAAAA), fontWeight: FontWeight.w400),),
                                          SizedBox(width: 2.w,),
                                          Icon(Ionicons.ios_heart,
                                              size: 12.sp, color: const Color(0xFFF1C644)),
                                        ],
                                      ),
                                      SizedBox(height: 12.h,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(ratedPreList[index]['distance'],
                                            style: TextStyle(fontSize: 12.sp,
                                                color: const Color(0xFFAAAAAA), fontWeight: FontWeight.w400),),
                                          SizedBox(width: 2.w,),
                                          Icon(Icons.percent_rounded,
                                              size: 12.sp, color: Designs.primaryColor),
                                        ],
                                      ),
                                    ]
                                )
                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Container(
                              width: 295.w,
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
