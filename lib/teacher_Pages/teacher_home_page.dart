import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sepia_app/teacher_Pages/home_page.dart';
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
    home_page(),
    profile_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home'),
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
          style: TabStyle.reactCircle,
          backgroundColor: Color.fromARGB(255, 64, 76, 180),
          items: [
            TabItem(
              title: "Settings",
              icon: Icon(
                Icons.settings,
              ),
            ),
            TabItem(
              title: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            TabItem(
              title: "Profile",
              icon: Icon(
                Icons.person,
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
