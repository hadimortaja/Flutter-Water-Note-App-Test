import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_note_app/value/colors.dart';
import 'package:water_note_app/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String topTitle;
  final String hint;
  final Function onSaved;
  final Function validator;
  final TextInputType textInputType;
  final Function onTap;
  final bool isTime;
  // final String initial;
  final TextEditingController controller;
  final bool isPassword;
  CustomTextFormField({
    this.topTitle,
    this.hint,
    this.onSaved,
    this.validator,
    this.onTap,
    // this.initial,
    this.textInputType,
    this.controller,
    this.isPassword = false,
    this.isTime = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          topTitle ?? "",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          onTap: onTap,
          controller: controller,
          onSaved: (value) => onSaved(value),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This Field is Required';
            }
            return null;
          },
          obscureText: isPassword,
          maxLines: 1,
          minLines: 1,
          focusNode: isTime ? AlwaysDisabledFocusNode() : FocusNode(),
          keyboardType: textInputType ?? TextInputType.text,
          // initialValue: initial ?? "",
          decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.all(16.h),
            // isDense: true,
            errorStyle: TextStyle(fontSize: 12.0, fontFamily: "din"),
            hintText: hint ?? "",
            fillColor: Colors.white.withOpacity(
              0.23,
            ),
            hintStyle: TextStyle(color: AppColors.whiteColor, fontSize: 14.sp),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(
                  0.23,
                ),
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(
                  0.23,
                ),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(
                  0.23,
                ),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.red),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(
                  0.23,
                ),
              ),
            ),
          ),
          style: TextStyle(
              fontFamily: "din",
              fontSize: 16.sp,
              height: 1.1,
              color: AppColors.whiteColor),
        )
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
