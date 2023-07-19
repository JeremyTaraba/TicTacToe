import 'package:flutter/material.dart';

Widget textColorController(position, fontSize) {
  return Text(
    position,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'PublicPixel',
        color: position == "X" ? Colors.red : Colors.blue),
  );
}

String positionText(yourTurn) {
  if (yourTurn) {
    return "X";
  } else {
    return "O";
  }
}

bool checkPosition(int position, var availablePositions) {
  if (availablePositions.contains(position)) {
    return true;
  }
  return false;
}

bool checkWinner(positions) {
  if (positions[0] != " " && positions[4] != " " && positions[8] != " ") {
    if ((positions[0] == positions[1]) && (positions[1] == positions[2])) {
      return true;
    }
  }

  return false;
}
