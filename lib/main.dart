import 'package:flutter/material.dart';
import 'package:sepia_app/page_view.dart';
import 'package:sepia_app/start_page.dart';
import 'package:sepia_app/parent_Pages/parent_id_submit.dart';
import 'package:sepia_app/parent_Pages/parent_notification.dart';
import 'package:sepia_app/teacher_Pages/teacher_id_submit.dart';
import 'package:sepia_app/parent_Pages/parent_home_page.dart';
import 'package:sepia_app/teacher_Pages/teacher_home_page.dart';
import 'package:sepia_app/teacher_Pages/teacher_notification.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: page_view(),
        routes: {
          "start_page": (context) => const startpage(),
          "parent": (context) => const parent_id_submit(),
          "teacher": (context) => const teacher_id_submit(),
          "parent_home_page": (context) => const parent_home_page(),
          "teacher_home_page": (context) => const teacher_home_page(),
          "teacher_notification": (context) => const teacher_notification(),
          "parent_notification": (context) => const parent_notification(),
        });
  }
}
