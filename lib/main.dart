import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/sing_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'important_numbers/important.dart';

import 'bottomNav.dart';
import 'log_in.dart';


main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD_hIe-QaI29EeEnU_aU-WtMo31Ydz0EMM",
          appId: "1:773960146009:android:c079b0a98eecb7d5d7e548",
          messagingSenderId: "773960146009",
          projectId: "nawabganj-roktoseba"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      home: LogIn(),
      debugShowCheckedModeBanner: false,
    );
  }

}
