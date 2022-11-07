import 'package:flutter/material.dart';
import 'package:sepia_app/custom_widget.dart';

class start_page extends StatelessWidget {
  const start_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Sepia',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 7,
              fontSize: 27,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                    image: AssetImage('assets/images/welcome-1.png'),
                    fit: BoxFit.cover),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customImageButton(
                      "assets/images/family.png",
                      'Parent',
                      width: 30,
                      paddingVertical: 18,
                      paddingHorizontal: 18,
                      () {
                        Navigator.of(context).pushNamed("parent");
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    customImageButton(
                      "assets/images/teacher.png",
                      'Teacher',
                      width: 30,
                      paddingVertical: 18,
                      paddingHorizontal: 18,
                      () {
                        Navigator.of(context).pushNamed("teacher");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
