import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/Controller/constants/app-colors/app-colors.dart';
import 'package:todo_app/Controller/constants/app-images/app-images.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/blacktext-heading-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/button-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/normal-text-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/textfromfieldwidget.dart';
import 'package:todo_app/Controller/constants/app-loader/apploader.dart';
import 'package:todo_app/View/auth_view/login_view/signupview.dart';
import 'package:todo_app/View/auth_view/signin_view/signinview.dart';
import 'package:todo_app/View/starting_view/intro_view/todo_task.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  bool isLoading=false;

  insertData()async{
    try
    {
      isLoading=true;
      setState(() {});
      String docid=DateTime.now().microsecondsSinceEpoch.toString();
      await FirebaseFirestore.instance.collection('Test').add({
        'studentName':userNameController.text,
        'cnic':cnicController.text,
        'address':addressController.text,
        'docid':docid
      });
      isLoading=false;
      setState(() {});
    }
    catch(e){
      isLoading=false;
      setState(() {});
      Get.snackbar('Error','${e.toString()}');
    }

  }

  TextEditingController userNameController = TextEditingController();

  TextEditingController cnicController = TextEditingController();

  TextEditingController addressController = TextEditingController();

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
                        bottomLeft: Radius.circular(100)),
                    color: Color(0xff55847A).withOpacity(0.5)),
              ),
              Container(
                height: 200,
                width: 100,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                    color: Color(0xff55847A).withOpacity(0.5)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 100),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => SignInView()));
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
                BlackTextHeading(text: 'Welcome OnBoard!'),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Image(
                    image: AssetImage(AppImages.welcomeImg),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFromFieldWidget(
                    controller: userNameController, hintText: 'User Name'),
                TextFromFieldWidget(
                    controller: cnicController, hintText: 'Cnic'),
                TextFromFieldWidget(
                    controller: addressController, hintText: 'Address'),
                SizedBox(
                  height: 10,
                ),
               isLoading==true?AppLoader():ButtonWidget(ontap: () {
                  insertData();
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>TodoTask()));
                }, text: 'Add to list')
              ],
            ),
          )
        ],
      ),
    );
  }
}
