import 'package:flutter/material.dart';
import 'package:sepia_app/page_view.dart';
import 'package:sepia_app/parent_Pages/parent_id_submit.dart';
import 'package:sepia_app/teacher_Pages/teacher_id_submit.dart';
import 'package:sepia_app/parent_Pages/parent_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const page_view(),
        routes: {
          "parent": (context) => const parent_id_submit(),
          "teacher": (context) => const teacher_id_submit(),
          "parent_home_page": (context) => const parent_home_page(),
        });
  }
}
