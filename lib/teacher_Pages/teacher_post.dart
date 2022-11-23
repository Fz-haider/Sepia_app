import 'package:flutter/material.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/images.dart';
import 'package:sepia_app/models/post.dart';
import 'package:sepia_app/constants.dart' as consts;

class TeacherPost extends StatefulWidget {
  TeacherPost({super.key, required this.classID});

  final int classID;

  @override
  State<TeacherPost> createState() => _TeacherPostState(classID: classID);
}

class _TeacherPostState extends State<TeacherPost> {
  _TeacherPostState({required this.classID});

  final int classID;

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
        backgroundColor: Colors.deepPurple[100],
        body: /**/
            getPostsOfTeacher(consts.userID, classID),
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
}

FutureBuilder<dynamic> getPostsOfTeacher(int teacherID, int classID) {
  return FutureBuilder<dynamic>(
    future: getPosts(teacherID, classID),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<Post> posts = [];
        for (var obj in snapshot.data!) {
          posts.add(Post.fromJson(obj));
        }
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              height: 300,
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        trailing: Icon(
                          Icons.more_vert,
                          color: Colors.black,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/images/teacher.png"),
                            radius: 18,
                          ),
                        ),
                        title: Text(
                          posts[index].title,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      color: Colors.grey[100],
                      child: Text(
                        posts[index].p_body ?? '',
                      ),
                    ),
                  ),
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
