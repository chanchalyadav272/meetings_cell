import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meetings_cell/screens/home_screen.dart';
import 'package:meetings_cell/screens/login_screen.dart';
import 'package:meetings_cell/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Meetings Cell',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      routes: {
        '/login':(context) => const Login(),
        '/home': (context) => const Home(),

      },
      home: const Login(),









    );
  }
}
