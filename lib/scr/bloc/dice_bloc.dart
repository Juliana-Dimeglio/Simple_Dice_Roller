import 'dart:async';
import 'dart:math';

import '../../utils/constants.dart';

import 'i_dice_bloc.dart';

class DiceBloc extends IDiceBloc {
  final int _numberOfDice = Constants.numberOfDice;
  StreamController<List<int>> _streamController = StreamController<List<int>>();
  StreamController<int> _scoreValue = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    _scoreValue.close();
  }

  List<int> diceValues() {
    //sets the value of each dice randomly and saves the sum of the values of the list
    var sum = 0;
    List<int> _listAux = [];
    for (var i = 0; i < numberOfDice; i++) {
      _listAux.add(Random().nextInt(6) + 1);
      sum += _listAux[i];
    }
    _scoreValue.sink.add(sum);
    return _listAux;
  }

  void roll() {
    _streamController.sink.add(diceValues());
  }

  @override
  void initialize() {}

  int get numberOfDice => _numberOfDice;

  Stream<List<int>> get diceStream => _streamController.stream;

  Stream<int> get scoreValue => _scoreValue.stream;
}
