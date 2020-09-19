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
    // return PDFViewerScaffold(
    //       appBar: AppBar(
    //         centerTitle: true,
    //       title: Text(widget.name),
    //       backgroundColor: Colors.deepOrange,
    //       // actions: <Widget>[
    //       //   IconButton(
    //       //     icon: Icon(Icons.share),
    //       //     onPressed: () {},
    //       //   ),
    //       // ],
    //     ),
    //     path: widget.path
    // );

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PDFViewer(document: document,indicatorText: Colors.deepOrange,indicatorBackground: Colors.deepOrange,)),
      // body: Stack(
      //   children: <Widget>[
      //     PDFView(
      //       filePath: widget.path,
      //       autoSpacing: true,
      //       enableSwipe: true,
      //       pageSnap: true,
      //       swipeHorizontal: true,
      //       nightMode: false,
      //       onError: (e) {
      //         print(e);
      //       },
      //       onRender: (_pages) {
      //         setState(() {
      //           _totalPages = _pages;
      //           pdfReady = true;
      //         });
      //       },
      //       onViewCreated: (PDFViewController vc) {
      //         _pdfViewController = vc;
      //       },
      //       onPageChanged: (int page, int total) {
      //         setState(() {});
      //       },
      //       onPageError: (page, e) {},
      //     ),
      //     !pdfReady
      //         ? Center(
      //             child: CircularProgressIndicator(),
      //           )
      //         : Offstage(),
      //   ],
      // ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
        
      //   children: <Widget>[
      //     // _currentPage > 0
      //     //     ? FloatingActionButton.extended(
      //     //         backgroundColor: Colors.red,
      //     //         label: Text("Go to ${_currentPage - 1}"),
      //     //         onPressed: () {
      //     //           _currentPage -= 1;
      //     //           _pdfViewController.setPage(_currentPage);
      //     //         },
      //     //       )
      //     //     : Offstage(),

      //     FloatingActionButton(
      //       heroTag: "btn1",
      //        backgroundColor: Colors.green,
      //       child: Center(
      //         child: TextField(
      //           controller: myController,
      //           textAlign: TextAlign.center,
      //           keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //           border: InputBorder.none,
      //           ),
      //         ),
      //       ),
      //       onPressed: (){

      //       }),
          
      //     _currentPage + 1 < _totalPages
      //         ? FloatingActionButton.extended(
      //           heroTag: "btn2",
      //             backgroundColor: Colors.green,
      //             //label: Text("Go to ${_currentPage + 1}"),
      //             label: Text("Go"),
      //             onPressed: () {
      //              // _currentPage += 1;
      //               _pdfViewController.setPage(int.parse(myController.text));
      //               setState(() {
                      
      //               });
      //             },
      //           )
      //         : Offstage(),
      //   ],
      // ),
    );
  }
}
