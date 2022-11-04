import 'package:flutter/material.dart';
import 'package:sepia_app/custom_widget.dart';
import 'package:sepia_app/main.dart';

class parent_id_submit extends StatelessWidget {
  const parent_id_submit({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Parent"),
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
                Navigator.of(context).pushReplacementNamed("parent_home_page");
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
