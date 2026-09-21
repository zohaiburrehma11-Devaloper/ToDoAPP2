import 'package:flutter/material.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';

class CoustomTextFormFields extends StatelessWidget {
   CoustomTextFormFields({super.key,required this.hint,required this.n1controller, this.secure=false, this.icons,});
   final String hint;
   final IconData? icons;
   final bool secure;


TextEditingController n1controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height:44 ,
        width: 310,
        decoration: BoxDecoration(
           color: ToDoAppcolors.fontcolor,

          borderRadius: BorderRadius.circular(7)
        ),
        child: TextFormField(
          controller:n1controller ,

         style: TextStyle(color: ToDoAppcolors.PrimaryColor1,fontSize: 18),
          decoration: InputDecoration(
            border: InputBorder.none,
                prefixIcon: Icon(icons),
            prefixIconColor: Colors.black,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 18,color: Colors.black45)


          ),
          obscureText: secure,
        ),
      ),
    );
  }
}
