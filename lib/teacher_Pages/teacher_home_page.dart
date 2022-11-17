import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sepia_app/teacher_Pages/classes_page.dart';
import 'package:sepia_app/teacher_Pages/profile_page.dart';
import 'package:sepia_app/teacher_Pages/settings_page.dart';

class teacher_home_page extends StatefulWidget {
  const teacher_home_page({super.key});

  @override
  State<teacher_home_page> createState() => _teacher_home_pageState();
}

class _teacher_home_pageState extends State<teacher_home_page> {
  int _currentIndex = 1;
  List<Widget> _tabs = [
    settings_page(),
    classes_page(),
    profile_page(),
  ];
  List<String> title = ["Settings", "Home", "Profile"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title[_currentIndex]),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.of(context).pushNamed("teacher_notification");
              },
            ),
          ],
        ),
        body: _tabs.elementAt(_currentIndex),
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: 1,
          style: TabStyle.textIn,
          backgroundColor: Color.fromRGBO(115, 67, 13, 1),
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
