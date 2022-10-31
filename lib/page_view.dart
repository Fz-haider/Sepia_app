import 'package:flutter/material.dart';

class page_view extends StatelessWidget {
  const page_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 300,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                children: [
                                  Text("Parent",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  Text("Parent",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      )),
                                  Text("aaaaaaaaaaaaaaaaaaaaa"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                children: [
                                  Text("Parent",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  Text("Parent",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      )),
                                  Text("aaaaaaaaaaaaaaaaaaaaa"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/welcome-1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
