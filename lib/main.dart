import 'package:flutter/material.dart';
import 'package:sepia_app/images.dart';
import 'package:sepia_app/introduction_screen.dart';
import 'package:sepia_app/start_page.dart';
import 'package:sepia_app/parent_Pages/parent_id_submit.dart';
import 'package:sepia_app/parent_Pages/parent_notification.dart';
import 'package:sepia_app/teacher_Pages/teacher_id_submit.dart';
import 'package:sepia_app/parent_Pages/parent_home_page.dart';
import 'package:sepia_app/teacher_Pages/teacher_home_page.dart';
import 'package:sepia_app/teacher_Pages/teacher_notification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //precache all the images we use here
    Images.precacheAllImages(context);

    //create our custom color here
    var colorSwatch = {
      50: Color.fromRGBO(115, 67, 13, .1),
      100: Color.fromRGBO(115, 67, 13, .2),
      200: Color.fromRGBO(115, 67, 13, .3),
      300: Color.fromRGBO(115, 67, 13, .4),
      400: Color.fromRGBO(115, 67, 13, .5),
      500: Color.fromRGBO(115, 67, 13, .6),
      600: Color.fromRGBO(115, 67, 13, .7),
      700: Color.fromRGBO(115, 67, 13, .8),
      800: Color.fromRGBO(115, 67, 13, .9),
      900: Color.fromRGBO(115, 67, 13, 1),
    };
    MaterialColor sepiaColor = new MaterialColor(0xff73430d, colorSwatch);

    //make the application ready to display
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: introduction_screen(),
        theme: ThemeData(
          primarySwatch: sepiaColor,
        ),
        routes: {
          "start_page": (context) => const start_page(),
          "parent": (context) => const parent_id_submit(),
          "teacher": (context) => const teacher_id_submit(),
          "parent_home_page": (context) => const parent_home_page(),
          "teacher_home_page": (context) => const teacher_home_page(),
          "teacher_notification": (context) => const teacher_notification(),
          "parent_notification": (context) => const parent_notification(),
        });
  }
}
