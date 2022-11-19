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
    "Sport",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: _className.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.of(context).pushNamed("view_post"),
              borderRadius: BorderRadius.circular(80),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(115, 67, 13, .9),
                ),
                alignment: Alignment.center,
                child: Text(
                  "${_className[index]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
