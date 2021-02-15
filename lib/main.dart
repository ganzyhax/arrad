import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ar_rad/menu.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ar_rad/spisok.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      title: 'AR RAD',
      home: MyStatefulWidget(),
      color: Colors.grey,
    );
  }
}
