
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class PdfViewerPage extends StatefulWidget {
  final String name;
  final String path;

  const PdfViewerPage({Key key, this.path, this.name}) : super(key: key);
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
 

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: _launchURL(widget.path)
    );
  }
}

_launchURL(url) async {
  String urL = url;
  if (await canLaunch(urL)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
