import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';

class Tasks_Detail extends StatelessWidget {
  const Tasks_Detail({super.key,required this.Taskid,required this.taskdata});
  final Map<String,dynamic> taskdata;
 final String  Taskid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(100, 65),
              colors: [
                ToDoAppcolors.PrimaryColor1,
                ToDoAppcolors.PrimaryColor2,
                ToDoAppcolors.PrimaryColor3,
              ]
          )
        ),
        child:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 30,),
            Row(
              children: [
                IconButton(onPressed: ()
                {
                  return Navigator.pop(context);
                },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color:ToDoAppcolors.fontcolor ,
                    size: 25,
                    )),

                SizedBox(width: 100,),

                TextWidget1(text: 'Task Details', color: ToDoAppcolors.fontcolor, size: 17),
              ],
            ),
              SizedBox(height: 100,),



          ],),



        ),

      ) ,
    );
  }
}
