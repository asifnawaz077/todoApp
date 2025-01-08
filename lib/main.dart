import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/View/auth_view/login_view/signupview.dart';
import 'package:todo_app/View/auth_view/signin_view/signinview.dart';
import 'package:todo_app/View/starting_view/intro_view/introview.dart';
import 'package:todo_app/View/starting_view/intro_view/todo_task.dart';
import 'package:todo_app/View/starting_view/splash_view/splashview.dart';
import 'package:todo_app/firebase_options.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:// OnBoardingView(),
      //TodoTask()
     SplashScreen(),
       // SignupView(),
      //SignInView(),
    );//
  }
}
