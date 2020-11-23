import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vishuddh/Screens/more.dart';

class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gallery"),
          backgroundColor: Colors.deepOrange,
          shadowColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => More(),
              ),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("Gallery").snapshots(),
          builder: (context, snapshot) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot gallery = snapshot.data.documents[index];
                if (snapshot.data != null) {}

                return GridTile(
                  child: Image.network(gallery["img"]),
                  footer: Container(
                    color: Colors.white,
                    child: Text(gallery["name"]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Sasangh extends StatefulWidget {
  @override
  _SasanghState createState() => _SasanghState();
}

class _SasanghState extends State<Sasangh> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sasangh"),
          backgroundColor: Colors.deepOrange,
          shadowColor: Colors.blue,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("Gallery").snapshots(),
          builder: (context, snapshot) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot gallery = snapshot.data.documents[index];
                if (snapshot.data == null) return Text("loading");
                return GridTile(
                  child: Image.network(
                    gallery['img'],
                    fit: BoxFit.contain,
                  ),
                  footer: Container(
                    color: Colors.white,
                    child: Center(child: Text(gallery['name'])),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
