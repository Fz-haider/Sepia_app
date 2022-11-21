import 'package:flutter/material.dart';
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sepia_app/Images.dart';
import 'package:sepia_app/IntroductionScreen.dart';
import 'package:sepia_app/StartPage.dart';
import 'package:sepia_app/parent_Pages/ParentIdSubmit.dart';
import 'package:sepia_app/parent_Pages/ParentNotification.dart';
import 'package:sepia_app/parent_Pages/ViewPost.dart';
import 'package:sepia_app/teacher_Pages/TeacherIdSubmit.dart';
import 'package:sepia_app/parent_Pages/ParentHomePage.dart';
import 'package:sepia_app/teacher_Pages/TeacherHomePage.dart';
import 'package:sepia_app/teacher_Pages/TeacherNotification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sepia_app/constants.dart' as consts;
import 'package:sepia_app/teacher_Pages/TeacherPost.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //initialize shared preferences
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  //load the language from the preferences
  String? language = prefs.getString(consts.prefs_appLanguage);
  if (language == null) {
    prefs.setString(consts.prefs_appLanguage,
        consts.languagePrefs[consts.defaultLanguage]!);
    consts.appLanguage = consts.defaultLanguage;
  } else {
    for (var i in consts.languagePrefs.entries) {
      if (i.value == language) {
        consts.appLanguage = i.key;
        break;
      }
    }
  }

  //load whether user logged in or not
  bool isUserLogged = false;
  bool? isParent = prefs.getBool(consts.prefs_isParent);
  if (isParent != null) {
    isUserLogged = true;
  }

  //load whether the introduction screen is shown before or not
  bool? isShown = prefs.getBool(consts.prefs_introductionScreen);
  if (isShown == null) {
    isShown = false;
    prefs.setBool(consts.prefs_introductionScreen, true);
  }

  //then start the app
  runApp(SepiaApp(
      isIntroductionShown: isShown,
      isUserLogged: isUserLogged,
      isParent: isParent));
}

class SepiaApp extends StatelessWidget {
  SepiaApp(
      {super.key,
      required this.isIntroductionShown,
      required this.isUserLogged,
      required this.isParent});
  final bool isIntroductionShown, isUserLogged;
  final bool? isParent;

  Widget pageToStart() {
    if (isUserLogged) {
      return isParent! ? ParentHomePage() : TeacherHomePage();
    } else {
      return isIntroductionShown ? StartPage() : IntroductionScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    //precache all the images we use here
    Images.precacheAllImages(context);

    //create our custom color here
    var colorSwatch = {
      50: Color.fromRGBO(115, 67, 13, .1),
      100: Color.fromRGBO(115, 67, 13, .2),
      200: Color.fromRGBO(115, 67, 13, .3),
      300: Color.fromRGBO(115, 67, 13, .4),
      400: Color.fromRGBO(115, 67, 13, .5),
      500: Color.fromRGBO(115, 67, 13, .6),
      600: Color.fromRGBO(115, 67, 13, .7),
      700: Color.fromRGBO(115, 67, 13, .8),
      800: Color.fromRGBO(115, 67, 13, .9),
      900: Color.fromRGBO(115, 67, 13, 1),
    };
    consts.sepiaColor = new MaterialColor(0xff73430d, colorSwatch);

    //make the application ready to display
    return MaterialApp(
        //adding localization future
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          KurdishMaterialLocalizations.delegate,
          KurdishWidgetLocalizations.delegate,
        ],
        supportedLocales: [
          for (var v in consts.languagePrefs.values) Locale(v)
        ],
        locale: Locale(consts.languagePrefs[consts.defaultLanguage]!),
        debugShowCheckedModeBanner: false,
        home: pageToStart(),
        //choosing the custom color as the primary swatch
        theme: ThemeData(
          primarySwatch: consts.sepiaColor,
          fontFamily: 'Nrt',
        ),
        title: 'Sepia',
        routes: {
          "start_page": (context) => StartPage(),
          "parent": (context) => ParentIdSubmit(),
          "teacher": (context) => const TeacherIdSubmit(),
          "teacher_post": (context) => const TeacherPost(),
          "view_post": (context) => const ViewPost(),
          "parent_home_page": (context) => const ParentHomePage(),
          "teacher_home_page": (context) => const TeacherHomePage(),
          "teacher_notification": (context) => const TeacherNotification(),
          "parent_notification": (context) => const ParentNotification(),
        });
  }
}
