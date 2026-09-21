import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextWidget1 extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  TextWidget1({super.key,required, required this.text, required this.color, required this.size, this.weight=FontWeight.w500});

@override

Widget build(BuildContext context) {
  return Text(text,style: GoogleFonts.poppins(fontSize: size,color: color,fontWeight: weight),);
}
}
