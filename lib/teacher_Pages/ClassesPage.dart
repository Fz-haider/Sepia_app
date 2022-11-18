import 'package:flutter/material.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 25),
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
