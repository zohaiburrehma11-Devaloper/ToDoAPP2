import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key,required this.text, this.textcolor=Colors.black,required this.textSize,required this.weight});
 final String text;
 final Color textcolor;
 final double textSize;
 final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.roboto(color: textcolor,fontSize: textSize,fontWeight: weight),);
  }
}
