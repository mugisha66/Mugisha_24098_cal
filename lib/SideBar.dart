import 'package:flutter/material.dart';
import 'Home.dart';
import 'About.dart';
import 'Calculator.dart';
import 'Login.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home'); // Navigate to home page
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about'); // Navigate to about page
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Login'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/login");
              // Navigate to about page
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculator'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                  context, '/calculator'); // Navigate to calculator page
            },
          ),
          // Add more ListTile widgets for additional menu items
        ],
      ),
    );
  }
}
