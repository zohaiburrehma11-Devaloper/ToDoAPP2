import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/veiws/components/text_widget.dart';
import 'package:todoapp/veiws/source/app_veiw/add_task_screen1.dart';
import 'package:todoapp/veiws/source/app_veiw/tasks_datail.dart';
import 'package:todoapp/veiws/utills/constants/colors.dart';
import 'package:todoapp/veiws/utills/constants/images.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:material_symbols_icons/symbols_map.dart';
class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}
String docid=FirebaseAuth.instance.currentUser!.uid;

class _HomeSreenState extends State<HomeSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(onPressed: ()
       {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context)
                    {
                      return FractionallySizedBox(
                      heightFactor: 0.65,
                          child: AddTaskScreen1()
                      );
                    },
                )          ;
       },
         child: Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(13),
                 color: ToDoAppcolors.PrimaryColor4,
           ),
           child:Icon(Icons.add,color: ToDoAppcolors.fontcolor,),
         ),
       ),

      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(100,65),
              colors: [
                ToDoAppcolors.PrimaryColor1 ,
                ToDoAppcolors.PrimaryColor2,
                ToDoAppcolors.PrimaryColor3,
              ]),
        ),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            children: [
               SizedBox(height: 40,),

              SizedBox(
                 height: 100,
                child: StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
                    stream:
                          FirebaseFirestore.
                    instance.
                    collection('Signindata').
                    doc(docid).
                    snapshots() ,
                    builder: (context,snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting)
                        {
                          return Center(
                              child: CircularProgressIndicator()
                          );
                        }
                      if(snapshot.hasError )
                        {
                           ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(" Error occur"))
                                          );}
                      if(!snapshot.hasData||!snapshot.data!.exists)
                        {
                         return Center(
                           child: TextWidget1(text: 'User data not found', color: ToDoAppcolors.fontcolor, size: 30),
                         );
                      }
                     var data= snapshot.data!.data() as Map<String, dynamic>  ;
                  return ListTile(
                    leading: CircleAvatar(
                      radius:40 ,
                      backgroundImage:AssetImage(images.Profile_pic_1,), 
                    ),
                    title: TextWidget1(text: data['Name'], color: ToDoAppcolors.fontcolor, size: 15),
                   subtitle: TextWidget1(text: data['Email'], color: ToDoAppcolors.fontcolor, size: 12),
                    trailing:   IconButton(onPressed: (){

                    }, icon: Icon(Icons.notifications,color: ToDoAppcolors.fontcolor,)),
                    );
                    }),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(right: 200.0),
                child: TextWidget1(text: 'Group tasks', color: ToDoAppcolors.fontcolor, size: 23),
              ),
               SizedBox(height: 10,),
                  

              SizedBox(height: 100,),

               Padding(
                 padding: const EdgeInsets.only(right: 170.0),
                 child: TextWidget1(text: 'Incomplete Tasks', color: ToDoAppcolors.fontcolor, size: 20),
               ),
              SizedBox(
                height: 250,
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
              Padding(
                padding: const EdgeInsets.only(right:170.0),
                child: TextWidget1(text: 'Completed Tasks', color: ToDoAppcolors.fontcolor, size: 20),
              ),
              SizedBox(
                height:250,
                child:StreamBuilder<QuerySnapshot>(

                    stream:  FirebaseFirestore
                        .instance
                        .collection('user-data')
                        .doc(docid)
                        .collection('Task_data').
                    where('Status',isEqualTo: 'completed').
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
                        return ListTile(
                          leading:
                          data['Status']=='completed'
                              ?Icon(Icons.check_circle,color: ToDoAppcolors.iconcolor1,)
                              :SizedBox.shrink(),

                          trailing: InkWell(
                            onTap: ()async{
                              await FirebaseFirestore.instance.
                              collection('user-data').
                              doc(docid).
                              collection('Task_data').
                              doc( snapshot.data!.docs[index].id).
                              delete();
                            },
                            child: Icon(Icons.delete_forever,color: ToDoAppcolors.PrimaryColor2,),
                          ),
                          title: TextWidget1(
                            text: data['Title']?.toString() ?? "",   // ✅ Highlight
                            color: ToDoAppcolors.fontcolor,
                            size: 18,
                          ),
                          subtitle: TextWidget1(
                            text: data['Task']?.toString() ?? "",// ✅ Highlight
                            color: ToDoAppcolors.fontcolor,
                            size: 18,
                          ),
                        );
                      },
                    );
                    }),
              ),
            ],
          ),
        ),
      ),
     
          bottomNavigationBar: BottomAppBar(
            color: ToDoAppcolors.PrimaryColor1,
            height: 70,
            elevation: 10,
            shape: CircularNotchedRectangle(),
            notchMargin: 8,
            clipBehavior: Clip.none,
            shadowColor: ToDoAppcolors.fontcolor,
            surfaceTintColor: Colors.transparent,
            padding: EdgeInsets.all(10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              Icon(Icons.home_filled,color: ToDoAppcolors.fontcolor,),
              SizedBox(width: 50,),
              Icon(Icons.list,color: ToDoAppcolors.fontcolor,),
              SizedBox(width: 50,),
              Icon(Icons.calendar_month_outlined,color: ToDoAppcolors.fontcolor,),
              SizedBox(width: 50,),
              Icon(Icons.settings,color: ToDoAppcolors.fontcolor,),
            ],),
          ),
             
     
     
     
      
      
    );
  }
}
// onTap:
// data['Status']=="incomplete"?
// ()
//
// async{
// await FirebaseFirestore.
// instance.
// collection('user-data').
// doc(FirebaseAuth.instance.currentUser!.uid).
// collection('Task_data').
// doc( taskid).
// update(
//
// {
// 'Status':'completed',
// });
// }:null,
// Logout Code
// InkWell(
//     onTap: ()
//     async{
//     await FirebaseAuth.instance.signOut().then((onValue){
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content:
//             TextWidget1(
//                 text: "you are Log outed",
//                 color: ToDoAppcolors.fontcolor,
//                 size: 20)
//         )
//       );
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
//     });
//     },
//     child: Icon(Icons.logout,color: Colors.deepPurpleAccent,)),
// TextWidget1(text: 'Logout', color: Colors.deepPurpleAccent, size: 18)

