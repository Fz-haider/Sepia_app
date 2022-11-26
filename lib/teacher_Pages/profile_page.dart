import 'package:flutter/material.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/constants.dart' as consts;
import 'package:sepia_app/models/student.dart';
import 'package:sepia_app/models/teacher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
          future: getTeacherDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Teacher tc = snapshot.data!;
              return Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: CircleAvatar(
                                backgroundColor: consts.sepiaColor,
                                radius: 40,
                                child: CircleAvatar(
                                  backgroundImage: tc.picture == null
                                      ? AssetImage(
                                          'assets/images/teacher.png',
                                        )
                                      : Image(
                                              image: NetworkImage(consts
                                                      .db_connection_addr_images +
                                                  tc.picture!))
                                          .image,
                                  radius: 39,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              [tc.f_name, tc.m_name, tc.l_name ?? ''].join(' '),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'email',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 90,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      size: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(tc.phone_number),
                                    SizedBox(
                                      height: 70,
                                    ),
                                    Text(tc.address ?? '?'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else
              return CircularProgressIndicator();
          }),
    ));
  }

  Future<Teacher> getTeacherDetails() async {
    var data = await getTeacherProfile(consts.userID);
    return Teacher.fromJson(data);
  }
}
