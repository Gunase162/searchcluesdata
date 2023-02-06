// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_is_empty, prefer_const_constructors, avoid_function_literals_in_foreach_calls, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'search.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyC6Ci2oQlr_qvYtjv-H_6_2e601RqUBbzI",
    authDomain: "maincluesnew.firebaseapp.com",
    projectId: "maincluesnew",
    storageBucket: "maincluesnew.appspot.com",
    messagingSenderId: "505522768608",
    appId: "1:505522768608:web:9c25acb8d09b623a1e5e85",
    measurementId: "G-S2YPSZ3RZ3"
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:  Search(),
    );
  }
}
