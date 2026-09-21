import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/veiws/source/auth_veiws/sign_in.dart';
import 'package:todoapp/veiws/source/starting_veiws/splash_screen_1.dart';

import 'veiws/source/starting_veiws/splash_screen_2.dart';

void main()
async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen_1(),
    );
  }
}
