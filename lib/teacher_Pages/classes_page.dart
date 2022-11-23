import 'package:flutter/material.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/images.dart';
import 'package:sepia_app/models/teacher_class.dart';
import 'package:sepia_app/constants.dart' as consts;
import 'package:sepia_app/teacher_Pages/teacher_post.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: getClassesList(consts.userID)),
    );
  }
}

FutureBuilder<dynamic> getClassesList(int teacherID) {
  return FutureBuilder<dynamic>(
    future: getClassesOfTeacher(teacherID),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<TeacherClass> classes = [];
        for (var obj in snapshot.data!) {
          classes.add(TeacherClass.fromJson(obj));
        }
        return ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => TeacherPost(
                                      classID: classes[index].class_id))),
                          child: Container(
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                    "${classes[index].grade} - ${classes[index].label} / ${classes[index].subject}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(18),
                                      bottomRight: Radius.circular(18)),
                                  image: DecorationImage(
                                      image: AssetImage(Images.LESSON),
                                      fit: BoxFit.fill),
                                ),
                                height: 160,
                                //becareful that there is aspect ratio of 2.1
                                width: 340,
                              )
                            ]),
                          ))),
                ],
              ),
            );
          },
        );
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return CircularProgressIndicator();
    },
  );
}
