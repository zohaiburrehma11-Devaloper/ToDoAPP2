import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/source/app_veiw/home_screen.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_in.dart';
import 'package:todoapp/veiws/utills/constants/images.dart';

import '../../utills/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    //TODO IMPLEMENT INITSTATE
    super.initState(

    );
    isLogin();
  }
  isLogin()
  async{
    // String userid=  FirebaseAuth.instance.currentUser;
    var userid=FirebaseAuth.instance.currentUser;
    if(userid==null ||userid=='' ){
         Future.delayed(Duration(seconds: 5),
             (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));

             }
         );
         //aur ya website per kam nahi karega.........***

      //here it check the existing user id if any one match then if will false and else executed
      //but if (if ) will true then control go to login screen for authentication
    }
    else {
      Future.delayed(Duration(seconds: 7),(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      });
            }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToDoAppcolors.PrimaryColor2,
      body:
      Center(
        child:Container(
          height: 100,
          width: 110,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(images.onboarding_pic)),
            color: ToDoAppcolors.Default,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2,color: ToDoAppcolors.PrimaryColor1),
            
          ),
        ),
      ),
    );
  }
}
