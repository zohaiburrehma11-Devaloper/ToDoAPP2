import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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



      body: StreamBuilder<DocumentSnapshot>(
          stream:
                FirebaseFirestore.
          instance.
          collection('user-data').
          doc(docid).
          snapshots() ,
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Center(
                    child: CircularProgressIndicator()
                );
              }
           var data= snapshot.data!.data() as Map<String, dynamic>  ;
        return ListTile(
          title: Text(data['name']),
          subtitle: Text(data['email']),
        );

    })
    );
  }
}


/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Data"),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Signindata")
            .doc(uid) // User ID as Document ID
            .collection("Userdata") // Sub Collection
            .snapshots(),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Data Found"),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {

              var data = snapshot.data!.docs[index];

              return Card(
                child: ListTile(
                  title: Text(data["title"]),
                  subtitle: Text(data["description"]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}* */




















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:todoapp/veiws/components/text_widget.dart';
// import 'package:todoapp/veiws/source/app_veiw/add_task_screen_1.dart';
// import 'package:todoapp/veiws/source/app_veiw/setting_screen.dart';
// import 'package:todoapp/veiws/source/auth_veiws/sign_in.dart';
// import 'package:todoapp/veiws/utills/constants/colors.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   String Uid='';
//   String name = '';
//   String email = '';
//   String gender = '';
//   bool loading = true;
//  int currentIndex= 1;
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Fetchuserdata();
//   }
//   Fetchuserdata()
//   async{
//       Uid= await FirebaseAuth.instance.currentUser!.uid;
// //    final uid=FirebaseAuth.instance.currentUser!.uid;
//     final userprofile=await FirebaseFirestore.instance.collection('Signindata').doc(Uid).get();
//     setState(() {
//       name = userprofile['Name'];
//       email = userprofile['Email'];
//       gender = userprofile['Gender'];
//       loading=false;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//          appBar: AppBar(
//
//            title: TextWidget(text: 'TodoApp', textSize: 30, weight: FontWeight.bold),
//            actions: [
//              IconButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfieScreen()));
//              }, icon: Icon(Icons.perm_identity)),
//              // IconButton(onPressed: ()async{
//              //   await FirebaseAuth.instance.signOut();
//              //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
//              // }, icon: Icon(Icons.logout))
//            ],
//          ),
//       drawer: Drawer(
//         width: 200,
//         backgroundColor: ToDoAppcolors.PrimaryColor1,
//         elevation: 16,
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 200,
//               child: Uid.isEmpty?CircularProgressIndicator(): StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//                   stream:FirebaseFirestore.instance.collection('Signindata').doc(Uid).snapshots(),
//                   builder: (context,snapshot){
//
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());  //data load hona tk loading show hogi
//                     }
//
//                     if (snapshot.hasError) {           //ager koi error ho
//                       return Center(child: Text(snapshot.error.toString()));
//                     }
//
//                     if (!snapshot.hasData || snapshot.data!.data()!.isEmpty) {
//                       return const Center(               // ager user data empty ho ga to show hoga
//                         child: Text("User data not found"),
//                       );
//                     }
//                     final data = snapshot.data!.data()!;         //User data
//
//                     return loading==true? CircularProgressIndicator(): Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//
//                       children: [
//                       TextWidget(text: name, textSize: 20, weight: FontWeight.w500),
//                       TextWidget(text: email, textSize: 20, weight: FontWeight.w500),
//
//                     ],);
//                   },
//               ),
//             )
//           ],
//         )
//
//       ),
//
//       backgroundColor: ToDoAppcolors.Default,
//       bottomNavigationBar: BottomNavigationBar(
//
//           backgroundColor: Colors.white,
//           currentIndex: currentIndex,
//
//           type: BottomNavigationBarType.fixed,
//
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.blueGrey,
//
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//
//           onTap: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home),
//           label: 'Home'
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined),
//          label: 'Calender'
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined),
//           label: 'All Task'
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.settings),
//         label: 'Setting'
//         ),
//
//
//       ]),
//       // floatingActionButton: FloatingActionButton(
//       //   splashColor: ToDoAppcolors.secondarycolor2,
//       //
//       //   onPressed: (){
//       //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen1()));
//       // },
//       // child: Text('+'),
//       // ),
//       body:
//            SizedBox(
//              height:300
//              ,
//              width: double.infinity,
//              child: StreamBuilder(
//                  stream: FirebaseFirestore.instance.//source of incoming data,
//              collection('All Task').snapshots(),//keep all data of collection ,
//                  builder: (context,snapshot){
//
//
//                    if (snapshot.connectionState == ConnectionState.waiting) {
//                      return const Center( //Ager data fetch na howa hoga to loading show kerdega
//                        child: CircularProgressIndicator(),
//                      );
//                    }
//
//                    // Error state
//                    if (snapshot.hasError) {
//                      return Center(// ager network issiue ya phir koi var ka error ho to show hoga
//                        child: Text('Something went wrong'),
//                      );
//                    }
//
//                    // No data or empty collection
//                    if (!snapshot.hasData||snapshot.data!.docs.isEmpty ) {
//                      return   Center(//aur ager  koi data na hoga to ya show hoga
//                        child: TextWidget(text: 'No Task Found', textSize: 30, weight: FontWeight.w500,textcolor: ToDoAppcolors.secondarycolor2,),
//                      );
//                    }
//                    return SizedBox(
//                      height: 500,
//                      width: 300,
//                      child: ListView.builder(
//                        itemCount: snapshot.data!.docs.length,
//                          itemBuilder: (context,index){
//                            String uid= FirebaseFirestore.instance.collection('Add Task').doc().id.toString();
//
//
//                            return Card(
//                              child: ListTile(
//                                title: TextWidget(text: snapshot.data!.docs[index]['Title'].toString(),
//                                  textSize: 15,textcolor:ToDoAppcolors.PrimaryColor1 , weight: FontWeight.w700,),
//                                subtitle: TextWidget(text: snapshot.data!.docs[index]['Task'].toString(),
//                                  textSize: 15,textcolor:ToDoAppcolors.PrimaryColor1 , weight: FontWeight.w700,),
//                                trailing: IconButton(onPressed: ()
//                                async{
//                                  await FirebaseFirestore.instance.collection('All Task').doc(
//                                    snapshot.data!.docs[index].id,
//                                  ).delete();
//                                }, icon: Icon(Icons.delete_outline_outlined,)),
//                              ),
//                            );
//                          },
//
//                      ),
//                    );
//                  }),
//            ) ,    //Real time stream
//
//     );
//   }
// }
// // children: [
// // DrawerHeader(
// // decoration: BoxDecoration(
// // color: ToDoAppcolors.Default,
// // ),
// // child: Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
// // children: [
// // Center(child: CircleAvatar(radius: 20,),),
// // TextWidget(text: , textSize: 20, weight: FontWeight.w500)
// // ],
// // ),)
// // ]