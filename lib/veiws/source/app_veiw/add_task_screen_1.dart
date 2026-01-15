import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/veiws/components/coustom_button.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/app_veiw/home_screen.dart';

import '../../utills/constants/colors.dart';

class AddTaskScreen1 extends StatefulWidget {
  const AddTaskScreen1({super.key});

  @override
  State<AddTaskScreen1> createState() => _AddTaskScreen1State();
}

class _AddTaskScreen1State extends State<AddTaskScreen1> {
TextEditingController titleController=TextEditingController();
TextEditingController taskController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToDoAppcolors.secondarycolor2,
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 70,),
            TextWidget(text: 'Add your Task', textSize: 25, weight: FontWeight.bold),
        SizedBox(height: 70,),
        Container(
          height: 44,
          width: 324,
          decoration: BoxDecoration(
            color: ToDoAppcolors.Default,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.5,color:ToDoAppcolors.PrimaryColor2 ),
          ),
          child: TextFormField(
            obscureText: false,
            controller: titleController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: GoogleFonts.poppins(
                color: ToDoAppcolors.PrimaryColor2,
                fontSize: 14,
              ),
              hintText: 'Enter your Task Title',
            ),
          ),
        ),
        SizedBox(height: 40,),
        Container(
        height: 44,
        width: 324,
        decoration: BoxDecoration(
          color: ToDoAppcolors.Default,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5,color:ToDoAppcolors.PrimaryColor2 ),
        ),
        child: TextFormField(
          obscureText: false,
          controller: taskController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: GoogleFonts.poppins(
              color: ToDoAppcolors.PrimaryColor2,
              fontSize: 14,
            ),
            hintText: 'Enter your Task Name',
          ),
        ),
            ) ,
            SizedBox(height: 340,),
            Center(
              child: InkWell(
                onTap: ()
                async{
                  String title=titleController.text.trim();
                  String task=taskController.text.trim();
                  if(title.isEmpty||task.isEmpty)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: ToDoAppcolors.PrimaryColor2,
                        content: TextWidget(
                          text: "Please fill all fields",
                          textSize: 12,
                          weight: FontWeight.w500,
                          textcolor: ToDoAppcolors.Default,
                        ),
                      ),
                    );
                    return; // Stop navigation

                  }
                  await FirebaseFirestore.instance.collection('All Task').doc().set(
                      {
                        'Title':titleController.text.trim(),
                        'Task':taskController.text.trim(),
                      }
                  ).then((onValue){
                    Navigator.pop(context);
                  }).onError((error,handleError){
                  });
                }
                ,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: ToDoAppcolors.Default,
                    border: Border.all(width: 2,color: ToDoAppcolors.PrimaryColor1),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                    TextWidget(text: '+', textSize: 40, weight: FontWeight.bold)),
                  ),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
