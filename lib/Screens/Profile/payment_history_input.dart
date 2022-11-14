//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// class PaymentHistoryInput extends StatelessWidget {
//   const PaymentHistoryInput({Key? key,
//     required this.month, required this.img, required this.serialNo,
//     required this.date, required this.time, required this.amount,
//     required this.status}) : super(key: key);
//   final String month;
//   final String img;
//   final String serialNo;
//   final String date;
//   final String time;
//   final String amount;
//   final String status;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//             padding: EdgeInsets.only(left: 21.w),
//         child: Text(month,
//         style: TextStyle(
//           fontSize: 15.sp, fontWeight: FontWeight.w500,
//             color: const Color(0xFF3A3B43), fontFamily: 'Inter'
//         ),),),
//         SizedBox(height: 23.h,),
//         Padding(
//             padding: EdgeInsets.symmetric(horizontal: 21.w),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 50.h, width: 50.h,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFB2D1EA).withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10.r)
//                   ),
//                   child: Center(
//                     child: SvgPicture.asset(img,
//                     height: 24.h, width: 24.w,),
//                   ),
//                 ),
//                 SizedBox(width: 13.w,),
//                 Padding(padding: EdgeInsets.only(top: 8.h),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(serialNo, style: TextStyle(
//                         fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF020003)),),
//                     SizedBox(height: 8.h,),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(date, style: TextStyle(
//                             fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xFF020003).withOpacity(0.5)),),
//                         SizedBox(width: 3.h,),
//                         Text(time, style: TextStyle(
//                             fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xFF020003).withOpacity(0.5)),),
//                       ],
//                     ),
//                   ],
//                 ),
//                 )
//               ],
//             ),
//             Column(
//               children: [
//                 Text(amount, style:
//                 TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: const Color(0xFF000000)),),
//                 SizedBox(height: 8.h,),
//                 Text(status, style:
//                 TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: const Color(0xFF00A953).withOpacity(0.5)),),
//               ],
//             )
//           ],
//         )
//         )
//       ],
//     );
//   }
// }
