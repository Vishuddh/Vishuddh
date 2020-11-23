import 'package:flutter/material.dart';
import 'package:vishuddh/Screens/HomeScreen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter login demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,


        // changing the primaryColor
        primaryColor: Colors.deepOrange,
      ),
      home: HomePage(),
      
    ),
  );
}
