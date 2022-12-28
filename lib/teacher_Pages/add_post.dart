import 'package:flutter/material.dart';
import 'package:sepia_app/custom_widget.dart';
import 'package:sepia_app/constants.dart' as consts;

TextEditingController controller = TextEditingController();

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Post"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            elevation: 25,
            child: customField(
              "Post",
              controller,
              () {},
              maxLines: 7,
              hintText: "What are you think about Name?",
              alignment: TextAlign.start,
            ),
          ),

          // Add to Post
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            elevation: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add to post",
                    style: TextStyle(
                      color: consts.sepiaColor,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.photo),
                      color: consts.sepiaColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // Post button
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: consts.sepiaColor,
                ),
                child: InkWell(
                  child: Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
