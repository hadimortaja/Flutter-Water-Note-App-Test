import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_note_app/bakend/firebase_backend.dart';
import 'package:water_note_app/value/colors.dart';
import 'package:water_note_app/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(FirebaseBackend().getuser().email),
                GestureDetector(
                  onTap: () async {
                    FirebaseBackend().logOut();
                  },
                  child: Container(
                    width: 200.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Center(
                      child: CustomText(
                        "Sign Out",
                        color: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
