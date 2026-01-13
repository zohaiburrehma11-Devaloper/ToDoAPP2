import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/veiws/components/coustom_button.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_in.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';
import 'package:todoapp/veiws/utills/constants/images.dart';
import '../../components/coustom_textformfeild_auth.dart';
import '../../components/password_textformfeild_auth.dart';
import '../app_veiw/home_screen.dart';
import '../starting_veiws/onboarding_screen.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 50,),
          Center(child:
            TextWidget(text: 'Create Account', textSize: 25, weight: FontWeight.bold,)
            ,),
            SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget(
                  text: 'Sign up',
                  textSize: 20,
                  weight: FontWeight.w700,
                  textcolor: ToDoAppcolors.PrimaryColor1,
                ),
              ),
            ],
          ),
            SizedBox(height: 20,),
            Row(children: [
              SizedBox(width: 10,),
              Icon(Icons.perm_identity,size: 17,),
              SizedBox(width: 10,),
              TextWidget(text: 'Your user name',
                textSize: 12,
                weight: FontWeight.w400,
                textcolor: ToDoAppcolors.PrimaryColor2,)
            ],),
            SizedBox(height: 7,),
            CoustomTextformfeildAuth(
              text: 'Enter your Name',
              N_controller: nameController,
            ),

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
            SizedBox(height: 50,),
            CoustomButton(Navigate_to: ()

            async
            {

              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailcontroller.text,
                  password: passwordcontroller.text
              ).then((onValue) async{
                String uid= onValue.user!.uid;
                await FirebaseFirestore.instance.collection('User name').
                doc(uid).
                set(
                    {
                      'Name':nameController.text,
                      'id':uid,
                    });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              }
              )
                  .onError((error, handleError) {
                 ScaffoldMessenger.of(context).showSnackBar(

                 SnackBar(
                   behavior: SnackBarBehavior.floating,
                   backgroundColor: ToDoAppcolors.PrimaryColor2,
                     content: TextWidget(text: error.toString(), textSize: 12, weight:FontWeight.w500,textcolor: ToDoAppcolors.Default,))
                 );

              });
            }
                , sign_text: 'Sign up'),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              SizedBox(width: 100,),
              Text('Already a user?',style: GoogleFonts.roboto(color: ToDoAppcolors.PrimaryColor2,fontSize: 13),),
               TextButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));

               }, child: TextWidget(text: 'Sign in', textSize: 13, weight: FontWeight.w400,textcolor: ToDoAppcolors.PrimaryColor1,))
            ],),

            TextWidget(text: 'OR', textSize: 20, weight: FontWeight.bold),
            Divider(thickness: 1,),
           Center(child: Image.asset(images.SocialLogin),),


        ],),
      ),
    );
  }
}
// Column(children: [
// SizedBox(height: 90,),
// TextFormField(
// controller: emailcontroller,
// ),
// TextFormField(
// controller: passwordcontroller,
// ),
// TextButton(onPressed: ()
// async
// {
// await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
// },
// child: Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
// ],)
