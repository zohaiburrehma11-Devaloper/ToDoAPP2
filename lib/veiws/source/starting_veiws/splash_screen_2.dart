import 'package:flutter/material.dart';
import 'package:todoapp/veiws/source/starting_veiws/splash_screen_3.dart';
import 'package:todoapp/veiws/utills/constants/text.dart';

import '../../components/text_widget.dart';
class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: Column(
        children: [
          ListTile(
            leading:  TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (Builder){
                return SplashScreen3();
              })) ;
            }, child: Text('skip',style: TextStyle(color: Colors.white54,fontSize: 15),)),
          ),

          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 170,
                child: Image.asset('Todo_Images/onboarding_image/Splash-2.png',fit: BoxFit.cover,),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 5,
              width: 120,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    height: 3,
                    width: 20,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 3,
                    width: 20,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 3,
                    width: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),  //   Animated Row
          SizedBox(height: 30,),
          TextWidget1(text: 'Manage your tasks', color: Colors.white, size: 32,weight: FontWeight.w700,),
          SizedBox(height: 10,),
          Center(
            child: TextWidget1(
                text: 'You can easily manage all of your daily \n            tasks in DoMe for free', color: Colors.white, size: 16, weight: FontWeight.w200),),

          SizedBox(height: 150,),
          Row(children: [
            TextButton(onPressed: (){},
                child:
            Text('Back',
              style:
            TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.w500),)),
            SizedBox(width: 220,),
            Container(
              height: 48,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),


              child:
              Center(child:
              InkWell(
                  child: TextWidget1(text: 'Next', color: Colors.white, size: 25, weight: FontWeight.w600)),),
            )
          ],),
          SizedBox(height: 50,),

          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: Container(
              height: 5,
              width: 135,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
