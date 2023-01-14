import 'package:flutter/material.dart';

class LandingScreens extends StatelessWidget {
  const LandingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(children: [
        Expanded(
          child: Container(
            child: Text(
              'Tic Tac Toe',
              style: TextStyle(),
            ),
          ),
        )
      ]),
    );
  }
}
