import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:vishuddh/PDF/ViewPdf.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class Shastra extends StatefulWidget {
  @override
  _ShastraState createState() => _ShastraState();
}

class _ShastraState extends State<Shastra> {
  String urlPDFPath;
  PDFDocument doc;
  // ignore: unused_field
  bool _isLoading;

  Future getdata() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("pdfs").getDocuments();
    return qn;
  }

  Future<File> createFileOfPdfUrl(String urL) async {
    String url = urL;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  /* Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/filename");
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
          appBar: new AppBar(
            title: Text("Shastra"),
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => {}),
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
          body: FutureBuilder(
              future: getdata(),
              builder: (context, snapshot) {
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.deepOrange,
                        ),
                    itemCount: snapshot.data.documents.length > 0
                        ? snapshot.data.documents.length
                        : 0,
                    itemBuilder: (context, index) {
                      DocumentSnapshot list = snapshot.data.documents[index];
                      if (snapshot.data == null)
                        return CircularProgressIndicator();
                      return ListTile(
                        onTap: () async {
                          // launch(list["doc"]);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => PdfViewerPage(
                          //           name: list["name"], path: list["doc"])));
                          // urlPDFPath = list["doc"];
                          //  _loadFromUrl(urlPDFPath);
                          // doc = await PDFDocument.fromURL(list["doc"]);
                          // PDFViewer(
                          //   document: doc,
                          // );

                          // String pathPDF =
                          //     await createFileOfPdfUrl(list["doc"]).then((f) {
                          //   // setState(() {
                          //   String pathPDF;
                          //   pathPDF = f.path;
                          //   print(pathPDF);
                          //   return pathPDF;
                          //   // });
                          // });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PdfViewPage(
                                      name: list["name"], path: list["doc"])));
                        },
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
