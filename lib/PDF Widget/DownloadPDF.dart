import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadPdf extends StatefulWidget {
  const DownloadPdf({Key key}) : super(key: key);

  @override
  _DownloadPdfState createState() => _DownloadPdfState();
}

class _DownloadPdfState extends State<DownloadPdf> {
  final imgUrl = "http://www.pdf995.com/samples/pdf.pdf";
  // 'http://conorlastowka.com/book/CitationNeededBook-Sample.pdf'

  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download PDF"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton.icon(
                onPressed: () async {
                  String path =
                      await ExtStorage.getExternalStoragePublicDirectory(
                          ExtStorage.DIRECTORY_DOWNLOADS);
                  String fullpath = "$path/newtask1.pdf";
                  download2(dio, imgUrl, fullpath);
                },
                icon: Icon(
                  Icons.file_download,
                  color: Colors.white,
                ),
                color: Colors.green,
                textColor: Colors.white,
                label: Text("Donwload")),
          ],
        ),
      ),
    );
  }

  void initState() {
    getPermission();
  }

  void getPermission() async {
    print("getPermission");
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(url,
          onReceiveProgress: showDownloadProgress,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }));
      File file = File(savePath);
      var ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(response.data);
      await ref.close();
    } catch (e) {
      print("error is");
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
}
