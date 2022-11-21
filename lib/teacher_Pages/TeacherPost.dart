import 'package:flutter/material.dart';
import 'package:sepia_app/Constants.dart';

class TeacherPost extends StatefulWidget {
  const TeacherPost({super.key});

  @override
  State<TeacherPost> createState() => _TeacherPostState();
}

class _TeacherPostState extends State<TeacherPost> {
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
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
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
                          "Post",
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
                        "Hi today we have an exercise",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
}
