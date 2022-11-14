
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../Helpers/nearby_pre_list.dart';

class NearbyListCard extends StatefulWidget {
  const NearbyListCard({Key? key}) : super(key: key);

  @override
  State<NearbyListCard> createState() => _NearbyListCardState();
}

class _NearbyListCardState extends State<NearbyListCard> {
  PageController pageController = PageController(viewportFraction: 0.94.sp);

  @override
  void initState(){
    super.initState();
    pageController.initialPage;
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: PageView.builder(
        itemCount: nearbyPreList.length,
          controller: pageController,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 100.h,
              width: 314.sp,
              margin: EdgeInsets.only(right: 7.sp),
              decoration: BoxDecoration(
                color: Designs.whiteColor,
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 17.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(nearbyPreList[index]['img'],
                      height: 52.h, width: 52.w, fit: BoxFit.cover,),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(nearbyPreList[index]['name'],
                            textAlign: TextAlign.start,
                            style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: const Color(0xFF0F0F0F),
                          ),),
                          SizedBox(height: 3.sp,),
                          Text(nearbyPreList[index]['job'], style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: const Color(0xFFAAAAAA),
                          ),),
                          SizedBox(height: 7.sp,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Ionicons.ios_heart,
                                      size: 12.sp, color: const Color(0xFFF1C644)),
                                  SizedBox(width: 2.w,),
                                  Text(nearbyPreList[index]['rating'],
                                    style: TextStyle(fontSize: 12.sp,
                                        color: const Color(0xFFAAAAAA), fontWeight: FontWeight.w400),),
                                ],
                              ),
                              SizedBox(width: 10.w,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.percent_rounded,
                                      size: 12.sp, color: Designs.primaryColor),
                                  SizedBox(width: 2.w),
                                  Text(nearbyPreList[index]['distance'],
                                    style: TextStyle(fontSize: 12.sp,
                                        color: const Color(0xFFAAAAAA), fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ]
                          )
                        ],
                      ),),
                    SizedBox(width: 30.w,),
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
            );
          }),
    );
  }
}
