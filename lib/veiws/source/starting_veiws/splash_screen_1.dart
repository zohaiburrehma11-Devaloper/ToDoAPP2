import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/app_veiw/home_screen.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_in.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_up.dart';
import 'package:todoapp/veiws/source/starting_veiws/splash_screen_2.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';
import 'package:todoapp/veiws/utills/constants/images.dart';

class SplashScreen_1 extends StatefulWidget {
  const SplashScreen_1({super.key});

  @override
  State<SplashScreen_1> createState() => _SplashScreen_1State();
}

class _SplashScreen_1State extends State<SplashScreen_1> {
  @override

  void initState(){
    super.initState();
    ISLogin();
  }
   ISLogin()
   async{
     User? userid=await FirebaseAuth.instance.currentUser;
    if(userid==null||userid=="")
      {
        Future.delayed(const Duration(seconds: 13,),
                (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context){
                return SplashScreen2();
              } ));
            });
      }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeSreen()));
    }
   }
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
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
        child: Column(
          children: [
            SizedBox(height: 200,),
           Center(
             child: CircleAvatar(
               radius: 45,
               backgroundColor: Colors.transparent,
               child: Image.asset(images.onboarding_pic_1,fit: BoxFit.cover,),
             ),
           )   ,
            SizedBox(height: 50,),
            TextWidget1(
                text: 'TO DO',
                color: ToDoAppcolors.fontcolor,
                size: 20,
              weight: FontWeight.bold,
            ),
           SizedBox(height: 200,),

            Center(child:
              TextWidget1(text: 'v :1.0.0', color: ToDoAppcolors.fontcolor, size: 18),)

          ],
        ),
      ),
    );
  }
}

































// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:todoapp/veiws/source/app_veiw/home_screen.dart';
// import 'package:todoapp/veiws/source/auth_veiws/sign_in.dart';
// import 'package:todoapp/veiws/utills/constants/images.dart';
//
// import '../../utills/constants/colors.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   void initState(){
//     //TODO IMPLEMENT INITSTATE
//     super.initState(
//
//     );
//     isLogin();
//   }
//   void   isLogin()
//   async{
//     // String userid=  FirebaseAuth.instance.currentUser;
//     var userid=FirebaseAuth.instance.currentUser;
//     if(userid==null  ){
//          Future.delayed(Duration(seconds: 3),
//              (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
//
//              }
//          );
//          //aur ya website per kam nahi karega.........***
//
//       //here it check the existing user id if any one match then if will false and else executed
//       //but if (if ) will true then control go to login screen for authentication
//     }
//     else {
//       Future.delayed(Duration(seconds: 3),(){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
//       });
//             }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ToDoAppcolors.Default,
//       body:
//       Center(
//         child:Container(
//           height: 100,
//           width: 110,
//           decoration: BoxDecoration(
//             image: DecorationImage(image: AssetImage(images.onboarding_pic)),
//             color: ToDoAppcolors.Default,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(width: 2,color: ToDoAppcolors.PrimaryColor1),
//
//           ),
//         ),
//       ),
//     );
//   }
// }
