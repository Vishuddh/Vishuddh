import 'package:flutter/material.dart';
import 'package:vishuddh/Screens/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
        title: 'Flutter login demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage()));
}
