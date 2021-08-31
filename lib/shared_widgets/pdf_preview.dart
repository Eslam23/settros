import 'dart:io';

//import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// ignore: must_be_immutable
class MyPdfPreview extends StatefulWidget {
  String path;
  MyPdfPreview({this.path});
  @override
  _MyPdfPreviewState createState() => _MyPdfPreviewState();
}

class _MyPdfPreviewState extends State<MyPdfPreview> {
  bool _isLoading = true;
  /*Future<PDFDocument>*/ PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    Directory dir = await getExternalStorageDirectory();
    document = await PDFDocument.fromFile(
        File(widget.path ?? dir.path + '/example.pdf'));
    await Future.delayed(Duration(seconds: 5));
    print(widget.path);
    setState(() {
      _isLoading = false;
    });
    print("11111111111111111111111111111111111" + dir.path);
    /* return (document);*/
  }

  @override
  Widget build(BuildContext context) {
    /*loadDocument();*/
    return Scaffold(
      appBar: AppBar(
        //todo translate
        title: const Text('PDFViewer'),
        centerTitle: true,
      ),
      body: Center(
          child: _isLoading
              ? CircularProgressIndicator()
              : PDFViewer(
                  document: document,
                  lazyLoad: false,
                )
          /* FutureBuilder(
            future: document,
            builder: (context,snapshot){
              if(_isLoading) {
                return CircularProgressIndicator();
              }
              */ /*PDFDocument pdfDocument;
              document.then((value) =>pdfDocument=value);*/ /*
              print("88888888888888"+document.toString());
              return PDFViewer(document: snapshot.data,lazyLoad: false,);
            },
          )*/
          //uncomment below line to preload all pages
          /*lazyLoad: false,*/
          // uncomment below line to scroll vertically
          // scrollDirection: Axis.vertical,

          //uncomment below code to replace bottom navigation with your own
          /* navigationBuilder:
                      (context, page, totalPages, jumpToPage, animateToPage) {
                    return ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.first_page),
                          onPressed: () {
                            jumpToPage()(page: 0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            animateToPage(page: page - 2);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            animateToPage(page: page);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.last_page),
                          onPressed: () {
                            jumpToPage(page: totalPages - 1);
                          },
                        ),
                      ],
                    );
                  }, */
          ),
    );
  }
}
