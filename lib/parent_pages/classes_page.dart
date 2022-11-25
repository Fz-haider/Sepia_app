import 'package:flutter/material.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sepia_app/models/student_class.dart';
import 'package:sepia_app/parent_pages/view_post.dart';
import 'package:sepia_app/constants.dart' as consts;
import 'package:sepia_app/teacher_pages/teacher_post.dart';

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
          body: getClassesList(consts.classID)),
    );
  }
}

FutureBuilder<dynamic> getClassesList(int classID) {
  return FutureBuilder<dynamic>(
    future: getClassesOfStudent(classID),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<StudentClass> classes = [];
        for (var obj in snapshot.data!) {
          classes.add(StudentClass.fromJson(obj));
        }
        return ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            //getting current class details
            var class_ = classes[index];
            var teacherName = [
              class_.teacher_f_name,
              class_.teacher_m_name,
              class_.teacher_l_name
            ].join(' ');
            //get the teacher picture if it exists
            var teacherLogo = class_.teacher_picture == null
                ? SizedBox()
                : CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          consts.db_connection_addr_images +
                              class_.teacher_picture!),
                      radius: 19,
                    ),
                  );
            //finally return the list item
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
                                      classID: class_.class_id,
                                      teacherID: class_.teacher_id))),
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
                                child: Text(class_.subject,
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
                              ),
                              Container(
                                  height: 60,
                                  padding: EdgeInsets.all(10),
                                  child: Row(children: [
                                    teacherLogo,
                                    SizedBox(width: 10),
                                    Text(teacherName)
                                  ]))
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
