import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Controller/constants/app-colors/app-colors.dart';
import 'package:todo_app/Controller/constants/app-images/app-images.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/button-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/image-widget.dart';
import 'package:todo_app/Controller/constants/app-loader/apploader.dart';
import 'package:todo_app/View/auth_view/login_view/signupview.dart';

import '../../../Controller/constants/app-images/widgets/blacktext-heading-widget.dart';
import '../../auth_view/signin_view/signifiers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bGColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100)),
                    color: Color(0xff55847A).withOpacity(0.5)),
              ),
              Container(
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                    color: Color(0xff55847A).withOpacity(0.5)),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                ImageWidget(image: AppImages.splashImg),
                SizedBox(
                  height: 30,
                ),
                BlackTextHeading(
                  text: 'Get things done with TODo',
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Lorem ipsum dolor sit amet,',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor),
                ),
                Text(
                  'consectetur adipisicing. Maxime,',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor),
                ),
                Text(
                  'tempore! Animi nemo aut atque,',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor),
                ),
                Text(
                  ' deleniti nihil dolorem repellendus.',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor),
                ),
                SizedBox(
                  height: 30,
                ),
                AppLoader(),
                // SpinKitCircle(
                //   color: AppColors.btnColor,
                // ),
                // CircularProgressIndicator(
                //   color: AppColors.btnColor,
                // ),
                ButtonWidget(
                    text: 'Get Started',
                    ontap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SignupView()));
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
