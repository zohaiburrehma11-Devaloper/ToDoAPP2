import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/text_widget.dart';

import '../utills/constants/colors.dart';
   class CoustomButton extends StatelessWidget {
    const  CoustomButton({super.key,required this.Navigate_to,required this.sign_text});
      final VoidCallback Navigate_to;
      final String sign_text;

     @override
     Widget build(BuildContext context) {
       return Center(
         child: InkWell(
           onTap: Navigate_to,
           child: Container(
             height:48 ,
             width: 330,
             decoration: BoxDecoration(
               color: ToDoAppcolors.PrimaryColor1,
               borderRadius: BorderRadius.circular(20),

             ),
             child: Center(child: TextWidget(text: sign_text, textSize: 18, weight: FontWeight.w700,textcolor: ToDoAppcolors.Default,),),
           ),
         ),
       );
     }
   }
