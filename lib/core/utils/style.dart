
//import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskkkk_app/core/utils/color.dart';

TextStyle getTitleStyle({double? fontSize, FontWeight? fontWeight, Color?color }){
   return TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
       fontSize: fontSize?? 20,
       fontWeight:fontWeight?? FontWeight.w600,
       color: color?? AppColor.primary,
   );
}

 TextStyle getBodyStyle({double? fontSize, FontWeight? fontWeight, Color?color}){
    return TextStyle(
       fontFamily: GoogleFonts.poppins().fontFamily,
       fontSize: fontSize?? 18,
       fontWeight:fontWeight?? FontWeight.w500,
       color: color?? AppColor.white,
    );
 }

  TextStyle getSmallStyle({double? fontSize, FontWeight? fontWeight, Color?color}){
    return TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
       fontSize: fontSize?? 16,
       fontWeight:fontWeight?? FontWeight.normal,
       color: color?? AppColor.grey,
    );
 }