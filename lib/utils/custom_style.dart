import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyle {
  static TextStyle textStyleMontserratNormal =
      GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black, fontSize: 14.sp));

  static TextStyle textStyleMontserratBold =
      GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold));

  static TextStyle textStylePoppinsRegular =
      GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.normal));
}
