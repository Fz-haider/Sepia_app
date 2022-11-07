import 'package:flutter/material.dart';
import 'package:sepia_app/custom_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class introduction_screen extends StatelessWidget {
  late List<Image> image;
  late List<String> text;
  introduction_screen({super.key}) {
    image = [
      Image(image: AssetImage('assets/images/welcome-1.png')),
      Image(image: AssetImage('assets/images/welcome-2.png')),
      Image(image: AssetImage('assets/images/welcome-3.png')),
    ];
    text = [
      "Rest assured that your child is safe with us",
      "Contact with teachers easily",
      "Teachers posted every lecture",
    ];
  }

  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            controller: _pageController,
            itemCount: image.length,
            itemBuilder: (context, index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmoothPageIndicator(
                        controller: _pageController, // PageController
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.indigo,
                          dotColor: Colors.grey.shade300,
                        ), // your preferred effect
                        onDotClicked: (index) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.easeInOut,
                          );
                        }),
                    image[index],
                    Text(text[index]),
                    customIconButton(
                      (index == 0 || index == 1)
                          ? Icons.arrow_circle_right_rounded
                          : IconData(0),
                      (index == 0 || index == 1) ? "Next" : "Done",
                      () {
                        if (index == 0 || index == 1) {
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
