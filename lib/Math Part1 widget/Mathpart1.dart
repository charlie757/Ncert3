import 'package:flutter/material.dart';
import 'package:ncert3/Math%20Part1%20widget/data.dart';
import 'package:ncert3/PDF%20Widget/DownloadPDF.dart';
import 'package:ncert3/PDF%20Widget/OfflinePDF.dart';
import 'package:ncert3/PDF%20Widget/OnlinePDF.dart';

class Mathpart1 extends StatelessWidget {
  const Mathpart1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("math-I (XII)"),
      ),
      body: ListView.builder(
          itemCount: modal5.length,
          itemBuilder: (context, index) {
            MathPart1 mathPart1 = modal5[index];
            return Container(
              height: 80,
              child: Card(
                elevation: 10,
                shadowColor: Colors.cyan,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(mathPart1.name1),
                          SizedBox(
                            width: 10,
                          ),
                          Text(mathPart1.name2)
                        ],
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DownloadPdf()));
                              },
                              child: Expanded(
                                  child: Container(
                                color: Colors.blue,
                                alignment: Alignment.center,
                                height: 20,
                                child: Text(
                                  "Download PDF",
                                ),
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PDF()));
                              },
                              child: Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                height: 20,
                                color: Colors.orange,
                                child: Text("Online"),
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PDF1()));
                              },
                              child: Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                height: 20,
                                color: Colors.purple,
                                child: Text("Offline"),
                              )),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
