import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Controller/constants/app-colors/app-colors.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  VoidCallback ontap;
  ButtonWidget({super.key,required this.ontap,required this .text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 44,
        width: 220,
        color: AppColors.btnColor,
        child: Center(
          child: Text(text,style: GoogleFonts.poppins(fontSize: 14,color: AppColors.whiteColor,fontWeight: FontWeight.w500),),
        ),
      ),
    );
  }
}
