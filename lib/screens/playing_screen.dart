import 'package:flutter/material.dart';
import '../widgets/button_tile.dart';

class PlayingScreen extends StatefulWidget {
  const PlayingScreen({Key? key}) : super(key: key);

  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool turn = true; //turn is true for x, false for y
  int xScore = 0, oScore = 0, tapped = 0;
  void _onTap(int index) {
    setState(() {
      if (turn && displayXO[index] == '') {
        displayXO[index] = 'X';
        tapped += 1;
      } else if (!turn && displayXO[index] == '') {
        displayXO[index] = 'O';
        tapped += 1;
      }
      turn = !turn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showWinnerBox(displayXO[0]);
    }
    //1st col
    else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showWinnerBox(displayXO[0]);
    }
    //left diagonal
    else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showWinnerBox(displayXO[0]);
    }
    //2nd col
    else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showWinnerBox(displayXO[1]);
    }
    //3rd col
    else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showWinnerBox(displayXO[2]);
    }
    //right digagonal
    else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _showWinnerBox(displayXO[2]);
    }

    //2nd row
    else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showWinnerBox(displayXO[3]);
    }
    //3rd col
    else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showWinnerBox(displayXO[6]);
    } else if (tapped == 9) {
      _showDrawBox();
    }
  }

  void _showWinnerBox(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
              onPressed: () {
                reset();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Play Again?",
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
        ],
        title: Text("$winner is the Winner!"),
      ),
    );
    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void _showDrawBox() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
              onPressed: () {
                reset();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Play Again?",
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
        ],
        title: const Text("Draw!"),
      ),
    );
  }

  void reset() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      tapped = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player X",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          '$xScore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Player O",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '$oScore',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800),
                      child: Text(
                        displayXO[index],
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      onPressed: () => _onTap(index),
                    ));
              },
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
