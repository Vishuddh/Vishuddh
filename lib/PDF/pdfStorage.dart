import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vishuddh/PDF/ViewPdf.dart';

class PDFStorage extends StatefulWidget {
  final String name;
  final String url;

  const PDFStorage({Key key, this.url, this.name}) : super(key: key);
  @override
  _PDFStorageState createState() => new _PDFStorageState();
}

class _PDFStorageState extends State<PDFStorage> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    final url = widget.url;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Open PDF"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PdfViewPage(name: widget.name, path: pathPDF)),
          ),
        ),
      ),
    );
  }
}
