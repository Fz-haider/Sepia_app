import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sepia_app/parent_pages/classes_page.dart';

import 'package:sepia_app/parent_pages/profile_page.dart';
import 'package:sepia_app/parent_pages/settings_page.dart';

class ParentHomePage extends StatefulWidget {
  const ParentHomePage({super.key});

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
  int _currentIndex = 1;
  List<Widget> _tabs = [
    SettingsPage(),
    ClassesPage(),
    ProfilePage(),
  ];
  List<String> title = ["Settings", "Home", "Profile"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title[_currentIndex],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.of(context).pushNamed("parent_notification");
              },
            ),
          ],
        ),
        body: _tabs.elementAt(_currentIndex),
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: 1,
          style: TabStyle.textIn,
          backgroundColor: Color.fromRGBO(115, 67, 13, 1),
          color: Colors.white,
          items: [
            TabItem(
              title: "Settings",
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
            TabItem(
              title: "Home",
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            TabItem(
              title: "Profile",
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
          activeColor: Colors.white,
          onTap: _changeItems,
        ),
      ),
    );
  }

  void _changeItems(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
