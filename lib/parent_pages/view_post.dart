import 'package:flutter/material.dart';
import 'package:sepia_app/custom_widget.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/models/post.dart';
import 'package:sepia_app/constants.dart' as consts;

class ViewPost extends StatefulWidget {
  const ViewPost({super.key, required this.classID, required this.teacherID});

  final int classID;
  final int teacherID;

  @override
  State<ViewPost> createState() =>
      _ViewPostState(classID: classID, teacherID: teacherID);
}

class _ViewPostState extends State<ViewPost> {
  _ViewPostState({required this.classID, required this.teacherID});

  final int classID;
  final int teacherID;

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
                  Navigator.of(context).pushNamed("parent_notification");
                },
              ),
            ],
          ),
          backgroundColor: consts.backgroundColor,
          body: getPostsOfStudent(teacherID, classID, onRefresh)),
    );
  }

  Future<void> onRefresh() async {
    setState(() {});
  }
}

FutureBuilder<dynamic> getPostsOfStudent(
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
