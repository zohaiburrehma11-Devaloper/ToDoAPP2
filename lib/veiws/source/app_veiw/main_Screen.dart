import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/app_veiw/Task_List.dart';
import 'package:todoapp/veiws/source/app_veiw/add_task_screen1.dart';
import 'package:todoapp/veiws/source/app_veiw/calender_screen.dart';
import 'package:todoapp/veiws/source/app_veiw/homescreen.dart';
import 'package:todoapp/veiws/source/app_veiw/settings_profile.dart';
import 'package:todoapp/veiws/source/app_veiw/tasks_datail.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';
import 'package:todoapp/veiws/utills/constants/images.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:material_symbols_icons/symbols_map.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
String docid=FirebaseAuth.instance.currentUser!.uid;


class _MainScreenState extends State<MainScreen> {
  int Selected=0 ;  //Screen change kerna variable ha...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       floatingActionButton: FloatingActionButton(onPressed: ()
       {
                showModalBottomSheet(
                    context: context,

                    isScrollControlled: true,
                    builder: (context)
                    {
                      return FractionallySizedBox(
                      heightFactor: 0.65,
                          child: AddTaskScreen1()
                      );
                    },
                )          ;
       },
         child: CircleAvatar(
           child:
             Icon(Icons.add,color: ToDoAppcolors.PrimaryColor1,),
           ),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(45),

         ),

         backgroundColor: ToDoAppcolors.PrimaryColor1,
           foregroundColor: ToDoAppcolors.PrimaryColor1,
       ),

      body: Selected==0?
      Homescreen():
      Selected==1?
      TaskList():
      Selected==2?
      CalenderScreen():
      Selected==3?SettingsProfile():Homescreen(),
     
          bottomNavigationBar: BottomAppBar(

            color: Colors.transparent,
            height: 70,
            elevation: 10,
            shape: CircularNotchedRectangle(),
            notchMargin: 8,
            clipBehavior: Clip.none,
            shadowColor: Colors.blueAccent,
            surfaceTintColor: Colors.transparent,
            padding: EdgeInsets.all(10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              IconButton(
                onPressed: ()
                {
                  setState(() {
                    Selected=0;
                  });
                }
                  ,
                icon:
                Icon(
                  Icons.home_filled,
                  color:Selected==0? ToDoAppcolors.signcolor:ToDoAppcolors.fontcolor,), ),


                IconButton(
                  onPressed: ()
                  {
                    setState(() {
                      Selected=1;
                    });
                  },
                  icon:
                  Icon(
                    Icons.format_list_numbered,
                    color: Selected==1? ToDoAppcolors.signcolor:ToDoAppcolors.fontcolor,), ),
                     SizedBox(width: 50,),
                IconButton(
                  onPressed: ()
                  {
                    setState(() {
                      Selected=2;
                    });
                  },
                  icon:
                  Icon(
                    Icons.calendar_month_outlined,
                    color: Selected==2? ToDoAppcolors.signcolor:ToDoAppcolors.fontcolor,), ),

                  IconButton(
                      onPressed: ()
                            {
                              setState(() {
                                Selected=3;
                              });
                            },
                       icon:
                    Icon(
                      Icons.settings,
                      color:Selected==3? ToDoAppcolors.signcolor:ToDoAppcolors.fontcolor,), ),
                              ],),
                         ),
             
     
     
     
      
      
    );
  }
}
// onTap:
// data['Status']=="incomplete"?
// ()
//
// async{
// await FirebaseFirestore.
// instance.
// collection('user-data').
// doc(FirebaseAuth.instance.currentUser!.uid).
// collection('Task_data').
// doc( taskid).
// update(
//
// {
// 'Status':'completed',
// });
// }:null,
// Logout Code
// InkWell(
//     onTap: ()
//     async{
//     await FirebaseAuth.instance.signOut().then((onValue){
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content:
//             TextWidget1(
//                 text: "you are Log outed",
//                 color: ToDoAppcolors.fontcolor,
//                 size: 20)
//         )
//       );
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
//     });
//     },
//     child: Icon(Icons.logout,color: Colors.deepPurpleAccent,)),
// TextWidget1(text: 'Logout', color: Colors.deepPurpleAccent, size: 18)

