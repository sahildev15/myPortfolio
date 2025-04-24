import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart';

// Utility function to calculate responsive font size
double getResponsiveFontSize(BuildContext context, double baseFontSize) {
  double screenWidth = MediaQuery.of(context).size.width;

  // Fine-tuned scaling based on screen width
  if (screenWidth >= 1200) return baseFontSize; // desktop
  if (screenWidth >= 800) return baseFontSize * 0.9; // tablet
  return baseFontSize * 0.8; // mobile
}

class AppTextStyles {
  static TextStyle FONT12FW600WHITE(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: getResponsiveFontSize(context, 12),
        color: AppColors.WHITE_COLOR,
        fontWeight: FontWeight.w600,
      );

  static TextStyle FONT20FW600LIGHT_GREY(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: getResponsiveFontSize(context, 20),
        color: Color(0xFF8491A0),
        fontWeight: FontWeight.w600,
      );

  static TextStyle FONT21FW600WHITE(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: getResponsiveFontSize(context, 21),
        color: AppColors.WHITE_COLOR,
        fontWeight: FontWeight.w600,
      );

  static TextStyle FONT21FW600BLACK(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: getResponsiveFontSize(context, 21),
        color: AppColors.BACKGROUND,
        fontWeight: FontWeight.w600,
      );

  static TextStyle FONT55FW800WHITE(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: getResponsiveFontSize(context, 55),
        color: AppColors.WHITE_COLOR,
        letterSpacing: 3,
        fontWeight: FontWeight.w800,
      );

  static TextStyle FONT18FW300WHITE(BuildContext context) =>
      GoogleFonts.poppins(
        fontSize: getResponsiveFontSize(context, 18),
        color: AppColors.WHITE_COLOR,
        fontWeight: FontWeight.w300,
      );
}
