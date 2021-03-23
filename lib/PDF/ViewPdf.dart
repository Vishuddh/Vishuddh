import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PdfViewPage extends StatefulWidget {
  final String name;
  final String path;

  const PdfViewPage({Key key, this.path, this.name}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  bool pdfReady = false;
  final myController = TextEditingController();
  bool _isLoading = true;
  PDFDocument document;

  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    loadDocument();

    // createFileOfPdfUrl().then((f) {
    //   setState(() {
    //     pathPDF = f.path;
    //     print(pathPDF);
    //     myController.text = "1";

    //   });
    // });
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(widget.path);

    setState(() => _isLoading = false);
  }

  Future<File> createFileOfPdfUrl() async {
    final url = "http://africau.edu/images/default/sample.pdf";
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
                indicatorText: Colors.white,
                indicatorBackground: Colors.deepOrange,
              ),
      ),
    );
  }
}
