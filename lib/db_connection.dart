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

Future<http.Response> createPostRequest(Map<dynamic, dynamic> body) async {
  //you can check connection and other things here later
  return await http.post(
    Uri.parse(db_connection_addr_index),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode(body),
    encoding: Encoding.getByName("utf-8"),
  );
}

//getting a student from the database
Future<dynamic>? getStudent(String userName, String password) async {
  final response = await createPostRequest({
    'studentCheck': {'userName': userName, 'password': password}
  });

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
  final response = await createPostRequest({
    'teacherCheck': {'userName': userName, 'password': password}
  });

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

//getting a student from the database
Future<dynamic>? getClassID_OfStudent(int studentID) async {
  final response = await createPostRequest({
    'getStudentClassID': {'studentID': studentID}
  });

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    //states for checking the student credentials:
    //0 - means user name does not exist in database
    //1 - means user name is correct but password is incorrect
    //2 - means credentials are right
    return result;
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}

//getting classes of a teacher
Future<dynamic>? getClassesOfTeacher(int teacherID) async {
  final response = await createPostRequest({
    'teacherClasses': {'teacherID': teacherID}
  });

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return result;
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}

//getting classes of a student
Future<dynamic>? getClassesOfStudent(int classID) async {
  final response = await createPostRequest({
    'studentClasses': {'classID': classID}
  });

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return result;
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}

//getting posts of a teacher
Future<dynamic>? getPosts(int teacherID, int classID) async {
  final response = await createPostRequest({
    'teacherPosts': {'teacherID': teacherID, 'classID': classID}
  });

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return result;
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}

//get profile details of the student
Future<dynamic>? getStudentProfile(int studentID) async {
  final response = await createPostRequest({
    'getStudentProfile': {'studentID': studentID}
  });

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return result;
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}

//get profile details of the teacher
Future<dynamic>? getTeacherProfile(int teacherID) async {
  final response = await createPostRequest({
    'getTeacherProfile': {'teacherID': teacherID}
  });

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return result;
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}

//get students of class
Future<dynamic>? getStudentsOfClass(int classID) async {
  final response = await createPostRequest({
    'getStudentsOfClass': {'classID': classID}
  });

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    return result;
  } else {
    print('Failed to connect to the database!');
    return null;
  }
}
