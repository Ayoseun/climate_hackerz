import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'app_colors.dart';

class AppFonts {
  static TextStyle h1 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 24,
      color: Pallete.kBlack,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle body1 = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      color: Pallete.kGravishColor,
      fontWeight: FontWeight.w400,
    ),
  );

  static TextStyle dialogColoredText = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: Color(0xFF007AFF),
      fontSize: 17,
    ),
  );

  static TextStyle h2v = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 20,
      color: Pallete.whiteColor,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle h3 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Pallete.kBlack,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle h3v = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Pallete.kBlack,
    ),
  );
  static TextStyle h4 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 18,
      color: Pallete.kBlack,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle h2 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 24,
      color: Pallete.kPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle hwhite = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 32,
      color: Pallete.whiteColor,
      fontWeight: FontWeight.w200,
    ),
  );
  static TextStyle hwhitesmall = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 10,
      color: Pallete.whiteColor,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle body = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: Pallete.kLightText,
    ),
  );
  static TextStyle normalblack = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: Pallete.kBlack,
    ),
  );
  static TextStyle normalhint = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      color: Pallete.khint,
    ),
  );
  static TextStyle normalblackbold = GoogleFonts.montserrat(
    textStyle:
        const TextStyle(color: Pallete.kBlack, fontWeight: FontWeight.bold),
  );
  static TextStyle body2 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Pallete.kLightText,
    ),
  );
  static TextStyle bodylight = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      color: Pallete.kPrimaryColor,
    ),
  );
  static TextStyle bodylight2 = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 14,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w500,
      color: Pallete.kPrimaryColor,
    ),
  );
  static TextStyle bodybold = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Pallete.kText,
    ),
  );
  static TextStyle bodyblack = GoogleFonts.montserrat(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Pallete.kBlack,
    ),
  );
}
