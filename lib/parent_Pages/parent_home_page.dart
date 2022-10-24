import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sepia_app/parent_Pages/home_page.dart';
import 'package:sepia_app/parent_Pages/profile_page.dart';
import 'package:sepia_app/parent_Pages/settings_page.dart';

class parent_home_page extends StatefulWidget {
  const parent_home_page({super.key});

  @override
  State<parent_home_page> createState() => _parent_home_pageState();
}

class _parent_home_pageState extends State<parent_home_page> {
  int _currentIndex = 0;
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
              onPressed: () {},
            ),
          ],
        ),
        body: _tabs.elementAt(_currentIndex),
        bottomNavigationBar: ConvexAppBar(
          initialActiveIndex: 1,
          style: TabStyle.reactCircle,
          backgroundColor: Color(0xff926134),
          items: [
            TabItem(
              title: "Settings",
              icon: Icon(
                Icons.settings,
              ),
            ),
            TabItem(
              title: "Home _",
              icon: Icon(Icons.home),
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
