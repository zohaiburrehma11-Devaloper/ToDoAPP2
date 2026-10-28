import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient
            (
            begin: Alignment(100, 65),
              colors:[
             ToDoAppcolors.PrimaryColor1,
             ToDoAppcolors.PrimaryColor2,
             ToDoAppcolors.PrimaryColor3,
          ] ),
        ),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 40,),
              Row(          //Title Row
                children: [

                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new)),
                  SizedBox(width: 40,),

                  TextWidget1(
                      text: 'Settings',
                      color: ToDoAppcolors.fontcolor,
                      size: 22)


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
