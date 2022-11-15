import 'package:flutter/material.dart';
import 'package:flutter_kurdish_localization/flutter_kurdish_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sepia_app/images.dart';
import 'package:sepia_app/introduction_screen.dart';
import 'package:sepia_app/start_page.dart';
import 'package:sepia_app/parent_Pages/parent_id_submit.dart';
import 'package:sepia_app/parent_Pages/parent_notification.dart';
import 'package:sepia_app/teacher_Pages/teacher_id_submit.dart';
import 'package:sepia_app/parent_Pages/parent_home_page.dart';
import 'package:sepia_app/teacher_Pages/teacher_home_page.dart';
import 'package:sepia_app/teacher_Pages/teacher_notification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sepia_app/constants.dart' as consts;
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

  //load whether the introduction screen is shown before or not
  bool? isShown = prefs.getBool(consts.prefs_introductionScreen);
  if (isShown == null) {
    isShown = false;
    prefs.setBool(consts.prefs_introductionScreen, true);
  }

  //then start the app
  runApp(SepiaApp(isIntroductionShown: isShown));
}

class SepiaApp extends StatelessWidget {
  SepiaApp({super.key, required this.isIntroductionShown});
  final bool isIntroductionShown;

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
        home: isIntroductionShown ? StartPage() : IntroductionScreen(),
        //choosing the custom color as the primary swatch
        theme: ThemeData(
          primarySwatch: consts.sepiaColor,
          fontFamily: 'Nrt',
        ),
        title: 'Sepia',
        routes: {
          "start_page": (context) => StartPage(),
          "parent": (context) => const parent_id_submit(),
          "teacher": (context) => const teacher_id_submit(),
          "parent_home_page": (context) => const parent_home_page(),
          "teacher_home_page": (context) => const teacher_home_page(),
          "teacher_notification": (context) => const teacher_notification(),
          "parent_notification": (context) => const parent_notification(),
        });
  }
}
