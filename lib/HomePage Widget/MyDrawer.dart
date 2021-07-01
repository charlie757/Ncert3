import 'dart:async';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("NCERT"),
                  accountEmail: Text("ncertcourse@gmail.com"),
                  currentAccountPicture: CircleAvatar(),
                ),
                Text("Setting"),
                ListTile(
                  title: Text("Change Color"),
                  leading: Icon(Icons.color_lens),
                ),
                ListTile(
                  title: Text("Open the books from Inbuid reader"),
                  leading: Icon(Icons.chrome_reader_mode_outlined),
                ),
                ListTile(
                  title: Text("Dark Mode"),
                  leading: Icon(Icons.invert_colors_on),
                ),
                Divider(color: Colors.black),
                Text("Android Apps"),
                ListTile(
                  title: Text("Ncert Books & Solutions"),
                  leading: Image.asset(
                    'assets/images/NSO.jpg',
                    height: 25,
                    width: 25,
                  ),
                ),
                ListTile(
                  title: Text("More Apps"),
                  leading: Image.asset(
                    'assets/images/book2.jpg',
                    height: 25,
                    width: 25,
                  ),
                ),
                Divider(color: Colors.black),
                Text("Important"),
                ListTile(
                  title: Text("Security"),
                  leading: Icon(Icons.security),
                ),
                ListTile(
                  title: Text("Login"),
                  leading: Icon(Icons.login),
                ),
                ListTile(
                  title: Text("LogOut"),
                  leading: Icon(Icons.logout),
                ),
              ],
            )));
  }
}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();
