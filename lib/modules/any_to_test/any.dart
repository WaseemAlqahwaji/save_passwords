import 'package:flutter/material.dart';

class Any extends StatelessWidget {
  const Any({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Done!",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
