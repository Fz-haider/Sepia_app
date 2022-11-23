import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sepia_app/constants.dart';
import 'package:sepia_app/models/student.dart';

//a model for returning two types together like in othre languages
class Pair<A, B> {
  final A a;
  final B b;
  Pair(this.a, this.b);
}

//getting a student from the database
Future<dynamic>? getStudent(String userName, String password) async {
  final response = await http.post(
    Uri.parse(db_connection_addr_index),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      'studentCheck': {'userName': userName, 'password': password}
    }),
    encoding: Encoding.getByName("utf-8"),
  );

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    //states for checking the student credentials:
    //0 - means user name does not exist in database
    //1 - means user name is correct but password is incorrect
    //2 - means credentials are right
    return Pair(result['state'], result['student']);
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}

//getting a teacher from the database
Future<dynamic>? getTeacher(String userName, String password) async {
  final response = await http.post(
    Uri.parse(db_connection_addr_index),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      'teacherCheck': {'userName': userName, 'password': password}
    }),
    encoding: Encoding.getByName("utf-8"),
  );

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    //states for checking the student credentials:
    //0 - means user name does not exist in database
    //1 - means user name is correct but password is incorrect
    //2 - means credentials are right
    return Pair(result['state'], result['teacher']);
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}

//getting classes of a teacher
Future<dynamic>? getClassesOfTeacher(int teacherID) async {
  final response = await http.post(
    Uri.parse(db_connection_addr_index),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      'teacherClasses': {'teacherID': teacherID}
    }),
    encoding: Encoding.getByName("utf-8"),
  );

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return result;
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}

//getting posts of a teacher
Future<dynamic>? getPosts(int teacherID) async {
  final response = await http.post(
    Uri.parse(db_connection_addr_index),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      'teacherPosts': {'teacherID': teacherID}
    }),
    encoding: Encoding.getByName("utf-8"),
  );

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return result;
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}
