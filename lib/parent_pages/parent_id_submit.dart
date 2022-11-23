import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sepia_app/custom_widget.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/constants.dart' as consts;
import 'package:sepia_app/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentID_Submit extends StatefulWidget {
  ParentID_Submit({super.key});

  @override
  State<ParentID_Submit> createState() => _ParentID_Submit();
}

class _ParentID_Submit extends State<ParentID_Submit> {
  late Widget loginInfo;
  late TextEditingController txt_userName, txt_password;

  _ParentID_Submit() {
    //make a widget for displaying login info
    loginInfo = SizedBox();
    txt_userName = TextEditingController();
    txt_password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Parent"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 250,
                child: customField(
                  "User name",
                  txt_userName,
                  () {},
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 250,
                child: customField(
                  "Password",
                  txt_password,
                  () {},
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            customIconButton(
              Icons.arrow_circle_right_outlined,
              "Submit",
              () {
                setState(() {
                  loginInfo =
                      checkStudentInfo(txt_userName.text, txt_password.text);
                });
              },
              paddingVertical: 15,
              paddingHorizontal: 15,
            ),
            SizedBox(height: 50),
            loginInfo
          ],
        ),
      ),
    );
  }
}

FutureBuilder<dynamic> checkStudentInfo(String userName, String password) {
  return FutureBuilder<dynamic>(
    future: getStudent(userName, password),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        Pair result = snapshot.data!;
        if (result.a == 2) {
          //after the build process do these things
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            //this means both of creds are right
            Student student = Student.fromJson(result.b);

            //do some changes in shared preferences
            SharedPreferences.getInstance().then((value) {
              //set the isParent variable to true in preferences
              value.setBool(consts.prefs_isParent, true);
              //set the userID variable in shared preferences
              value.setInt(consts.prefs_userID, student.ID);
            });

            //then store basic user information in constants
            consts.userID = student.ID;
            consts.isUserParent = true;

            //navigate to the parent home page
            Navigator.of(context)
                .pushNamedAndRemoveUntil("parent_home_page", (e) => false);
          });
          //return a text with success message
          return Text(
            'Successfully signed in.',
            style: TextStyle(color: Colors.green),
          );
        } else if (result.a == 1) {
          //this means user name is right
          return Text(
            'Wrong password!',
            style: TextStyle(color: consts.redColor),
          );
        } else {
          //this means user name is wrong
          return Text(
            'Wrong user name!',
            style: TextStyle(color: consts.redColor),
          );
        }
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return const CircularProgressIndicator();
    },
  );
}
