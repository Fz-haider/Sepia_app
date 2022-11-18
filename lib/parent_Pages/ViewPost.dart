import 'package:flutter/material.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({super.key});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
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
      ),
    );
  }
}
