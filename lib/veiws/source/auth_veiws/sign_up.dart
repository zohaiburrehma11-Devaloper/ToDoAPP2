
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/coustum_Textformfield.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/app_veiw/home_screen.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_in.dart';

import 'package:todoapp/veiws/utills/constants/colors.dart';

import '../../utills/constants/images.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController  namecontroller=TextEditingController();
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
                const SizedBox(height: 22,),
                Center(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(images.onboarding_pic_1,fit: BoxFit.cover,),
                  ),
                )   ,
                SizedBox(height: 36,),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: TextWidget1(text: 'Welcome to DO IT ', color:ToDoAppcolors.fontcolor , size: 20,weight: FontWeight.w700,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: TextWidget1(text: 'create an account join us now ! ', color:ToDoAppcolors.fontcolor , size: 17,weight: FontWeight.w300,),
                ),
                SizedBox(height: 48,),

                CoustomTextFormFields(
                  icons: Icons.person,
                  hint: 'Name',
                  n1controller: namecontroller,
                ),

                SizedBox(height: 38,),

                CoustomTextFormFields(
                  icons: Icons.email,
                  hint: 'E-mail',
                  n1controller: emailcontroller,
                ),

                const SizedBox(height: 38,),




                CoustomTextFormFields(
                  icons: Icons.lock,
                  hint: 'Enter your Password',
                  secure: true,
                  n1controller: passwordcontroller,
                ),
                SizedBox(height: 18,),

                Padding(
                  padding: const EdgeInsets.only(left: 190.0),
                  child: InkWell(
                      child: TextWidget1(
                          text: 'forgot password?',
                          color: ToDoAppcolors.fontcolor,
                          size: 17)),
                ),
                const SizedBox(height: 33,),

                // --- Login Button ---
                Center(
                  child: InkWell(
                    onTap: () {
                      // Firebase Login Logic
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim(),
                      ).then((value)async {


                          // Firebase Authentication se current user ki UID
                          String uid = FirebaseAuth.instance.currentUser!.uid;

                          // Firestore mein user ka data save
                          await FirebaseFirestore.instance
                              .collection('Signindata')
                              .doc(uid)
                              .set({
                            'User ID': uid,
                            'Name': namecontroller.text.trim(),
                            'Email': emailcontroller.text.trim(),
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sign up Successfully'),
                            ),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeSreen(),
                            ),
                          );

                        // Success SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Sign up Successfully'))
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
                          text: 'Sign Up',
                          color: ToDoAppcolors.fontcolor,
                          size: 19,
                        ),
                      ),
                    )       ,
                  ),
                ),

                const SizedBox(height: 22,),

                // --- "Or" Divider Line ---


                // --- Don't have an account? Sign Up ---
                Center(
                  child: InkWell(
                    onTap: () {
                      // Yahan se user SignUp screen par ja sakta hai
                      Navigator.pop(context); // Agar aap pehle SignUp se aaye hain
                      // Agar direct open kiya hai to niche wali line un-comment karein:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen() ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget1(text: "Already have an account? ", color: Colors.white, size: 15),
                        TextWidget1(text: "Sign in", color: ToDoAppcolors.signcolor, size: 15, weight: FontWeight.bold),
                      ],
                    ),
                  ),
                ),


                SizedBox(height: 50,),

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

