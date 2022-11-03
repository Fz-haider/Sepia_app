import 'package:flutter/material.dart';

class page_view extends StatelessWidget {
  const page_view({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey[300],
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Container(
            child: Column(
              children: [
                Image.asset('assets/images/welcome-1.jpg'),
                SizedBox(height: 20),
                Text('You will be aware of your child with us'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
