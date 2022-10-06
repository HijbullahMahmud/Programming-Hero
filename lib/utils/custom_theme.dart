import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_res.dart';

class CustomTheme {
  static final ThemeData baseLight = ThemeData.light();
  static final lightTheme = baseLight.copyWith(
    textTheme: _lightTextTheme(baseLight.textTheme),
    primaryColor: ColorRes.primaryColor,
    canvasColor: ColorRes.canvasColor,
  );

  static TextTheme _lightTextTheme(TextTheme base) {
    return base.copyWith(
      bodyText1: base.bodyText1!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      headline1: base.headline1!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      headline2: base.headline2!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 16.sp,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      headline3: base.headline3!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 18.sp,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      headline4: base.headline4!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 20.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      headline5: base.headline5!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 22.sp,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: base.bodyText2!.copyWith(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 24.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
