import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Controller/constants/app-colors/app-colors.dart';

class NormalTextWidget extends StatelessWidget {
  String text;
  Color textColor;
  NormalTextWidget({super.key,required this.textColor,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      fontSize: 13,fontWeight: FontWeight.w500,
      color: textColor,
    ),);
  }
}
