import 'package:flutter/material.dart';

import 'ImageScreen.dart';

class GallaryPage extends StatefulWidget {
  @override
  _GallaryPageState createState() => _GallaryPageState();
}

class _GallaryPageState extends State<GallaryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Gallery"),
            backgroundColor: Colors.deepOrange,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GridTile(
                    child: Image.asset(
                      "images/drawer.jpg",
                      fit: BoxFit.cover,
                    ),
                    footer: Container(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Images(),
                          ),
                        ),
                        child: ListTile( shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                          title: Text("Acharya Shree"),
                          leading: Icon(Icons.folder),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GridTile(
                    child: Image.asset(
                      "images/bio.jpg",
                      fit: BoxFit.cover,
                    ),
                    footer: Container(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sasangh(),
                          ),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: Text("Sasangh"),
                          leading: Icon(Icons.folder),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
