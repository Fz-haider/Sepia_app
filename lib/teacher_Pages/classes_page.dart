import 'package:flutter/material.dart';
import 'package:sepia_app/teacher_Pages/teacher_post.dart';

class classes_page extends StatefulWidget {
  const classes_page({super.key});

  @override
  State<classes_page> createState() => _classes_pageState();
}

class _classes_pageState extends State<classes_page> {
  List _class = [
    teacher_post(),
  ];
  List _className = [
    "Kurdish",
    "English",
    "Arabic",
    "Mathmatic",
    "Kurdish",
    "English",
    "Arabic",
    "Mathmatic",
    "Kurdish",
    "English",
    "Arabic",
    "Mathmatic",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView.builder(
          itemCount: _className.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("teacher_post");
                    },
                    child: Text("${_className[index]}"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
