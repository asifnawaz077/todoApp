import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app-colors/app-colors.dart';

class BlackTextHeading extends StatelessWidget {
  String text;
   BlackTextHeading({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(text,style: GoogleFonts.poppins(
        color: AppColors.blackColor,fontWeight: FontWeight.w500,fontSize: 20
    ),);
  }
}
