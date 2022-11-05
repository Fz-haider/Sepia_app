import 'package:flutter/material.dart';
import 'package:sepia_app/custom_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class page_view extends StatefulWidget {
  page_view({super.key});

  @override
  State<page_view> createState() => _page_viewState();
}

class _page_viewState extends State<page_view> {
  PageController _pageController = PageController(initialPage: 0);

  late List<DataModel> data;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();

    //load data list here
    List imageNames = [
      "assets/images/welcome-1.png",
      "assets/images/welcome-2.png",
      "assets/images/welcome-3.png",
    ];
    List texts = [
      "Rest assured that your child is safe with us",
      "Contact with teachers easily",
      "Teachers will post every lecture",
    ];

    data = [];
    for (int i = 0; i < imageNames.length; i++)
      data.add(DataModel(
        text: texts[i],
        image: Image.asset(
          imageNames[i],
          cacheHeight: 300,
          filterQuality: FilterQuality.high,
        ),
      ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //precache images here
    for (int i = 0; i < data.length; i++)
      precacheImage(data[i].image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            itemCount: data.length,
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
                          activeDotColor: Colors.indigo,
                          dotColor: Colors.grey.shade300,
                        ),
                        onDotClicked: (index) {}),
                    data[index].image,
                    Text(data[index].text),
                    customIconButton(
                      Icons.arrow_circle_right_rounded,
                      index < 2 ? "Next" : "Start",
                      () {
                        if (_pageController.page == 2.0) {
                          Navigator.pushReplacementNamed(context, 'start_page');
                          return;
                        }
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                        );
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

class DataModel {
  DataModel({required this.text, required this.image});
  String text;
  Image image;
}
