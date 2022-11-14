
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Helpers/payment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({Key? key}) : super(key: key);

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
          padding: EdgeInsets.only(left: 60.w),
          child: Text('Payment History',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF1F1F1F),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 21.w),
                child:
                Text('February',
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w500,
                      color: const Color(0xFF3A3B43), fontFamily: 'Inter'
                  ),),),
              SizedBox(height: 23.h,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: februaryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.only(left: 21.w, right: 21.w, bottom: 28.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50.h, width: 50.h,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFB2D1EA).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10.r)
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset('assets/svg/hospital.svg',
                                        height: 24.h, width: 24.w,),
                                    ),
                                  ),
                                  SizedBox(width: 13.w,),
                                  Padding(padding: EdgeInsets.only(top: 8.h),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(februaryList[index]['id'], style: TextStyle(
                                            fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF020003)),),
                                        SizedBox(height: 8.h,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(februaryList[index]['date'], style: TextStyle(
                                                fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xFF020003).withOpacity(0.5)),),
                                            SizedBox(width: 3.h,),
                                            Text(februaryList[index]['time'], style: TextStyle(
                                                fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xFF020003).withOpacity(0.5)),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(februaryList[index]['amount'], style:
                                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: const Color(0xFF000000)),),
                                  SizedBox(height: 8.h,),
                                  Text(februaryList[index]['status'], style:
                                  TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: const Color(0xFF00A953).withOpacity(0.5)),),
                                ],
                              )
                            ],
                          ),
                        SizedBox(height: 10.h,),
                          Container(
                            height: 0.5, width: 322.w,
                            color: const Color(0xFFEBEAEA),
                          )
                        ],
                      ),

                  );
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 21.w),
                child:
                Text('January',
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w500,
                      color: const Color(0xFF3A3B43), fontFamily: 'Inter'
                  ),),),
              SizedBox(height: 23.h,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: januaryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 21.w, right: 21.w, bottom: 28.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50.h, width: 50.h,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFB2D1EA).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10.r)
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset('assets/svg/hospital.svg',
                                      height: 24.h, width: 24.w,),
                                  ),
                                ),
                                SizedBox(width: 13.w,),
                                Padding(padding: EdgeInsets.only(top: 8.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(januaryList[index]['id'], style: TextStyle(
                                          fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF020003)),),
                                      SizedBox(height: 8.h,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(januaryList[index]['date'], style: TextStyle(
                                              fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xFF020003).withOpacity(0.5)),),
                                          SizedBox(width: 3.h,),
                                          Text(februaryList[index]['time'], style: TextStyle(
                                              fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xFF020003).withOpacity(0.5)),),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(januaryList[index]['amount'], style:
                                TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: const Color(0xFF000000)),),
                                SizedBox(height: 8.h,),
                                Text(januaryList[index]['status'], style:
                                TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: const Color(0xFF00A953).withOpacity(0.5)),),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Container(
                          height: 0.5, width: 322.w,
                          color: const Color(0xFFEBEAEA),
                        )
                      ],
                    ),

                  );
                },
              ),
            ],
          ),
        ],
      )
    );
  }
//(if no payment)
  // Align(
  // alignment: Alignment.center,
  // child: Column(
  // mainAxisAlignment: MainAxisAlignment.center,
  // children: [
  // Padding(
  // padding: EdgeInsets.only(left: 138.w, right: 138.w,),
  // child:
  // Image.asset('assets/images/clock 2.png',
  // height: 98.37.h,
  // width: 98.37.w,
  // ),
  // ),
  // SizedBox(height: 25.h,),
  // Padding(
  // padding: EdgeInsets.only(left: 92.w, right: 92.w),
  // child:
  // Text('No payment yet', style: TextStyle(
  // fontWeight: FontWeight.w600, fontSize: 25.sp, color: const Color(0xFF000000)),)
  // ),
  // ],
  // ),
  // ),
}
