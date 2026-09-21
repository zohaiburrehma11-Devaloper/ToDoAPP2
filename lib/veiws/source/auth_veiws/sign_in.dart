import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/coustum_Textformfield.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/app_veiw/home_screen.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_up.dart';
// Agar aap ne SignUp screen ko import karna hai to niche wali line use karein
// import 'package:todoapp/veiws/source/app_veiw/signup_screen.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';

import '../../utills/constants/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
             padding: const EdgeInsets.only(left: 1.0),
              child:  Container(
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
          ),child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const SizedBox(height: 25,),
                    Center(
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(images.onboarding_pic_1,fit: BoxFit.cover,),
                      ),
                    )   ,
                      SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: TextWidget1(text: 'Welcome Back to DO IT ', color:ToDoAppcolors.fontcolor , size: 20,weight: FontWeight.w700,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: TextWidget1(text: 'Have an other productive day ! ', color:ToDoAppcolors.fontcolor , size: 17,weight: FontWeight.w300,),
                    ),
                      SizedBox(height: 45,),
                      CoustomTextFormFields(
                          icons: Icons.email,
                          hint: 'E-mail',
                      n1controller: emailcontroller,
                      ),

                     const SizedBox(height: 50,),




                          CoustomTextFormFields(
                            icons: Icons.lock,
                       hint: 'Enter your Password',
                      secure: true,
                            n1controller: passwordcontroller,
                      ),
                      SizedBox(height: 20,),

                     Padding(
                       padding: const EdgeInsets.only(left: 190.0),
                       child: InkWell(
                           child: TextWidget1(
                               text: 'forgot password?',
                               color: ToDoAppcolors.fontcolor,
                               size: 17)),
                     ),
                     const SizedBox(height: 35,),

                // --- Login Button ---
                   Center(
                   child: InkWell(
                      onTap: () {
                // Firebase Login Logic
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                       email: emailcontroller.text.trim(),
                         password: passwordcontroller.text.trim(),
                         ).then((value) {
                // Success SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text('Login Successfully'))
                          );
                // Navigate to Home Screen
                        Navigator.pushReplacement(
                        context,
                            MaterialPageRoute(builder: (context) => const HomeSreen())
                        );
                         }).onError((error, handleError) {
                // Error Handling
                        print(error);
                             ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text("Error: ${error.toString()}"))
                          );
                            });
                           },
                         child: Container (
                                  height: 44,
                                  width: 320,
                                decoration: BoxDecoration(
                                  color: ToDoAppcolors.signcolor,
                                borderRadius: BorderRadius.circular(10),
                         ),
                         child: Center(
                        child: TextWidget1(
                          text: 'Login',
                              color: ToDoAppcolors.fontcolor,
                              size: 19,
                       ),
                      ),
                          )       ,
                          ),
                         ),

                            const SizedBox(height: 25,),

                // --- "Or" Divider Line ---


                // --- Don't have an account? Sign Up ---
                         Center(
                      child: InkWell(
                      onTap: () {
                // Yahan se user SignUp screen par ja sakta hai
                     Navigator.pop(context); // Agar aap pehle SignUp se aaye hain
                // Agar direct open kiya hai to niche wali line un-comment karein:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Sign_up()));
                   },
                    child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   TextWidget1(text: "Don't have an account? ", color: Colors.white, size: 15),
                    TextWidget1(text: "Sign Up", color: ToDoAppcolors.signcolor, size: 15, weight: FontWeight.bold),
              ],
               ),
             ),
                   ),


                     SizedBox(height: 80,),

                    Row(children: [
                      SizedBox(
                        width: 55,
                      ),
                      TextWidget1(text: 'Sign in with:', color: ToDoAppcolors.fontcolor, size: 15),
                      SizedBox(width: 14,),
                     Container(height: 45,
                     width: 45,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.white70,
                     ),
                     child: Icon(Icons.apple,color: Colors.black45,),
                     ),
                     SizedBox(width: 15,),
                     Container(height: 45,
                     width: 45,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.white70,
                     ),
                     child: Icon(Icons.g_mobiledata_sharp,color: Colors.deepOrangeAccent,),
                     ),

                    ],)
             ],
                ),
          ),
      ),
    ));
  }
}



































































































// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:todoapp/veiws/source/app_veiw/home_screen.dart';
// import 'package:todoapp/veiws/source/auth_veiws/sign_up.dart';
//
// import '../../components/coustom_button.dart';
// import '../../components/coustom_textformfeild_auth.dart';
// import '../../components/password_textformfeild_auth.dart';
// import '../../components/text_widget.dart';
// import '../../utills/constants/colors.dart';
// import '../../utills/constants/images.dart';
//
// class SignIn extends StatefulWidget {
//   const SignIn({super.key});
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//
//   TextEditingController emailcontroller=TextEditingController();
//   TextEditingController passwordcontroller=TextEditingController();
//   void FetchLogin() //Fetch data class
//   async{
//     String Email=emailcontroller.text;
//     String password=passwordcontroller.text;
//     if(Email.isEmpty||password.isEmpty)
//       {
//         setState(() {
//           loginerror='Email or password connot be empty';
//         });
//       }
//     await
//     FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: emailcontroller.text.trim(),
//       password: passwordcontroller.text.trim(),
//
//
//     ).then((onValue){
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
//     });
//
//   }
//    late String loginerror='';
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             SizedBox(height: 50,),
//             Center(child:
//             TextWidget(text: 'Welcome Back', textSize: 25, weight: FontWeight.bold,)
//               ,),
//             SizedBox(height: 50,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(width: 5,),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextWidget(
//                     text: 'Login',
//                     textSize: 20,
//                     weight: FontWeight.w700,
//                     textcolor: ToDoAppcolors.PrimaryColor1,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20,),
//
//
//             SizedBox(height: 25,),
//
//             Row(children: [
//               SizedBox(width: 10,),
//               Icon(Icons.mail_outline_outlined,size: 17,),
//
//               SizedBox(width: 10,),
//
//               TextWidget(
//                 text: 'Your Email',
//                 textSize: 12,
//                 weight: FontWeight.w400,
//                 textcolor: ToDoAppcolors.PrimaryColor2,
//               )
//
//             ],),
//             SizedBox(height: 7,),
//
//
//             //Email Controller calling
//             CoustomTextformfeildAuth(
//               text: 'Enter your Email Address',
//               N_controller: emailcontroller,
//             ),
//
//
//             //Error code
//             TextWidget(text: '$loginerror',
//               textSize: 10,         //Ager feilds ka data mis match howa to is var ka error text show hoga
//               weight: FontWeight.w400,
//               textcolor: Colors.red,),
//
//
//             SizedBox(height: 25,),
//             Row(children: [
//               SizedBox(width: 10,),
//               Icon(Icons.lock_outline,size: 17,),
//               SizedBox(width: 10,),
//
//               TextWidget(
//                 text: 'Password',
//                 textSize: 12,
//                 weight: FontWeight.w300,
//                 textcolor: ToDoAppcolors.PrimaryColor2,
//               )
//             ],),
//             SizedBox(height: 7,),
//             //PASSWORD FEILD
//             PasswordTextformfeildWidget(
//               text: 'Enter your password',
//               iconcolor: ToDoAppcolors.PrimaryColor2, N_controller: passwordcontroller,
//               posticon: Icons.visibility,
//               tap: (){},
//             ),
//             //Error code
//             TextWidget(text: '$loginerror',
//               textSize: 10,         //Ager feilds ka data mis match howa to is var ka error text show hoga
//               weight: FontWeight.w400,
//               textcolor: Colors.red,),
//
//             //NAvigation Button For fORGOT PASSWORD
//             TextButton(onPressed: (){
//
//             }, child: TextWidget(textcolor: ToDoAppcolors.PrimaryColor1,text: 'Forgot Password?', textSize: 12, weight: FontWeight.w400)),
//
//             SizedBox(height: 50,),
//
//             //Button for sign in method
//             CoustomButton(Navigate_to: (){
//               FetchLogin();
//             } , sign_text: 'Login',),
//
//
//             //Create Account code
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(width: 85,),
//                 Text('Don`t have an account?',style: GoogleFonts.roboto(color: ToDoAppcolors.PrimaryColor2,fontSize: 13),),
//                 TextButton(onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
//
//                 }, child: TextWidget(text: 'Sign up', textSize: 13, weight: FontWeight.w400,textcolor: ToDoAppcolors.PrimaryColor1,))
//               ],),
//             TextWidget(text: 'OR', textSize: 20, weight: FontWeight.bold),
//             Divider(thickness: 1,),
//             Center(child: Image.asset(images.SocialLogin),),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
