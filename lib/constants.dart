import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Languages { Kurdish, English }

//shared preferences constants
final String prefs_appLanguage = "language";
final String prefs_introductionScreen = "introductionScreen";

//other constants
final Languages defaultLanguage = Languages.English;
final Map<Languages, String> languagePrefs = {
  Languages.English: "en",
  Languages.Kurdish: "ku",
};
late Languages appLanguage;
late MaterialColor sepiaColor;
