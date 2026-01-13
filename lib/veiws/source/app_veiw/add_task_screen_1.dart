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
      body:Column(
        children: [
          TextWidget(text: 'Add your Task', textSize: 25, weight: FontWeight.bold),
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
          TextButton(onPressed: ()
          async{

           await FirebaseFirestore.instance.collection('All Task').doc().set(
            {
              'Title':titleController.text.trim(),
              'Task':taskController.text.trim(),
            }
           ).then((onValue){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
           });
          }, child: TextWidget(text: 'Add Task+', textSize: 20, weight: FontWeight.bold))
        ],
      ),
    );
  }
}
