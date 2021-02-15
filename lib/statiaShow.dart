import 'package:ar_rad/main.dart';
import 'package:ar_rad/newStatia.dart';
import 'package:ar_rad/spisok.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatShow extends StatelessWidget {
  String values;
  StatShow({this.values});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NewStatia(),
    );
  }
}
