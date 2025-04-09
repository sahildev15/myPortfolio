

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Colors.dart';

class AppTextStyles {
  static  TextStyle FONT12FW600WHITE = GoogleFonts.poppins(

    fontSize: 12,
    color: AppColors.WHITE_COLOR,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle FONT20FW600LIGHT_GREY = GoogleFonts.poppins(

    fontSize: 20,
    color: Color(0xFF8491A0),
    fontWeight: FontWeight.w600,
  );
  static  TextStyle FONT21FW600WHITE = GoogleFonts.poppins(

    fontSize: 21,
    color: AppColors.WHITE_COLOR,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle FONT21FW600BLACK = GoogleFonts.poppins(

    fontSize: 21,
    color: AppColors.BACKGROUND,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle FONT55FW800WHITE = GoogleFonts.poppins(
    fontSize: 55,
    color: AppColors.WHITE_COLOR,
    letterSpacing: 3,
    fontWeight: FontWeight.w800,
  );
  static  TextStyle FONT18FW300WHITE = GoogleFonts.poppins(
    fontSize: 18,
    color: AppColors.WHITE_COLOR,
    fontWeight: FontWeight.w300,
  );
}
