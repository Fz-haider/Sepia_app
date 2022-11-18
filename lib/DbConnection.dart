import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Student {
  final int ID;
  final String f_name;

  Student({required this.ID, required this.f_name});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      ID: int.parse(json['ID']),
      f_name: json['f_name'],
    );
  }
}

Future<Student> getStudent(String auth) async {
  final response = await http.post(
    Uri.parse('http://192.168.16.105/sepiawebproject/index.php'),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({'students': 'hello'}),
    encoding: Encoding.getByName("utf-8"),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Student.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

FutureBuilder<Student> makeStudentWidget() {
  return FutureBuilder<Student>(
    future: getStudent('students'),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.f_name);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return const CircularProgressIndicator();
    },
  );
}
