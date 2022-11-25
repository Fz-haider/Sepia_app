import 'package:flutter/material.dart';
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sepia_app/Images.dart';
import 'package:sepia_app/db_connection.dart';
import 'package:sepia_app/introduction_screen.dart';
import 'package:sepia_app/start_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sepia_app/constants.dart' as consts;
import 'package:sepia_app/parent_pages/parent_id_submit.dart';
import 'package:sepia_app/parent_pages/parent_notification.dart';
import 'package:sepia_app/parent_pages/view_post.dart';
import 'package:sepia_app/parent_pages/parent_home_page.dart';
import 'package:sepia_app/teacher_pages/teacher_id_submit.dart';
import 'package:sepia_app/teacher_pages/teacher_home_page.dart';
import 'package:sepia_app/teacher_pages/teacher_notification.dart';
import 'package:sepia_app/teacher_pages/teacher_post.dart';

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
    //store basic user informations in constants
    consts.userID = prefs.getInt(consts.prefs_userID)!;
    consts.isUserParent = isParent;
    //here we try to get class id if the user was parent
    consts.classID = await getClassID_OfStudent(consts.userID);
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

  //return the page to start from
  Widget pageToStart() {
    //if user logged in before, then show the parent or teacher page
    //based on a boolean in the sharedpreferences
    if (isUserLogged) {
      return isParent! ? ParentHomePage() : TeacherHomePage();
    }
    //if user didn't logged in before check if he's seen the
    //introduction screen page, if he did then show start page
    //and if not show the introduction screen page
    else {
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
        //adding localization feature
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
          "parent": (context) => ParentID_Submit(),
          "teacher": (context) => TeacherID_Submit(),
          //"teacher_post": (context) => TeacherPost(),
          //"view_post": (context) => ViewPost(),
          "parent_home_page": (context) => ParentHomePage(),
          "teacher_home_page": (context) => TeacherHomePage(),
          "teacher_notification": (context) => TeacherNotification(),
          "parent_notification": (context) => ParentNotification(),
        });
  }
}
