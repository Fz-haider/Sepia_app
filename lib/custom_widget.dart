import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sepia_app/images.dart';
import 'package:sepia_app/models/post.dart';
import 'package:sepia_app/constants.dart' as consts;
import 'package:sepia_app/models/student.dart';

Container gradientColor() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(146, 97, 52, 0.1),
          Color.fromRGBO(146, 97, 52, 1),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
    ),
  );
}

// Custom Elevated Button
ElevatedButton customImageButton(
  String image,
  String label,
  void Function() onPressed, {
  double elevation = 6,
  double paddingVertical = 20,
  double paddingHorizontal = 20,
  double width = 28,
  double letterSpacing = 0,
}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: elevation,
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
    ),
    icon: Image.asset(
      image,
      color: Colors.white,
      fit: BoxFit.cover,
      width: width,
    ),
    label: Text(
      label,
      style: TextStyle(
        fontSize: 16,
        letterSpacing: letterSpacing,
      ),
    ),
    onPressed: onPressed,
  );
}

// Custom Icon Button
ElevatedButton customIconButton(
  IconData icon,
  String label,
  void Function() onPressed, {
  double elevation = 6,
  double paddingVertical = 20,
  double paddingHorizontal = 20,
  double size = 20,
  double fontSize = 22,
  double letterSpacing = 0,
}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      elevation: elevation,
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
    ),
    icon: Icon(
      icon,
      size: size,
    ),
    label: Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      ),
    ),
    onPressed: onPressed,
  );
}

// Custom TextField
TextFormField customField(
  String label,
  TextEditingController controller,
  void Function() onTap, {
  TextAlign alignment = TextAlign.center,
  String hintText = '',
  int maxLines = 1,
  int maxLength = 0,
  bool obscureText = false,
}) {
  return TextFormField(
    onTap: onTap,
    controller: controller,
    textAlign: alignment,
    decoration: InputDecoration(
      label: Text(label),
      hintText: hintText,
    ),
    maxLines: maxLines,
    maxLength: maxLength == 0 ? null : maxLength,
    obscureText: obscureText,
  );
}

//post widget
Widget postWidget(Post post) {
  //organize the post details
  //get the full teacher name
  var teacherName =
      [post.teacher_f_name, post.teacher_m_name, post.teacher_l_name].join(' ');
  //get the teacher picture if it exists
  NetworkImage? teacherLogo;
  teacherLogo = post.teacher_picture == null
      ? null
      : NetworkImage(
          consts.db_connection_addr_images + post.teacher_picture!,
        );
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
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(children: [
            Container(
                width: double.infinity,
                child: Text(
                  post.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
}

//student widget
Widget studentWidget(Student st) {
  //organize the student details
  //get the full student name
  var studentName = [st.f_name, st.m_name, st.l_name].join(' ');
  //get the teacher picture if it exists
  var studentLogo = st.picture == null
      ? null
      : NetworkImage(consts.db_connection_addr_images + st.picture!);
  //get the upper part of the post without student image
  var postHeader = ListTile(
    title: Text(
      studentName,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
    ),
    subtitle: Text(
      'Gender', //st.gender,
      style: TextStyle(fontSize: 12),
    ),
    trailing: Icon(
      Icons.more_vert,
      color: Colors.black,
    ),
  );
  //check if the student image was not null
  if (studentLogo != null) {
    //if it was not null then recreate the upper part with image
    postHeader = ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 20,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: studentLogo,
          radius: 19,
        ),
      ),
      title: Text(
        studentName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      subtitle: Text(
        'Gender', //st.gender,
        style: TextStyle(fontSize: 12),
      ),
      trailing: Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
    );
  }
  //finally return the student image
  return Container(
      child: Card(
    margin: EdgeInsets.all(5),
    child: postHeader,
  ));
}
