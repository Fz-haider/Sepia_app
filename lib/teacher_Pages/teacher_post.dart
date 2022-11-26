import 'package:flutter/material.dart';
import 'package:sepia_app/constants.dart';
import 'package:sepia_app/custom_widget.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/images.dart';
import 'package:sepia_app/models/post.dart';
import 'package:sepia_app/constants.dart' as consts;

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
    return SafeArea(
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
        ),
        backgroundColor: consts.backgroundColor,
        body: getPostsOfTeacher(teacherID, classID, refreshPage),
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
