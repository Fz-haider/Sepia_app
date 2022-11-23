import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sepia_app/teacher_pages/classes_page.dart';
import 'package:sepia_app/teacher_pages/profile_page.dart';
import 'package:sepia_app/teacher_pages/settings_page.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
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
