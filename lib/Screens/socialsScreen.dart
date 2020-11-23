import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'more.dart';

class SocialScreen extends StatefulWidget {
  @override
  _SocialScreenState createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
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

  // method to go to the specific link
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrange[400],
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  // going back to the More() screen
                  builder: (context) => More(),
                ),
              );
            },
          ),
          title: Text(
            'Social Media',
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Card(
                borderOnForeground: true,
                elevation: 5.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // image of facebook logo
                    child: Image.asset('images/logos/fb3.png'),
                  ),
                  title: Text(
                    'FaceBook Page',
                  ),
                  subtitle: Text(
                    'Go to the FaceBook page for the app',
                  ),
                  onTap: () {
                    // url to go to the facebook page
                    _launchUniversalLinkIos(
                        "https://www.facebook.com/vaibhavjainbadamalhera/?ti=as");
                  },
                ),
              ),
              Card(
                elevation: 5.0,
                borderOnForeground: true,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // image of instagram logo
                    child: Image.asset('images/logos/insta.png'),
                  ),
                  title: Text(
                    'Instagram Page',
                  ),
                  subtitle: Text(
                    'Go to the FaceBook page for the app',
                  ),
                  onTap: () {
                    // url to go to the instagram page
                    _launchUniversalLinkIos(
                        "https://www.instagram.com/vishudh_vani?igshid=1klj6tbt6951o");
                  },
                ),
              ),
              Card(
                elevation: 5.0,
                borderOnForeground: true,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    // image of youtube logo
                    child: Image.asset('images/logos/utube.png'),
                  ),
                  title: Text(
                    'Youtube Channel',
                  ),
                  subtitle: Text(
                    'Go to the Youtube Channel for the app',
                  ),
                  onTap: () {
                    // url to go to the youtube channel
                    _launchUniversalLinkIos(
                      "https://www.youtube.com/c/vishuddhavaniLivechannel",
                    );
                  },
                ),
              ),
              Card(
                elevation: 5.0,
                borderOnForeground: true,
                child: ListTile(
                  leading: CircleAvatar(
                    // image of google logo
                    child: Image.asset('images/logos/g2.png'),
                  ),
                  title: Text(
                    'Google',
                  ),
                  subtitle: Text(
                    'Go to the Google for the app',
                  ),
                  onTap: () {
                    // url to go to the google
                    _launchUniversalLinkIos(
                      null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
