import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/veiws/components/coustom_button.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 80,),
        Center(child:
          TextWidget(text: 'Create Account', textSize: 25, weight: FontWeight.bold,)
          ,),
          SizedBox(height: 60,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextWidget(text: 'Sign up', textSize: 20, weight: FontWeight.w700,textcolor: ToDoAppcolors.PrimaryColor1,),
        ),
          SizedBox(height: 20,),
          Row(children: [
            Icon(Icons.perm_identity,),
            SizedBox(width: 10,),
            TextWidget(text: 'Your user name', textSize: 12, weight: FontWeight.w200,textcolor: ToDoAppcolors.PrimaryColor2,)
          ],),
          SizedBox(height: 30,),

          Row(children: [
            Icon(Icons.mail_outline_outlined,),
            SizedBox(width: 10,),
            TextWidget(text: 'Your Email', textSize: 12, weight: FontWeight.w200,textcolor: ToDoAppcolors.PrimaryColor2,)
          ],),
          SizedBox(height: 30,),
          Row(children: [
            Icon(Icons.lock_outline,),
            SizedBox(width: 10,),
            TextWidget(text: 'Password', textSize: 12, weight: FontWeight.w200,textcolor: ToDoAppcolors.PrimaryColor2,)
          ],),
          CoustomButton(Navigate_to: (){}, sign_text: 'Sign up'),


      ],),
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