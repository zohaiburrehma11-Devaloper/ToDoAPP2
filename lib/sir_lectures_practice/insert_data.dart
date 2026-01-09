import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  TextEditingController nameController=TextEditingController();

  TextEditingController genderController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
          ),
          TextFormField(
            controller: genderController,
          ),

          TextButton(onPressed: ()
          async{
            String PrimeryKey=DateTime.now().microsecond.toString();
           await FirebaseFirestore.instance.collection('ToStore').
           doc(PrimeryKey).set({
             //map
             'Name':nameController.text,
             'Gender':genderController.text,
             'id':PrimeryKey
           } )
               .then((onValue){
                 print('Data Added============');
           }).onError((error,handleError){
             print('error:${error.toString()}========}');
           });
          }, child: Text('Add')),

        ],
      ),
    );
  }
}
