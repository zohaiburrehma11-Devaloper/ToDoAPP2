import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';
class PasswordTextformfeildWidget extends StatefulWidget {
  PasswordTextformfeildWidget({super.key, required this.text,  this.posticon=Icons.person, required this.iconcolor,required this.N_controller,required this.tap,  });
  final String text;
  final IconData posticon;
  final Color iconcolor;
  final TextEditingController N_controller;
  final VoidCallback? tap;

  @override
  State<PasswordTextformfeildWidget> createState() => _TextformfeildWidgetState();
}

class _TextformfeildWidgetState extends State<PasswordTextformfeildWidget> {

  bool issecure=true;

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
        obscureText: issecure,
        controller: widget.N_controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: GoogleFonts.poppins(
              color: ToDoAppcolors.PrimaryColor2,
              fontSize: 14,
            ),
            hintText: widget.text,
            suffixIcon:IconButton(
                onPressed: (){
                  if(issecure==true)
                  {
                    issecure=false;
                    setState(() {

                    });
                  }
                  else
                  {
                    issecure=true;
                    setState(() {

                    });
                  }
                },
                icon: Icon( issecure== true?widget.posticon:Icons.visibility))
        ),
      ),
    );
  }
}
