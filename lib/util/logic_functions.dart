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

List<int> checkWinner(positions) {
  if ((positions[0] == positions[1]) &&
      (positions[1] == positions[2]) &&
      (positions[0] != " ")) {
    return [0, 1, 2];
  }
  if ((positions[3] == positions[4]) &&
      (positions[4] == positions[5]) &&
      (positions[3] != " ")) {
    return [3, 4, 5];
  }
  if ((positions[6] == positions[7]) &&
      (positions[7] == positions[8]) &&
      (positions[6] != " ")) {
    return [6, 7, 8];
  }
  if ((positions[0] == positions[3]) &&
      (positions[3] == positions[6]) &&
      (positions[0] != " ")) {
    return [0, 3, 6];
  }

  if ((positions[1] == positions[4]) &&
      (positions[4] == positions[7]) &&
      (positions[1] != " ")) {
    return [1, 4, 7];
  }

  if ((positions[2] == positions[5]) &&
      (positions[5] == positions[8]) &&
      (positions[2] != " ")) {
    return [2, 5, 8];
  }

  if ((positions[0] == positions[4]) &&
      (positions[4] == positions[8]) &&
      (positions[0] != " ")) {
    return [0, 4, 8];
  }

  if ((positions[2] == positions[4]) &&
      (positions[4] == positions[6]) &&
      (positions[2] != " ")) {
    return [2, 4, 6];
  }

  return [];
}

void clearBoard(positions) {
  for (int i = 0; i < 9; i++) {
    positions[i] = " ";
  }
}
