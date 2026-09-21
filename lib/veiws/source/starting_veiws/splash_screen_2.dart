import 'package:flutter/material.dart';
import 'package:todoapp/veiws/source/app_veiw/home_screen.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_in.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_up.dart';
import 'package:todoapp/veiws/source/starting_veiws/splash_screen_3.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';
import 'package:todoapp/veiws/utills/constants/images.dart';
import 'package:todoapp/veiws/utills/constants/text.dart';

import '../../components/text_widget.dart';
class SplashScreen2 extends StatefulWidget {
   SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  PageController pageController=PageController();

  int currentPage=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(100,65),
                colors: [
                  ToDoAppcolors.PrimaryColor1,
                  ToDoAppcolors.PrimaryColor2,
                  ToDoAppcolors.PrimaryColor3,
                ])
        ),
        child: Column(children: [
          SizedBox(
            height: 550,
            child: PageView(
              reverse: false,
              controller: pageController,
              onPageChanged: (index){
                setState(() {
                  currentPage=index;
                });
              },
              children: [

                   Container(
                   height: double.infinity,
                   width: double.infinity,
             decoration: BoxDecoration(
                   gradient: LinearGradient(
                    begin: Alignment(100,65),
                      colors: [
                    ToDoAppcolors.PrimaryColor1 ,
                    ToDoAppcolors.PrimaryColor2,
                    ToDoAppcolors.PrimaryColor3,
                    ]),
                                     ),
                    child: Center(
                    child: Column(children: [
                    SizedBox(height: 90,),
                    Center(
                    child: Image.asset(images.onboarding_pic_2),
                    ),
                    SizedBox(height: 50,),
                    Center(
                    child: TextWidget1(text: 'Plan  Your  Task  To Do, that\n way  you`ll  stay  organize\n  and you won`t skip any', color: ToDoAppcolors.fontcolor, size: 18,weight: FontWeight.w600,),
                    ),



                                                    ],),
                                                    ),
                    ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(100,65),
                        colors: [
                          ToDoAppcolors.PrimaryColor1 ,
                          ToDoAppcolors.PrimaryColor2,
                          ToDoAppcolors.PrimaryColor3,
                        ]),
                  ),
                  child: Center(
                    child: Column(children: [
                      SizedBox(height: 90,),
                      Center(
                        child: Image.asset(images.onboarding_pic_3),
                      ),
                      SizedBox(height: 50,),
                      Center(
                        child: TextWidget1(text: 'Make a full schedule for\n the whole week and stay\n organized and productive\n all days', color: ToDoAppcolors.fontcolor, size: 18,weight: FontWeight.w600,),
                      ),



                    ],),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(100,65),
                        colors: [
                          ToDoAppcolors.PrimaryColor1 ,
                          ToDoAppcolors.PrimaryColor2,
                          ToDoAppcolors.PrimaryColor3,
                        ]),
                  ),
                  child: Center(
                    child: Column(children: [
                      SizedBox(height: 90,),
                      Center(
                        child: Image.asset(images.onboarding_pic_4),
                      ),
                      SizedBox(height: 50,),
                      Center(
                        child: TextWidget1(text: 'create a team task, invite\n people and manage your\n work together', color: ToDoAppcolors.fontcolor, size: 18,weight: FontWeight.w600,),
                      ),



                    ],),
                  ),
                ),



              ],
            ),
          ),
          SizedBox(height: 110,),

          Center(child:
          Row(

            children: [
              SizedBox(width: 120,),
              Container(
                height: 5,
                width: 20,

                decoration: BoxDecoration(
                  color: ToDoAppcolors.fontcolor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 5,
                width: 20,

                decoration: BoxDecoration(
                  color: ToDoAppcolors.fontcolor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 5,
                width: 20,

                decoration: BoxDecoration(
                  color: ToDoAppcolors.fontcolor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              SizedBox(width: 40,),
              ElevatedButton(onPressed: ()
              {
                if (currentPage < 2) {
                  // Next page
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Last page
                 Navigator.push(
                   context,MaterialPageRoute(builder: (context)=>  Sign_up()),
                 );
                }

              },
                  child:
                  currentPage == 2?TextWidget1(text: "Start", color: ToDoAppcolors.PrimaryColor1, size:17)
                      :Icon(Icons.arrow_forward,size: 20,color: ToDoAppcolors.PrimaryColor1,)),
            ],
          ),),


        ],),
      )
             ,
    );
  }
}







