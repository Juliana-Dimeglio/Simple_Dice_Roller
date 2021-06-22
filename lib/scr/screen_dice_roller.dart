import 'package:flutter/material.dart';
import 'bloc/dice_bloc.dart';
import '../utils/constants.dart';

class ScreenDiceRoller extends StatefulWidget {
  final String title;
  final int numberOfDice;
  final DiceBloc bloc;

  ScreenDiceRoller({
    Key key,
    this.title = "Dice Roller App",
    this.numberOfDice = Constants.numberOfDice,
    this.bloc,
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
        body: StreamBuilder(
          stream: widget.bloc.diceStream,
          initialData: widget.bloc.diceValues(),
          builder: (context, snapshot) {
            return GridView.count(
              crossAxisCount: Constants.crossAxisCount,
              children: List.generate(widget.bloc.numberOfDice, (index) {
                return Padding(
                  padding: const EdgeInsets.all(
                    Constants.paddingImage,
                  ),
                  child: Image.asset(
                    "assets/images/Dice_${snapshot.data[index].toString()}.png",
                  ),
                );
              }),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            bottom: Constants.paddingBottomNav,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.bloc.roll();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade300,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Constants.paddingVertical,
                    horizontal: Constants.paddingHorizontal,
                  ),
                  child: Text(
                    "Roll the dice!",
                    style: TextStyle(
                      fontSize: Constants.fontSizeText,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Score:",
                    style: TextStyle(
                      fontSize: Constants.fontSizeText,
                    ),
                  ),
                  StreamBuilder(
                    stream: widget.bloc.scoreValue,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data.toString(),
                        style: TextStyle(
                          fontSize: Constants.fontSizeText,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
