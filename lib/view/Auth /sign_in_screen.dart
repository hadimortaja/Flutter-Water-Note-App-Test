import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:water_note_app/bakend/firebase_backend.dart';
import 'package:water_note_app/value/app_get.dart';
import 'package:water_note_app/value/colors.dart';
import 'package:water_note_app/view/Auth%20/sign_up_screen.dart';
import 'package:water_note_app/widgets/custom_text.dart';
import 'package:water_note_app/widgets/custom_text_form_field2.dart';

class SignInScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AppGet appGet = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 44, 78),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.whiteColor)),
                child: Center(
                    child: CustomText(
                  "Logo",
                  color: AppColors.whiteColor,
                )),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                "Water Note",
                color: AppColors.whiteColor,
              ),
              CustomTextFormField(
                hint: "Enter your Email",
                onSaved: appGet.setEmailLogin,
              ),
              CustomTextFormField(
                hint: "Enter your Password",
                onSaved: appGet.setPasswordLogin,
                isPassword: true,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  CustomText(
                    "Forgot Password ?",
                    color: AppColors.whiteColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    FirebaseBackend()
                        .loginUser(appGet.emailLogin, appGet.passwordLogin);
                  }
                },
                child: Container(
                  width: Get.width,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor.withOpacity(0.23),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                      child: CustomText(
                    "LOGIN",
                    color: AppColors.whiteColor,
                  )),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SignUpScreen());
                },
                child: CustomText(
                  "Doesn't Have Account ? Sign Up",
                  color: AppColors.whiteColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
