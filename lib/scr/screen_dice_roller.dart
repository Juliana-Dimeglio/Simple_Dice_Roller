import 'package:flutter/material.dart';
import '../utils/constants_file.dart';

class ScreenDiceRoller extends StatefulWidget {
  final String title;
  final int numberOfDice;

  ScreenDiceRoller({
    Key key,
    this.title = "Dice Roller App",
    this.numberOfDice = Constants.numberOfDice,
  }) : super(key: key);

  @override
  _ScreenDiceRollerState createState() => _ScreenDiceRollerState();
}

class _ScreenDiceRollerState extends State<ScreenDiceRoller> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      home: Scaffold(
        backgroundColor: Colors.cyan.shade700,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
              fontSize: Constants.fontSizeTitle,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(widget.numberOfDice, (index) {
            return Center(
              child: Image.asset(
                "assets/images/Dice_${(index % Constants.modNumber) + 1}.png",
                height: Constants.imageHeight,
              ),
            );
          }),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: Constants.paddingText),
          child: Text(
            "Press a dice!\nYour score: 10",
            style: TextStyle(
              fontSize: Constants.fontSizeText,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
