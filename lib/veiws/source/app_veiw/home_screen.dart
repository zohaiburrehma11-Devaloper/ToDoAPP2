import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
           StreamBuilder(
               stream: FirebaseFirestore.instance.//source of incoming data,
           collection('All Tasks').snapshots(),//keep all data of collection ,
               builder: (context,snapshot){

                 return ListView.builder(
                   itemCount: snapshot.data!.docs.length,
                     itemBuilder: (context,index){
                       return Card(
                         child: ListTile(
                           title: TextWidget(text: snapshot.data!.docs[index]['Title'].toString(), textSize: 15,textcolor:ToDoAppcolors.PrimaryColor1 , weight: FontWeight.w700,),
                           subtitle: TextWidget(text: snapshot.data!.docs[index]['Task'].toString(), textSize: 15,textcolor:ToDoAppcolors.PrimaryColor1 , weight: FontWeight.w700,),
                         ),
                       );
                     },

                 );
               })     //Real time stream

    );
  }
}
