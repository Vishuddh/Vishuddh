import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Shastra extends StatefulWidget {
  @override
  _ShastraState createState() => _ShastraState();
}

class _ShastraState extends State<Shastra> {
  String urlPDFPath;
  PDFDocument doc;
  // ignore: unused_field
  bool _isLoading;

  void _loadFromUrl(String url) async {
    setState(() {
      _isLoading = true;
    });
    doc = await PDFDocument.fromURL(url);
    setState(() {
      _isLoading = false;
    });
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
          body: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("pdfs").snapshots(),
              builder: (context, snapshot) {
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.deepOrange,
                        ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot list = snapshot.data.documents[index];
                      if (snapshot.data == null)
                        return CircularProgressIndicator();
                      return ListTile(
                        onTap: () {
                          urlPDFPath = list["doc"];
                          _loadFromUrl(urlPDFPath);
                          PDFViewer(
                            document: doc,
                          );

                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PdfViewPage(
                                      name: list["name"], path: urlPDFPath)));*/
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
