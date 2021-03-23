import 'package:flutter/material.dart';
import 'package:vishuddh/Screens/Shastra.dart';
import 'package:vishuddh/Screens/gallery2.dart';
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
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/more/Arti.jpg"),
                            fit: BoxFit.fill)),
                    child: GestureDetector(
                      onTap: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(200, 25, 20, 25),
                    child: Text(
                      "Arti",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontStyle: FontStyle.italic,
                          fontSize: 60,
                          color: Colors.orangeAccent,
                          fontFamily: 'Pacifico'),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
                child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/more/Arti.jpg"),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(200, 25, 20, 25),
                  child: Text(
                    "Pooja",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                        fontSize: 60,
                        color: Colors.orangeAccent,
                        fontFamily: 'Pacifico'),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
            SizedBox(
              height: 2,
            ),
            Container(
                child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/more/Arti.jpg"),
                          fit: BoxFit.fill)),
                  child: GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gallery()))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 25, 20, 25),
                  child: Text(
                    "Gallery",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                        fontSize: 60,
                        color: Colors.orangeAccent,
                        fontFamily: 'Pacifico'),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
            SizedBox(
              height: 2,
            ),
            Container(
                child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/more/Arti.jpg"),
                          fit: BoxFit.fill)),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Shastra())),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 25, 20, 25),
                  child: Text(
                    "Shastra",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                        fontSize: 60,
                        color: Colors.orangeAccent,
                        fontFamily: 'Pacifico'),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
            SizedBox(
              height: 2,
            ),
            Container(
                child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/more/Arti.jpg"),
                          fit: BoxFit.fill)),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SocialScreen())),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 25, 20, 25),
                  child: Text(
                    "Socials",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                        fontSize: 60,
                        color: Colors.orangeAccent,
                        fontFamily: 'Pacifico'),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
