import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/coustum_Textformfield.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/app_veiw/home_screen.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left :1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TextWidget1(text: 'UserName', color: Colors.white, size: 20, weight: FontWeight.w300),
          ),
          SizedBox(height: 9,),
          CoustomTextFormFields(
            hint: 'Enter your name',
            n1controller: namecontroller,
          ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextWidget1(text: 'Email', color: Colors.white, size: 20, weight: FontWeight.w300),
            ),

            SizedBox(height: 9,),

          CoustomTextFormFields(
              hint: 'Enter Email Address',

              n1controller: emailcontroller,
          ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextWidget1(text: 'Password', color: Colors.white, size: 20, weight: FontWeight.w300),
            ),
            SizedBox(height: 9,),
          CoustomTextFormFields(
              hint: 'Enter your Password',
              secure: true,
              n1controller: passwordcontroller,
          ),
        SizedBox(height: 40,),
            Center(
                child:InkWell(
                  onTap: (){
                    //--authentication ------------
                    //. then((value){

                    FirebaseAuth.
                    instance.
                    createUserWithEmailAndPassword(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim()
                    ).then((value)
                    async{

                      String docid=FirebaseAuth.instance.currentUser!.uid;
                      await FirebaseFirestore.instance.collection('user-data').doc(docid).set({
                        'name':namecontroller.text,
                        'email':emailcontroller.text,

                      });                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(' Login SucessFully'))
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeSreen()));
                    }).onError((error,handleError){
                      print(error);
                      ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text(" Error Try Again or check Internet:${error.toString()}"))
                      );
                    });



                  },
                  /* .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data inserted successfully"),
          backgroundColor: Colors.green,
        ),
      );
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    });
                  *
                  *  */
                  child:
                  Container(
                    height:58 ,
                    width: 380,
                    decoration: BoxDecoration(
                      color: ToDoAppcolors.PrimaryColor2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    Center(child:
                    TextWidget1(
                      text: 'Register', color: ToDoAppcolors.PrimaryColor1, size: 19,
                    ),
                    ),
                  ),
                )

              ),

            SizedBox(height: 25,),

            Center(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                Container(
                  height: 1,
                  width: 160,
                  color: Colors.white,
                ),
                TextWidget1(text: 'Or', color: ToDoAppcolors.PrimaryColor1, size: 18),
                Container(
                  height: 1,
                  width: 160,
                  color: Colors.white,
                ),
              ],),
            ),//line After Login or Signup






        ],),
      ),
    );
  }
}


























































// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:todoapp/veiws/components/coustom_button.dart';
// import 'package:todoapp/veiws/components/text_widget.dart';
// import 'package:todoapp/veiws/source/auth_veiws/sign_in.dart';
// import 'package:todoapp/veiws/utills/constants/colors.dart';
// import 'package:todoapp/veiws/utills/constants/images.dart';
// import '../../components/coustom_textformfeild_auth.dart';
// import '../../components/password_textformfeild_auth.dart';
// import '../app_veiw/home_screen.dart';
// import '../starting_veiws/onboarding_screen.dart';
// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   TextEditingController emailcontroller=TextEditingController();
//   TextEditingController passwordcontroller=TextEditingController();
//   TextEditingController nameController=TextEditingController();
//   TextEditingController genderController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//           SizedBox(height: 50,),
//           Center(child:
//             TextWidget(text: 'Create Account', textSize: 25, weight: FontWeight.bold,)
//             ,),
//             SizedBox(height: 50,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(width: 5,),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextWidget(
//                   text: 'Sign up',
//                   textSize: 20,
//                   weight: FontWeight.w700,
//                   textcolor: ToDoAppcolors.PrimaryColor1,
//                 ),
//               ),
//             ],
//           ),
//             SizedBox(height: 20,),
//             Row(children: [
//               SizedBox(width: 10,),
//               Icon(Icons.perm_identity,size: 17,),
//               SizedBox(width: 10,),
//               TextWidget(text: 'Your user name',
//                 textSize: 12,
//                 weight: FontWeight.w400,
//                 textcolor: ToDoAppcolors.PrimaryColor2,)
//             ],),
//             SizedBox(height: 7,),
//             CoustomTextformfeildAuth(
//               text: 'Enter your Name',
//               N_controller: nameController,
//             ),
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
//             CoustomTextformfeildAuth(
//               text: 'Enter your Email Address',
//               N_controller: emailcontroller,
//             ),
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
//             PasswordTextformfeildWidget(
//               text: 'Enter your password',
//               iconcolor: ToDoAppcolors.PrimaryColor2, N_controller: passwordcontroller,
//               posticon: Icons.visibility,
//               tap: (){},
//             ),
//             SizedBox(height: 30,),
//
//             CoustomTextformfeildAuth(text: 'Enter your gender', N_controller:genderController ),
//
//             SizedBox(height: 50,),
//             CoustomButton(Navigate_to: ()
//
//             async
//             {
//
//               await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                   email: emailcontroller.text,
//                   password: passwordcontroller.text
//               ).then((onValue) async{
//                 final uid= FirebaseAuth.instance.currentUser!.uid;
//                 await FirebaseFirestore.instance.collection('Signindata').
//                 doc(uid).
//                 set(
//                     {
//                       'Name':nameController.text,
//                       'id':uid,
//                       'Email':emailcontroller.text,
//                       'Password':passwordcontroller.text,
//                       'Gender':genderController.text,
//
//                     });
//                 emailcontroller.clear();
//                 passwordcontroller.clear();
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
//               }
//               )
//                   .onError((error, handleError) {
//                  ScaffoldMessenger.of(context).showSnackBar(
//
//                  SnackBar(
//                    behavior: SnackBarBehavior.floating,
//                    backgroundColor: ToDoAppcolors.PrimaryColor2,
//                      content: TextWidget(text: error.toString(), textSize: 12, weight:FontWeight.w500,textcolor: ToDoAppcolors.Default,))
//                  );
//
//               });
//             }
//                 , sign_text: 'Sign up'),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//               SizedBox(width: 100,),
//               Text('Already a user?',style: GoogleFonts.roboto(color: ToDoAppcolors.PrimaryColor2,fontSize: 13),),
//                TextButton(onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
//
//                }, child: TextWidget(text: 'Sign in', textSize: 13, weight: FontWeight.w400,textcolor: ToDoAppcolors.PrimaryColor1,))
//             ],),
//
//             TextWidget(text: 'OR', textSize: 20, weight: FontWeight.bold),
//             Divider(thickness: 1,),
//            Center(child: Image.asset(images.SocialLogin),),
//
//
//         ],),
//       ),
//     );
//   }
// }
