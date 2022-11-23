import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Languages { Kurdish, English }

//shared preferences constants
final String prefs_appLanguage = "language";
final String prefs_introductionScreen = "introductionScreen";
final String prefs_isParent = "isParent";
final String prefs_userID = "userID";

//user specifications
late int userID;
late bool isUserParent;
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
final String db_connection_addr = "http://192.168.16.104/sepiawebproject/";
final String db_connection_addr_index = db_connection_addr + "index.php";
