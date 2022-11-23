import 'package:flutter/material.dart';

class TeacherNotification extends StatefulWidget {
  const TeacherNotification({super.key});

  @override
  State<TeacherNotification> createState() => _TeacherNotificationState();
}

class _TeacherNotificationState extends State<TeacherNotification> {
  bool notify = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Notification'),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              ListTile(
                trailing: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Mark all as read",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                  ),
                ),
              ),
              SwitchListTile(
                secondary: Icon(Icons.notifications),
                title: Text("Kurdish"),
                subtitle: Text("Tomorow you have exam "),
                value: notify,
                onChanged: (value) {
                  setState(() {
                    notify = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
