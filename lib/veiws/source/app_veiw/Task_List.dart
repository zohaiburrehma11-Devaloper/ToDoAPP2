import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/source/app_veiw/tasks_datail.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';

import '../../components/text_widget.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  String docid=FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(100, 65),
            colors:[
              ToDoAppcolors.PrimaryColor1,
              ToDoAppcolors.PrimaryColor2,
              ToDoAppcolors.PrimaryColor3,
            ])
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 70,),
            SizedBox(
              height: 550,
              child:StreamBuilder<QuerySnapshot>(

                  stream:  FirebaseFirestore
                      .instance
                      .collection('user-data')
                      .doc(docid)
                      .collection('Task_data').
                  where('Status',isEqualTo: 'incomplete').
                  snapshots(),
                  builder: (context,snapshot)
                  {

                    if(snapshot.connectionState==ConnectionState.waiting)
                    {
                      return Center(
                          child: CircularProgressIndicator()
                      );
                    }
                    if(snapshot.hasError ) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(" Error occur"))
                      );

                    }
                    if (!snapshot.hasData ) {
                      return const Center(
                        child: Text("Document not found"),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        // ✅ Do
                        var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                        String taskid = snapshot.data!.docs[index].id;
                        return Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10),
                          child: Column(
                            children: [
                              Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: ToDoAppcolors.fontcolor,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child:ListTile(

                                    title: TextWidget1(
                                      text: data['Title']?.toString() ?? "",
                                      color: ToDoAppcolors.fontcolor2,
                                      size: 15,
                                    ),
                                    subtitle: TextWidget1(
                                      text: data['Task']?.toString() ?? "",
                                      color: ToDoAppcolors.fontcolor2,
                                      size: 15,
                                    ),
                                    trailing:
                                    IconButton(
                                      onPressed: ()
                                      {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder:
                                                    (context)=>Tasks_Detail(Taskid: taskid, taskdata: data,)
                                            ));},
                                      icon:Icon(Icons.arrow_forward_ios,color: ToDoAppcolors.fontcolor2,),
                                    ),


                                  )
                              ),
                              SizedBox(height: 8,)
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
