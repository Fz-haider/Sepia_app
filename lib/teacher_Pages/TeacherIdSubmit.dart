import 'package:flutter/material.dart';
import 'package:sepia_app/CustomWidget.dart';
import 'package:sepia_app/Main.dart';

class TeacherIdSubmit extends StatelessWidget {
  const TeacherIdSubmit({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Teacher"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 250,
                child: customField(
                  "Enter Your ID",
                  () {},
                  maxLength: 6,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            customIconButton(
              Icons.arrow_circle_right_outlined,
              "Submit",
              () {
                Navigator.of(context).pushReplacementNamed("teacher_home_page");
              },
              paddingVertical: 15,
              paddingHorizontal: 15,
            )
          ],
        ),
      ),
    );
  }
}
