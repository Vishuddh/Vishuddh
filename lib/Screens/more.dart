import 'package:flutter/material.dart';
import 'package:vishuddh/Screens/Shastra.dart';
import 'package:vishuddh/Screens/gallery.dart';
// import 'package:vishuddh/Screens/new_gallery.dart';
import 'package:vishuddh/Screens/socialsScreen.dart';
import 'HomeScreen.dart';

//  the code below is for the menu screen
class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Vishuddh"),
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 180.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/more/Arti2.jpg"),
                      fit: BoxFit.fill)),
              child: FlatButton(
                onPressed: () {},
                child: null,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              height: 180.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/more/puja.jpg"),
                      fit: BoxFit.fill)),
              child: FlatButton(
                onPressed: () {},
                child: null,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              height: 180.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/more/shastra.jpg"),
                      fit: BoxFit.fill)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Shastra()));
                },
                child: null,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              height: 180.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/more/gallery.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Gallery(),
                    ),
                  );
                },
                child: null,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              height: 180.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/more/socials.jpg"),
                      fit: BoxFit.cover)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) => Socials(),

                      // Going to the new Socials screen page
                      builder: (context) => SocialScreen(),
                    ),
                  );
                },
                child: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
