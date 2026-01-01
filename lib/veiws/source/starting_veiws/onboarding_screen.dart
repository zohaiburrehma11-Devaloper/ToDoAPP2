import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_up.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';
import 'package:todoapp/veiws/utills/constants/images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToDoAppcolors.Default,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
             SizedBox(height: 40,),
          Center(
              child: Image(image: AssetImage(images.onboarding_pic),)
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left:  20.0),
            child: Center(
              child:TextWidget(text: 'Simplify, Organize, and            ', textSize: 23, weight: FontWeight.bold)
            ),
          ),

          RichText(text: TextSpan(children: [
            TextSpan( text: '   Conquer  ',style: GoogleFonts.roboto(fontSize: 30,color: ToDoAppcolors.PrimaryColor2,fontWeight: FontWeight.bold)),
            TextSpan(text: ' Your Day',style: GoogleFonts.roboto(color: ToDoAppcolors.PrimaryColor1,fontSize: 30,fontWeight: FontWeight.bold))
          ])),
          Center(child: TextWidget(text: '     Take control of your task and  ', textSize: 15, weight: FontWeight.w300,textcolor: Color(0xff333333),)),
          Center(child: TextWidget(text: '     acheive your goals.  ', textSize: 15, weight: FontWeight.w300,textcolor: Color(0xff333333),)),
          SizedBox(height: 23,),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
              },
              child: Container(
                height:53 ,
                width: 330,
                decoration: BoxDecoration(
                  color: ToDoAppcolors.PrimaryColor1,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Center(child: TextWidget(text: 'Lets Start', textSize: 18, weight: FontWeight.w700,textcolor: ToDoAppcolors.Default,),),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
// Text.rich(TextSpan(children:[
// TextSpan(text: 'Simplify, Organize, And Conquer',style: GoogleFonts.roboto(color: ToDoAppcolors.PrimaryColor2)),
// TextSpan(text: 'Your ',style: GoogleFonts.roboto(color: ToDoAppcolors.PrimaryColor1)),
// ])),

