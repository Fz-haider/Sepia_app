import 'package:flutter/material.dart';
import 'package:sepia_app/CustomWidget.dart';
import 'package:sepia_app/Images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Sepia',
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                    image: AssetImage(Images.START_PAGE_BACKGROUND),
                    fit: BoxFit.cover),
                /*Text(
                  'Are you parent of a student?\n or you are a teacher?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      height: 1.5,
                      color: Color.fromRGBO(115, 43, 57, 1)),
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customImageButton(
                      Images.FAMILY,
                      AppLocalizations.of(context)!.parent,
                      width: 28,
                      paddingVertical: 20,
                      paddingHorizontal: 26,
                      () {
                        Navigator.of(context).pushNamed("parent");
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    customImageButton(
                      Images.TEACHER,
                      AppLocalizations.of(context)!.teacher,
                      width: 30,
                      paddingVertical: 18,
                      paddingHorizontal: 18,
                      () {
                        Navigator.of(context).pushNamed("teacher");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
