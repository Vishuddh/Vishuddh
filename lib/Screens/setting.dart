import 'package:flutter/material.dart';
import 'package:vishuddh/Screens/HomeScreen.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
        ListTile(
          leading: Icon(Icons.swap_horizontal_circle),
          title: Text("Theme"),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text("Language"),
          onTap: (){},
        ),
        ],
      ),
    );
  }
}
