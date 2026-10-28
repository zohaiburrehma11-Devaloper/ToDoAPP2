import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/text_widget.dart';

import '../../utills/constants/colors.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(100, 65),
              colors:[
                ToDoAppcolors.PrimaryColor1,
                ToDoAppcolors.PrimaryColor2,
                ToDoAppcolors.PrimaryColor3,
              ])
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 40,),
            Row(children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new,color: ToDoAppcolors.fontcolor,)),
              SizedBox(width: 60,),
              TextWidget1(
                  text: 'Manage Your Time',
                  color: ToDoAppcolors.fontcolor,
                  size: 22),
            ],)
          ],
        ),
      ),
    );
  }
}
