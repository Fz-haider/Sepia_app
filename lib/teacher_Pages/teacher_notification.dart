import 'package:flutter/material.dart';

class teacher_notification extends StatefulWidget {
  const teacher_notification({super.key});

  @override
  State<teacher_notification> createState() => _teacher_notificationState();
}

class _teacher_notificationState extends State<teacher_notification> {
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
                  child: Text("Mark all as read",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      )),
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
