import 'package:flutter/material.dart';
import 'package:ncert3/Math%20Widget/MatrhCard.dart';

import 'data.dart';

class ClassXIICard extends StatelessWidget {
  const ClassXIICard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class XII Books"),
      ),
      body: GridView.builder(
          itemCount: modal3.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            ClassXII classXIICard = modal3[index];
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MathCard()));
              },
              child: Card(
                  shadowColor: Colors.pink,
                  shape: Border.all(style: BorderStyle.solid),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        classXIICard.img,
                        height: 70,
                        width: 80,
                      ),
                      Text(classXIICard.name)
                    ],
                  )),
            );
          }),
    );
  }
}
