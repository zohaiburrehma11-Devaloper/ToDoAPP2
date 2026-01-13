import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/coustom_button.dart';
import '../../components/coustom_textformfeild_auth.dart';
import '../../components/password_textformfeild_auth.dart';
import '../../components/text_widget.dart';
import '../../utills/constants/colors.dart';
import '../../utills/constants/images.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Center(child:
          TextWidget(text: 'Welcome Back', textSize: 25, weight: FontWeight.bold,)
            ,),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget(
                  text: 'Login',
                  textSize: 20,
                  weight: FontWeight.w700,
                  textcolor: ToDoAppcolors.PrimaryColor1,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),


          SizedBox(height: 25,),

          Row(children: [
            SizedBox(width: 10,),
            Icon(Icons.mail_outline_outlined,size: 17,),

            SizedBox(width: 10,),

            TextWidget(
              text: 'Your Email',
              textSize: 12,
              weight: FontWeight.w400,
              textcolor: ToDoAppcolors.PrimaryColor2,
            )

          ],),
          SizedBox(height: 7,),

          CoustomTextformfeildAuth(
            text: 'Enter your Email Address',
            N_controller: emailcontroller,
          ),

          SizedBox(height: 25,),
          Row(children: [
            SizedBox(width: 10,),
            Icon(Icons.lock_outline,size: 17,),
            SizedBox(width: 10,),

            TextWidget(
              text: 'Password',
              textSize: 12,
              weight: FontWeight.w300,
              textcolor: ToDoAppcolors.PrimaryColor2,
            )
          ],),
          SizedBox(height: 7,),
          PasswordTextformfeildWidget(
            text: 'Enter your password',
            iconcolor: ToDoAppcolors.PrimaryColor2, N_controller: passwordcontroller,
            posticon: Icons.visibility,
            tap: (){},
          ),
          TextButton(onPressed: (){

          }, child: TextWidget(textcolor: ToDoAppcolors.PrimaryColor1,text: 'Forgot Password?', textSize: 12, weight: FontWeight.w400)),

          SizedBox(height: 50,),

          CoustomButton(Navigate_to: () {

          }, sign_text: 'Login',),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 100,),
              Text('Don`t have an account?',style: GoogleFonts.roboto(color: ToDoAppcolors.PrimaryColor2,fontSize: 13),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));

              }, child: TextWidget(text: 'Sign up', textSize: 13, weight: FontWeight.w400,textcolor: ToDoAppcolors.PrimaryColor1,))
            ],),
          TextWidget(text: 'OR', textSize: 20, weight: FontWeight.bold),
          Divider(thickness: 1,),
          Center(child: Image.asset(images.SocialLogin),),


        ],
      ),
    );
  }
}
