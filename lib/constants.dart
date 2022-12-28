import 'package:flutter/material.dart';

enum Languages { Kurdish, English }

//shared preferences constants
final String prefs_appLanguage = "language";
final String prefs_introductionScreen = "introductionScreen";
final String prefs_isParent = "isParent";
final String prefs_userID = "userID";

//user specifications
late int userID; //this is either student id or teacher id
late bool isUserParent;
late int classID; //this is only for students or (parents)
//note: we can also store teacher or student informations
//but they might be updated periodically so we prefer not to do that

//other constants
final Languages defaultLanguage = Languages.English;
final Map<Languages, String> languagePrefs = {
  Languages.English: "en",
  Languages.Kurdish: "ku",
};
late Languages appLanguage;
late MaterialColor sepiaColor;
final Color redColor = Color.fromARGB(255, 162, 11, 0);
final Color backgroundColor = Color.fromARGB(255, 248, 242, 237);
final String db_connection_addr = "https://wambly-jury.000webhostapp.com/";
final String db_connection_addr_images = db_connection_addr + "images/";
final String db_connection_addr_index = db_connection_addr + "index.php";
