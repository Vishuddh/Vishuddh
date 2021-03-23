import 'package:flutter/material.dart';
import 'package:vishuddh/Screens/ImageScreen.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Gallery"),
          backgroundColor: Colors.deepOrange,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Images();
                  }),
                );
              },
              child: GridTile(
                  child: Container(
                child: Image.asset(
                  "images/drawer.jpg",
                  height: 100.0,
                ),
              )),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Sasangh();
                  }),
                );
              },
              child: GridTile(
                  child: Container(
                child: Image.asset(
                  "images/drawer.jpg",
                  height: 100.0,
                ),
              )),
            ))
          ],
        ));
  }
}
