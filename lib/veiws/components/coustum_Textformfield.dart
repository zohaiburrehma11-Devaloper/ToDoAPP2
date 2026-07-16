import 'package:flutter/material.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';

class CoustomTextFormFields extends StatelessWidget {
   CoustomTextFormFields({super.key,required this.hint,required this.n1controller, this.secure=false});
   final String hint;

   final bool secure;


TextEditingController n1controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height:58 ,
        width: 380,
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.white),
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          controller:n1controller ,
         style: TextStyle(color: ToDoAppcolors.PrimaryColor1,fontSize: 25),
          decoration: InputDecoration(
            border: InputBorder.none,

            hintText: hint,
            hintStyle: TextStyle(fontSize: 25)


          ),
          obscureText: secure,
        ),
      ),
    );
  }
}
