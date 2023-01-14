import 'package:flutter/material.dart';

class ButtonTile extends StatefulWidget {
  final String item;
  final Function onTap;
  ButtonTile({required this.item, required this.onTap});
  @override
  _ButtonTileState createState() => _ButtonTileState();
}

class _ButtonTileState extends State<ButtonTile> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade800),
      onPressed: () {
        setState(() {
          text = 'x';
        });
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
    );
  }
}
