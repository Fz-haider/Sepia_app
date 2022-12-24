import 'package:flutter/material.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/constants.dart' as consts;
import 'package:sepia_app/models/student.dart';

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
          future: getStudentDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Student st = snapshot.data!;
              Widget profileImage = SizedBox();
              if (st.picture != null)
                profileImage = CircleAvatar(
                  backgroundColor: consts.sepiaColor,
                  radius: 40,
                  child: CircleAvatar(
                    backgroundImage: Image(
                            image: NetworkImage(
                                consts.db_connection_addr_images + st.picture!))
                        .image,
                    radius: 39,
                    backgroundColor: Colors.white,
                  ),
                );
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
                              child: profileImage,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              [st.f_name, st.m_name, st.l_name ?? ''].join(' '),
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
                                    Text(st.phone_number),
                                    SizedBox(
                                      height: 70,
                                    ),
                                    Text(st.address ?? '?'),
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

  Future<Student> getStudentDetails() async {
    var data = await getStudentProfile(consts.userID);
    return Student.fromJson(data);
  }
}
