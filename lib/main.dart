import 'package:flutter/material.dart';
import './screens/landing_screens.dart';
import './screens/playing_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TicTacToe',
      home: TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    return LandingScreens();
  }
}
