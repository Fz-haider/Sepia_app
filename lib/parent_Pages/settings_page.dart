import 'package:flutter/material.dart';

class settings_page extends StatefulWidget {
  const settings_page({super.key});

  @override
  State<settings_page> createState() => _settings_pageState();
}

class _settings_pageState extends State<settings_page> {
  bool darkmode = false;
  String selectedCountry = "English";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            SwitchListTile(
              secondary: Image(
                  image: AssetImage('assets/images/dark-mode.png'),
                  fit: BoxFit.cover,
                  height: 37,
                  width: 30),
              title: Text("Dark mode"),
              value: darkmode,
              onChanged: (value) {
                setState(() {
                  darkmode = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image(
                image: AssetImage('assets/images/world.png'),
                height: 35,
                width: 30,
              ),
              title: Text("Languages"),
              trailing: DropdownButton(
                items: ["English", "Kurdish"]
                    .map((element) => DropdownMenuItem(
                          child: Text("$element"),
                          value: element,
                        ))
                    .toList(),
                value: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image(
                  image: AssetImage('assets/images/info.png'),
                  height: 34,
                  width: 30),
              title: Text("About us"),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image(
                  image: AssetImage('assets/images/log-out.png'),
                  height: 30,
                  width: 40),
              title: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
