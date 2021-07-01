import 'package:flutter/material.dart';
import 'package:ncert3/HomePage%20Widget/data.dart';
import 'package:ncert3/NCERT%20Books%20Widget/NCERT%20Cards.dart';
import 'package:ncert3/Theme%20widget/ChangeThemeButtonWidget.dart';

import 'MyDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "NCERT",
          ),
          actions: [
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
            ChangeThemeButtonWidget(),
          ],
        ),
        drawer: MyDrawer(),
        body: GridView.builder(
            itemCount: modal.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              NCERTModal ncertModal = modal[index];
              return InkWell(
                onTap: () async {
                  await Future.delayed(Duration(seconds: 1));
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NCERTCards()));
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        ncertModal.img,
                        width: 80,
                        height: 60,
                      ),
                      Text(ncertModal.name)
                    ],
                  ),
                ),
              );
            }));
  }
}
