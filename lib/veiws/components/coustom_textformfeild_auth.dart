import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';

class CoustomTextformfeildAuth extends StatefulWidget {
   CoustomTextformfeildAuth({super.key, required this.text,required this.N_controller, });
   final String text;
   final TextEditingController N_controller;
  @override
  State<CoustomTextformfeildAuth> createState() => _CoustomTextformfeildAuthState();
}

class _CoustomTextformfeildAuthState extends State<CoustomTextformfeildAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 324,
      decoration: BoxDecoration(
        color: ToDoAppcolors.Default,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.5,color:ToDoAppcolors.PrimaryColor2 ),
      ),
      child: TextFormField(
       obscureText: false,
        controller: widget.N_controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: GoogleFonts.poppins(
              color: ToDoAppcolors.PrimaryColor2,
              fontSize: 14,
            ),
            hintText: widget.text,
        ),
      ),
    ) ;
  }
}
// Container(
// height: 45,
// width: 350,
// decoration: BoxDecoration(
// color: ToDoAppcolors.Default,
// borderRadius: BorderRadius.circular(10),
// border: Border.all(width: 10,color: ToDoAppcolors.PrimaryColor2,),
// ),
// child: ,
//
//
// )