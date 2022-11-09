import 'package:flutter/material.dart';
import 'package:sepia_app/custom_widget.dart';
import 'package:sepia_app/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class introduction_screen extends StatelessWidget {
  late PageController _pageController;
  late List<Image> images;
  late List<String> texts;

  introduction_screen({super.key}) {
    //initialize fields
    _pageController = PageController(initialPage: 0);
    images = [
      Image(image: AssetImage(Images.WELCOME_1)),
      Image(image: AssetImage(Images.WELCOME_2)),
      Image(image: AssetImage(Images.WELCOME_3)),
    ];
    texts = [
      "Rest assured that your child is safe with us",
      "Contact with teachers easily",
      "Teachers posted every lecture",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
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
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.brown,
                          dotColor: Colors.grey.shade300,
                        ),
                        onDotClicked: (index) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.easeInOut,
                          );
                        }),
                    images[index],
                    Text(texts[index]),
                    customIconButton(
                      (index == 0 || index == 1)
                          ? Icons.arrow_circle_right_rounded
                          : Icons.done,
                      (index == 0 || index == 1) ? "Next" : "Done",
                      () {
                        if (index < 2) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
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
