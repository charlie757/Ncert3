import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PDF1 extends StatefulWidget {
  const PDF1({Key key}) : super(key: key);

  @override
  _PDF1State createState() => _PDF1State();
}

class _PDF1State extends State<PDF1> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/images/Core-Java.pdf');

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to Offline Study")),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
                zoomSteps: 1,
                lazyLoad: false,
                scrollDirection: Axis.vertical,
              ),
      ),
    );
  }
}
