import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_res.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Size? size;
  final bool? isClickable;
  final BorderSide? borderSide;
  const CustomButton(
      {super.key, this.size, this.borderSide, this.isClickable = true, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorRes.buttonColor,
        foregroundColor: Colors.grey,
        shadowColor: ColorRes.hintTextColor,
        elevation: 2,
        shape: RoundedRectangleBorder(side: borderSide ?? BorderSide.none, borderRadius: BorderRadius.circular(5.0)),
        minimumSize: size ?? Size(100.w, 48.h),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline2!
            .copyWith(color: ColorRes.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
