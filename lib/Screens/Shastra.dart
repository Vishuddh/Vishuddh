import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Shastra extends StatefulWidget {
  @override
  _ShastraState createState() => _ShastraState();
}

class _ShastraState extends State<Shastra> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
          appBar: new AppBar(
            title: Text("Shastra"),
            leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: ()=> {}),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: null)
            ],
            backgroundColor: Colors.deepOrange,
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("pdfs").snapshots(),
              builder: (context, snapshot) {
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.deepOrange,
                        ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot list = snapshot.data.documents[index];
                      if (snapshot.data == null)
                        return CircularProgressIndicator();
                      return ListTile(
                        onTap: (){},
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(list["lead"]),
                        ),
                        title: Text(list["name"]),
                      );
                    });
              })),
    ));
  }
}