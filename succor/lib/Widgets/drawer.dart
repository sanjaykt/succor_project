import 'package:flutter/material.dart';
import 'package:succor/screens/login/login_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
//        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Temp Name'),
            accountEmail: Text('temp@mail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text('Amma', style: TextStyle(fontSize: 20)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward),
            title: Text('Logout'),
            onTap: () {
              Navigator.popAndPushNamed(context, LoginScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
