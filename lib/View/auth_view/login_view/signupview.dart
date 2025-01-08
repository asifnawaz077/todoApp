import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Controller/constants/app-colors/app-colors.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/button-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/normal-text-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/textfromfieldwidget.dart';
import 'package:todo_app/Controller/constants/app-loader/apploader.dart';
import 'package:todo_app/View/auth_view/signin_view/signinview.dart';
import 'package:todo_app/View/starting_view/splash_view/splashview.dart';
import '../../../Controller/constants/app-images/app-images.dart';
import '../../../Controller/constants/app-images/widgets/blacktext-heading-widget.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 100),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SplashScreen()));
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
                  SizedBox(height: 20),
                  BlackTextHeading(text: 'Welcome Onboard!'),
                  SizedBox(height: 20),
                  NormalTextWidget(
                    text: 'Let’s help you meet up your task',
                    textColor: AppColors.btnColor,
                  ),
                  TextFromFieldWidget(
                    hintText: 'Enter your Email address',
                    controller: emailController,
                  ),
                  TextFromFieldWidget(
                    hintText: 'Create a Password',
                    controller: passwordController,
                    isPassword: true, // Enable password visibility toggle
                  ),
                  TextFromFieldWidget(
                    hintText: 'Confirm your Password',
                    controller: confirmPasswordController,
                    isPassword: true, // Enable password visibility toggle
                  ),
                  SizedBox(height: 10),
                  isLoading
                      ? AppLoader()
                      : ButtonWidget(
                    ontap: () async {
                      isLoading = true;
                      setState(() {});
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text,
                      )
                          .then((value) {
                        isLoading = false;
                        setState(() {});
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => SignInView()));
                      }).onError((error, stackTrace) {
                        isLoading = false;
                        setState(() {});
                        Get.snackbar('Error', '${error.toString()}',
                            backgroundColor: AppColors.btnColor);
                        print('Error: $error');
                      });
                    },
                    text: 'SignUp',
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalTextWidget(
                        textColor: AppColors.blackColor,
                        text: 'Already have an account?',
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SignInView()));
                        },
                        child: NormalTextWidget(
                          textColor: AppColors.btnColor,
                          text: 'Sign In',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
