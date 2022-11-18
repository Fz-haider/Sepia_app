import 'package:flutter/material.dart';
import 'package:sepia_app/CustomWidget.dart';
import 'package:sepia_app/Images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sepia_app/Constants.dart';

class IntroductionScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    //initialize fields
    var images = [
      Image(image: AssetImage(Images.WELCOME_1)),
      Image(image: AssetImage(Images.WELCOME_2)),
      Image(image: AssetImage(Images.WELCOME_3)),
    ];
    var texts = [
      AppLocalizations.of(context)!.introduction_1,
      AppLocalizations.of(context)!.introduction_2,
      AppLocalizations.of(context)!.introduction_3,
    ];
    //sliding animation duration
    var animationDuration = 500; // in millis
    //getting the localization to use it later
    var isEnglish = AppLocalizations.of(context)!.localeName == 'en';

    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            reverse: !isEnglish,
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        textDirection:
                            isEnglish ? TextDirection.ltr : TextDirection.rtl,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.brown,
                          dotColor: Colors.grey.shade300,
                        ),
                        onDotClicked: (index) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: animationDuration),
                            curve: Curves.easeInOut,
                          );
                        }),
                    Image(
                      image: images[index].image,
                      height: 300,
                    ),
                    Text(
                      texts[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    customIconButton(
                      (index < 2)
                          ? (isEnglish
                              ? Icons.arrow_circle_right_rounded
                              : Icons.arrow_circle_left_rounded)
                          : Icons.done,
                      (index < 2)
                          ? AppLocalizations.of(context)!.next
                          : AppLocalizations.of(context)!.done,
                      () {
                        if (index < 2) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: animationDuration),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "start_page", ((route) => false));
                        }
                      },
                      paddingHorizontal: 40,
                      paddingVertical: 10,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
