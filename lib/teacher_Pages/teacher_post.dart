import 'package:flutter/material.dart';
import 'package:sepia_app/constants.dart';
import 'package:sepia_app/custom_widget.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/images.dart';
import 'package:sepia_app/models/post.dart';
import 'package:sepia_app/constants.dart' as consts;
import 'package:sepia_app/models/student.dart';

class TeacherPost extends StatefulWidget {
  TeacherPost({super.key, required this.classID, required this.teacherID});

  final int classID, teacherID;

  @override
  State<TeacherPost> createState() =>
      _TeacherPostState(classID: classID, teacherID: teacherID);
}

class _TeacherPostState extends State<TeacherPost> {
  _TeacherPostState({required this.classID, required this.teacherID});

  final int classID, teacherID;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Post'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.of(context).pushNamed("teacher_notification");
              },
            ),
          ],
          bottom: TabBar(
              labelColor: consts.sepiaColor,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.newspaper),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.groups),
                  ),
                ),
              ]),
        ),
        backgroundColor: consts.backgroundColor,
        body: TabBarView(
          children: [
            getPostsOfTeacher(teacherID, classID, refreshPage),
            getStudentsOfClass_(classID, refreshPage)
          ],
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromRGBO(115, 67, 13, .9),
          ),
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Future<void> refreshPage() async {
    setState(() {});
  }
}

FutureBuilder<dynamic> getPostsOfTeacher(
    int teacherID, int classID, Future<void> Function() onRefresh) {
  return FutureBuilder<dynamic>(
    future: getPosts(teacherID, classID),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<Post> posts = [];
        for (var obj in snapshot.data!) {
          posts.add(Post.fromJson(obj));
        }
        return RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return postWidget(posts[index]);
              },
            ));
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return CircularProgressIndicator();
    },
  );
}

FutureBuilder<dynamic> getStudentsOfClass_(
    int classID, Future<void> Function() onRefresh) {
  return FutureBuilder<dynamic>(
    future: getStudentsOfClass(classID),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<Student> students = [];
        for (var obj in snapshot.data!) {
          students.add(Student.fromJson(obj));
        }
        return RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: students.length,
              itemBuilder: (context, index) {
                return studentWidget(students[index]);
              },
            ));
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return CircularProgressIndicator();
    },
  );
}
