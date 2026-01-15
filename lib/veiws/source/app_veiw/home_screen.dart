import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/app_veiw/add_task_screen_1.dart';
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


      backgroundColor: ToDoAppcolors.PrimaryColor2,
      floatingActionButton: FloatingActionButton(
       // splashColor: ToDoAppcolors.secondarycolor2,

        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen1()));
      },
      child: Text('+'),
      ),
      body:
           SizedBox(
             height:700
             ,
             width: double.infinity,
             child: StreamBuilder(
                 stream: FirebaseFirestore.instance.//source of incoming data,
             collection('All Task').snapshots(),//keep all data of collection ,
                 builder: (context,snapshot){


                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return const Center( //Ager data fetch na howa hoga to loading show kerdega
                       child: CircularProgressIndicator(),
                     );
                   }

                   // Error state
                   if (snapshot.hasError) {
                     return Center(// ager network issiue ya phir koi var ka error ho to show hoga
                       child: Text('Something went wrong'),
                     );
                   }

                   // No data or empty collection
                   if (!snapshot.hasData ) {
                     return const Center(//aur ager  koi data na hoga to ya show hoga
                       child: Text('No Task Found'),
                     );
                   }
                   return SizedBox(
                     height: 500,
                     width: 300,
                     child: ListView.builder(
                       itemCount: snapshot.data!.docs.length,
                         itemBuilder: (context,index){
                           String uid= FirebaseFirestore.instance.collection('Add Task').doc().id.toString();


                           return Card(
                             child: ListTile(
                               title: TextWidget(text: snapshot.data!.docs[index]['Title'].toString(),
                                 textSize: 15,textcolor:ToDoAppcolors.PrimaryColor1 , weight: FontWeight.w700,),
                               subtitle: TextWidget(text: snapshot.data!.docs[index]['Task'].toString(),
                                 textSize: 15,textcolor:ToDoAppcolors.PrimaryColor1 , weight: FontWeight.w700,),
                               trailing: IconButton(onPressed: ()
                               async{
                                 await FirebaseFirestore.instance.collection('All Task').doc(
                                   snapshot.data!.docs[index].id,
                                 ).delete();
                               }, icon: Icon(Icons.delete_outline_outlined,)),
                             ),
                           );
                         },

                     ),
                   );
                 }),
           )     //Real time stream

    );
  }
}
