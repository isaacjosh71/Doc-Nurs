
import 'package:docs_and_nurs/Helpers/rated_pre_list.dart';
import 'package:docs_and_nurs/Screens/Home%20Screen/physician_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../../Helpers/designs.dart';

class RatedListCard extends StatefulWidget {

  const RatedListCard({
    Key? key,
  }) : super(key: key);

  @override
  State<RatedListCard> createState() => _RatedListCardState();
}

class _RatedListCardState extends State<RatedListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      decoration: BoxDecoration(
        color: Designs.whiteColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), topLeft: Radius.circular(8.r))
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w,right: 15.w, top: 20.h),
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
    );
  }
}
