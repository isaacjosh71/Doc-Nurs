
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../../Helpers/designs.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GiveReviews extends StatefulWidget {
  const GiveReviews({Key? key}) : super(key: key);

  @override
  State<GiveReviews> createState() => _GiveReviewsState();
}

class _GiveReviewsState extends State<GiveReviews> {
  final TextEditingController _commentController = TextEditingController();
  bool buttonIsActive = false;
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if(buttonIsActive){
      _onPressed=(){};
    }
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
          padding: EdgeInsets.symmetric(horizontal: 49.w),
          child: Text('Review Appointment',
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
          children: [
            SizedBox(height: 44.h,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 127.w),
             child: ClipRRect(
              borderRadius: BorderRadius.circular(36.r),
              child: Image.asset('assets/images/Frame 3000000940.png',
                height: 122.h, width: 122.w,
                fit: BoxFit.cover,
              ),
            ),
            ),
            SizedBox(height: 18.h,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 96.w),
              child: Text('Dr. Ellen Omorogbe', style: TextStyle(fontWeight: FontWeight.w500,
                fontSize: 20.sp, color: const Color(0xFF0F0F0F)),),
            ),
            SizedBox(height: 9.h,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 136.w),
              child: Text('Hepatologist', style: TextStyle(fontWeight: FontWeight.w400,
                  fontSize: 17.sp, color: const Color(0xFFAAAAAA)),),
            ),
            SizedBox(height: 47.h,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 31.w),
              child: RatingBar(
                itemSize: 58.sp,
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glow: false,
                itemPadding: EdgeInsets.only(right: 3.w),
                ratingWidget: RatingWidget(
                  full: SvgPicture.asset('assets/svg/heart.svg',
                  color: Designs.yellowTheme,),
                  half: SvgPicture.asset('assets/svg/heart.svg',
                   color: Designs.yellowTheme,),
                  empty: SvgPicture.asset('assets/svg/heart-search.svg',color: const Color(0xFFDEDEDE)),
                ),
                onRatingUpdate: (rating) {
                  setState((){
                    this.rating = rating;
                  });
                },
                updateOnDrag: true,
              ),
            ),
            SizedBox(height: 39.h,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(height: 1.h, width: 327.w, color: const Color(0xFFEBEBEB),),
            ),
            SizedBox(height: 12.h,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Comment', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500,
                  color: const Color(0xFF767676)),),
                  TextField(
                    controller: _commentController,
                    onChanged: (value){
                      setState((){
                        buttonIsActive = value.isNotEmpty?true:false;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Comment (message)',
                      hintStyle: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w400,
                        color: const Color(0xFF767676).withOpacity(0.3),
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 158.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Container(
                height: 55.h, width: 296.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        buttonIsActive ? Designs.yellowTheme : null
                    ),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 49.w, vertical: 17.h)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Designs.whiteColor
                      ),)
                  ),
                  onPressed: _onPressed,
                  child: const Center(child: Text('Submit Review',),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
