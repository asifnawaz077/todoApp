import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Controller/constants/app-colors/app-colors.dart';
import 'package:todo_app/Controller/constants/app-images/app-images.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/blacktext-heading-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/button-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/image-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/textfromfieldwidget.dart';
import 'package:todo_app/Controller/constants/app-loader/apploader.dart';
import 'package:todo_app/View/starting_view/intro_view/introview.dart';
import '../../../Controller/constants/app-images/widgets/normal-text-widget.dart';
import '../login_view/signupview.dart';

class SignInView extends StatefulWidget {
  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordHidden = true; // State to manage password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bGColor,
      body: Column(
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
                    bottomLeft: Radius.circular(100),
                  ),
                  color: Color(0xff55847A).withOpacity(0.5),
                ),
              ),
              Container(
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  color: Color(0xff55847A).withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 100),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SignupView()),
                    );
                  },
                  icon: Image(image: AssetImage(AppImages.backarrow)),
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                BlackTextHeading(text: 'Welcome Back!'),
                SizedBox(height: 15),
                ImageWidget(image: AppImages.loginImg),
                SizedBox(height: 10),
                TextFromFieldWidget(
                  controller: emailController,
                  hintText: 'Enter your Email address',
                ),
                // Password Field with Show/Hide Icon
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: AppColors.whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: isPasswordHidden,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordHidden = !isPasswordHidden;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                NormalTextWidget(
                  textColor: AppColors.btnColor,
                  text: 'Forgot Password?',
                ),
                SizedBox(height: 10),
                isLoading
                    ? AppLoader()
                    : ButtonWidget(
                  ontap: () async {
                    isLoading = true;
                    setState(() {});
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text,
                    )
                        .then((value) {
                      isLoading = false;
                      setState(() {});
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => OnBoardingView()),
                      );
                    })
                        .onError((error, stackTrace) {
                      isLoading = false;
                      setState(() {});
                      Get.snackbar(
                        'Error',
                        '${error.toString()}',
                        backgroundColor: AppColors.btnColor,
                      );
                      print('Error: $error');
                    });
                  },
                  text: 'Log In',
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalTextWidget(
                      textColor: AppColors.blackColor,
                      text: "Don't have an account? ",
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => SignupView()),
                        );
                      },
                      child: NormalTextWidget(
                        textColor: AppColors.btnColor,
                        text: 'Sign Up',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
