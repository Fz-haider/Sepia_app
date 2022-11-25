import 'package:flutter/material.dart';
import 'package:sepia_app/constants.dart';
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
        body: /**/
            getPostsOfTeacher(teacherID, classID, refreshPage),
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
                //organize the post details
                var post = posts[index];
                //get the full teacher name
                var teacherName = [
                  post.teacher_f_name,
                  post.teacher_m_name,
                  post.teacher_l_name
                ].join(' ');
                //get the teacher picture if it exists
                var teacherLogo = post.teacher_picture == null
                    ? null
                    : NetworkImage(
                        db_connection_addr_images + post.teacher_picture!);
                //get the upper part of the post without teacher image
                var postHeader = ListTile(
                  title: Text(
                    teacherName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  subtitle: Text(
                    post.subject,
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                );
                //check if the teacher image was not null
                if (teacherLogo != null) {
                  //if it was not null then recreate the upper part with image
                  postHeader = ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: teacherLogo,
                        radius: 19,
                      ),
                    ),
                    title: Text(
                      teacherName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    subtitle: Text(
                      post.subject,
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  );
                }
                //finally return the post image
                return Container(
                    child: Card(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        child: postHeader,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(children: [
                          Container(
                              width: double.infinity,
                              child: Text(
                                post.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            post.p_body ?? '',
                          ),
                        ]),
                      ),
                    ],
                  ),
                ));
              },
            ));
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return CircularProgressIndicator();
    },
  );
}
