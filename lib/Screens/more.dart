import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vishuddh/Screens/ImageScreen.dart';
import 'package:vishuddh/Screens/Shastra.dart';
import 'HomeScreen.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: new AppBar(
              title: Text("Vishuddh"),
              backgroundColor: Colors.deepOrange,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
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
                          fit: BoxFit.fill)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gall()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Socials()));
                    },
                    child: null,
                  ),
                ),
              ],
            )));
  }
}

class Socials extends StatefulWidget {
  @override
  _SocialsState createState() => _SocialsState();
}

class _SocialsState extends State<Socials> {
  String url;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        _launchInBrowser(url);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: new AppBar(
            title: Text("Social media"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(
                      context, MaterialPageRoute(builder: (context) => More()));
                }),
            backgroundColor: Colors.deepOrange,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/logos/fb3.png"),
                                  fit: BoxFit.fill)),
                          child: FlatButton(
                              onPressed: () {
                                _launchUniversalLinkIos(
                                    "https://www.facebook.com/");
                              },
                              child: null),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/logos/insta.png"),
                              fit: BoxFit.fill)),
                      child: FlatButton(
                          onPressed: () {
                            _launchUniversalLinkIos(
                                "https://www.instagram.com/vishudh_vani?igshid=1klj6tbt6951o");
                          },
                          child: null),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logos/utube.png"),
                            fit: BoxFit.fill)),
                    child: FlatButton(
                        onPressed: () {
                          _launchUniversalLinkIos(
                              "https://www.youtube.com/c/vishuddhavaniLivechannel");
                        },
                        child: null),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logos/g2.png"),
                            fit: BoxFit.fill)))
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class Gall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text("Gallery"),
                backgroundColor: Colors.deepOrange,
                leading:
                    IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
              ),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: GridTile(
                        child:Image.asset("images/drawer.jpg"),
                    footer: Container(
                        color: Colors.white,
                        child: InkWell(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Images())),
                          child: ListTile(
                            title: Text("Acharya Shree"),
                            leading: Icon(Icons.folder),
                          ),
                        )),
                  )),
                  Expanded(
                      child: GridTile(
                        child:Image.asset("images/bio.jpg"),
                    footer: Container(
                        color: Colors.white,

                        child: InkWell(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Sasangh())),
                          child: ListTile(
                            title: Text("Sasangh"),
                            leading: Icon(Icons.folder),
                          ),
                        )),
                  ))
                ],
              ))),
    );
  }
}
