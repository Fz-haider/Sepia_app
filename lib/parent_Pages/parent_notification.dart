import 'package:flutter/material.dart';

class parent_notification extends StatefulWidget {
  const parent_notification({super.key});

  @override
  State<parent_notification> createState() => _parent_notificationState();
}

class _parent_notificationState extends State<parent_notification> {
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
