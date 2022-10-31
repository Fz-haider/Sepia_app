import 'package:flutter/material.dart';
import 'package:sepia_app/custom_widget.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Color.fromRGBO(146, 97, 52, 0.3),
                Color.fromRGBO(146, 97, 52, 0.7),
              ], radius: 3),
            ),
          ),
          elevation: 0,
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(146, 97, 52, 0.3),
                Color.fromRGBO(146, 97, 52, 0.9),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(colors: [
                        Color.fromRGBO(146, 97, 52, 1),
                        Color.fromRGBO(146, 97, 52, 0.2),
                      ], radius: 5),
                    ),
                    child: customImageButton(
                      "assets/images/family.png",
                      'Parent',
                      width: 30,
                      letterSpacing: 2,
                      paddingVertical: 22,
                      paddingHorizontal: 28,
                      () {
                        Navigator.of(context).pushNamed("parent");
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(colors: [
                        Color.fromRGBO(146, 97, 52, 1),
                        Color.fromRGBO(146, 97, 52, 0.2),
                      ], radius: 5),
                    ),
                    child: customImageButton(
                      "assets/images/teacher.png",
                      'Teacher',
                      width: 30,
                      letterSpacing: 2,
                      paddingVertical: 22,
                      paddingHorizontal: 28,
                      () {
                        Navigator.of(context).pushNamed("teacher");
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
