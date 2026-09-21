import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/coustum_Textformfield.dart';

import '../../components/text_widget.dart';
import '../../utills/constants/colors.dart';
  class AddTaskScreen1 extends StatelessWidget {
     AddTaskScreen1({super.key});
  TextEditingController Titlecontroller=TextEditingController();
  TextEditingController Taskcontroller=TextEditingController();
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Add Task'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: 90,),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: TextWidget1(text: 'Title', color: Colors.white, size: 18, weight: FontWeight.w300),
              ),
          SizedBox(height: 9,),
          CoustomTextFormFields(hint: 'Enter your Task Title', n1controller: Titlecontroller,),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: TextWidget1(text: 'Task', color: Colors.white, size: 18, weight: FontWeight.w300),
              ),
              SizedBox(height: 9,),
          CoustomTextFormFields(hint: 'Enter your Task ', n1controller: Taskcontroller,),
           SizedBox(height: 30,),
           TextButton(onPressed: ()
           async{
             if(Titlecontroller.text.trim().isEmpty)
               {
                 if(Taskcontroller.text.trim().isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('Please fill All Feilds'))
                   );
                 }
                 return;
               }
             String tasksid= DateTime.now().toString();
             String Docid= FirebaseAuth.instance.currentUser!.uid;
             await FirebaseFirestore.instance.collection('user-data').doc(Docid).collection('Task_data').doc().set({
               'Title':Titlecontroller.text,
               'Task':Taskcontroller.text,
                'Taskid':tasksid,
               'Status':'incomplete',
             }).then((onValue){
               Navigator.pop(context);
             }).onError((error,handleError){
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text("Task not added Error Accour"))
               );
             });
           },
               child: Container(
                 height:40 ,
                 width: 320,
                 decoration: BoxDecoration(
                   color: ToDoAppcolors.PrimaryColor2,
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child:
                 Center(child:
                 TextWidget1(
                   text: 'Add', color: ToDoAppcolors.PrimaryColor1, size: 19,
                 ),
                 ),
               ),)
          ],
                ),
        ),
      );
    }
  }
