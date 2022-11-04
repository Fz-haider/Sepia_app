import 'package:flutter/material.dart';
import 'package:sepia_app/custom_widget.dart';

class page_view extends StatefulWidget {
  page_view({super.key});

  @override
  State<page_view> createState() => _page_viewState();
}

class _page_viewState extends State<page_view> {
  PageController _pageController = PageController(initialPage: 0);
  int pagechanger = 0;
  List image = [
    "assets/images/welcome-1.png",
    "assets/images/welcome-2.png",
    "assets/images/welcome-3.png",
  ];
  List text = [
    "Rest assured that your child is safe with us",
    "Contact with teachers easily",
    "Teachers posted every lecture",
  ];
  _onChange(value) {
    setState(() {
      pagechanger = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            controller: _pageController,
            onPageChanged: _onChange,
            itemCount: image.length,
            itemBuilder: (context, index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(image[index]),
                    Text(text[index]),
                    customIconButton(
                      Icons.arrow_circle_right_rounded,
                      "Next",
                      () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 1000),
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
