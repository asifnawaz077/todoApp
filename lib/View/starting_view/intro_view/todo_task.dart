import 'package:flutter/material.dart';
import 'package:todo_app/Controller/constants/app-colors/app-colors.dart';
import 'package:todo_app/Controller/constants/app-images/app-images.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/blacktext-heading-widget.dart';
import 'package:todo_app/Controller/constants/app-images/widgets/normal-text-widget.dart';

class TodoTask extends StatelessWidget {
  const TodoTask({super.key});

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
                height: 270,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(),
                    color: Color(0xff55847A).withOpacity(0.5),),
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
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100)),
                    color: Color(0xff55847A).withOpacity(0.5)),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 118.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/Asif.png'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlackTextHeading(text: 'Welcome Fisayami')
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Image(
              image: AssetImage(AppImages.welcomeImg2),
              height: 195,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: BlackTextHeading(text: 'Todo Tasks.'),
          ),
          Center(
            child: Container(
              height: 270,
              width: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0,left: 28,right: 28),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Dairy  Tasks.',style: TextStyle(color: Colors.grey),),
                      trailing: Image(image: AssetImage('assets/Add.png')),
                    ),
                    ListTile(
                      leading: Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(color: Color(0xff55847A),border: Border.all(width: 2)),
                      ),
                      title: Text('Follow Oluwafisayomi.dev on Twitter.',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                    ListTile(
                      leading: Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(color: Color(0xff55847A),border: Border.all(width: 2)),
                      ),
                      title: Text('Learn Figma by 4pm.',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                    ListTile(
                      leading: Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(color: Colors.white,border: Border.all(width: 2)),
                      ),
                      title: Text("Coding at 9am.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                    ListTile(
                      leading: Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(color:Colors.white,border: Border.all(width: 2)),
                      ),
                      title: Text('Watch Mr Beasts Videos.',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
