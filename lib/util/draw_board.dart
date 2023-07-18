import 'package:flutter/material.dart';
import 'package:tic_tac_toe/util/rounded_Divider.dart';
import '../util/my_stack.dart';
import 'border_text.dart';

class DrawBoard extends StatefulWidget {
  const DrawBoard({super.key});

  @override
  State<DrawBoard> createState() => _DrawBoardState();
}

class _DrawBoardState extends State<DrawBoard> {
  bool yourTurn = true;
  var positions = List.filled(9, " ", growable: false);
  var availablePositions = <int>{0, 1, 2, 3, 4, 5, 6, 7, 8};
  var order = MyStack<int>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double widthTenPercent = width / 10;

    double height = MediaQuery.of(context).size.height;
    double heightTenPercent = height / 10;

    double column1x = widthTenPercent;
    double column2x = widthTenPercent * 3.9;
    double column3x = widthTenPercent * 6.8;
    double row2y = heightTenPercent * 1.3;
    double row3y = heightTenPercent * 2.7;

    return Container(
      height: widthTenPercent * 11,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(),
          Positioned(
            top: heightTenPercent * 1.1,
            left: widthTenPercent,
            child: roundedDivider(width: widthTenPercent * 8),
          ),
          Positioned(
            top: heightTenPercent * 2.6,
            left: widthTenPercent,
            child: roundedDivider(width: widthTenPercent * 8),
          ),
          Positioned(
            left: widthTenPercent * 6.4,
            child: RotatedBox(
              quarterTurns: 1,
              child: roundedDivider(width: widthTenPercent * 8),
            ),
          ),
          Positioned(
            left: widthTenPercent * 3.3,
            child: RotatedBox(
              quarterTurns: 1,
              child: roundedDivider(width: widthTenPercent * 8),
            ),
          ),
          Positioned(
            left: column1x,
            child: TextButton(
              onPressed: () {
                if (checkPosition(0, availablePositions)) {
                  setState(() {
                    availablePositions.remove(0);
                    order.push(0);
                    positions[0] = positionText(yourTurn);
                    yourTurn = !yourTurn;
                    if (checkWinner(positions)) {
                      print("winner");
                    }
                  });
                }
              },
              child: textColorController(positions[0], widthTenPercent * 2),
            ),
          ),
          Positioned(
            left: column2x,
            child: TextButton(
              onPressed: () {
                if (checkPosition(1, availablePositions)) {
                  setState(() {
                    availablePositions.remove(1);
                    order.push(1);
                    positions[1] = positionText(yourTurn);
                    yourTurn = !yourTurn;
                    if (checkWinner(positions)) {
                      print("winner");
                    }
                  });
                }
              },
              child: textColorController(positions[1], widthTenPercent * 2),
            ),
          ),
          Positioned(
            left: column3x,
            child: TextButton(
              onPressed: () {
                if (checkPosition(2, availablePositions)) {
                  setState(() {
                    availablePositions.remove(2);
                    order.push(2);
                    positions[2] = positionText(yourTurn);
                    yourTurn = !yourTurn;
                    if (checkWinner(positions)) {
                      print("winner");
                    }
                  });
                }
              },
              child: textColorController(positions[2], widthTenPercent * 2),
            ),
          ),
          Positioned(
            top: row2y,
            left: column1x,
            child: TextButton(
              onPressed: () {
                if (checkPosition(3, availablePositions)) {
                  setState(() {
                    availablePositions.remove(3);
                    order.push(3);
                    positions[3] = positionText(yourTurn);
                    yourTurn = !yourTurn;
                    if (checkWinner(positions)) {
                      print("winner");
                    }
                  });
                }
              },
              child: textColorController(positions[3], widthTenPercent * 2),
            ),
          ),
          Positioned(
            top: row2y,
            left: column2x,
            child: TextButton(
              onPressed: () {
                if (checkPosition(4, availablePositions)) {
                  setState(() {
                    availablePositions.remove(4);
                    order.push(4);
                    positions[4] = positionText(yourTurn);
                    yourTurn = !yourTurn;
                    if (checkWinner(positions)) {
                      print("winner");
                    }
                  });
                }
              },
              child: textColorController(positions[4], widthTenPercent * 2),
            ),
          ),
          Positioned(
            top: row2y,
            left: column3x,
            child: TextButton(
              onPressed: () {
                if (checkPosition(5, availablePositions)) {
                  setState(() {
                    availablePositions.remove(5);
                    order.push(5);
                    positions[5] = positionText(yourTurn);
                    yourTurn = !yourTurn;
                    if (checkWinner(positions)) {
                      print("winner");
                    }
                  });
                }
              },
              child: textColorController(positions[5], widthTenPercent * 2),
            ),
          ),
          Positioned(
            top: row3y,
            left: column1x,
            child: TextButton(
              onPressed: () {
                if (checkPosition(6, availablePositions)) {
                  setState(() {
                    availablePositions.remove(6);
                    order.push(6);
                    positions[6] = positionText(yourTurn);
                    yourTurn = !yourTurn;
                    if (checkWinner(positions)) {
                      print("winner");
                    }
                  });
                }
              },
              child: textColorController(positions[6], widthTenPercent * 2),
            ),
          ),
          Positioned(
            top: row3y,
            left: column2x,
            child: TextButton(
              onPressed: () {
                if (checkPosition(7, availablePositions)) {
                  setState(() {
                    availablePositions.remove(7);
                    order.push(7);
                    positions[7] = positionText(yourTurn);
                    yourTurn = !yourTurn;
                    if (checkWinner(positions)) {
                      print("winner");
                    }
                  });
                }
              },
              child: textColorController(positions[7], widthTenPercent * 2),
            ),
          ),
          Positioned(
            top: row3y,
            left: column3x,
            child: TextButton(
              onPressed: () {
                if (checkPosition(8, availablePositions)) {
                  setState(() {
                    availablePositions.remove(8);
                    order.push(8);
                    positions[8] = positionText(yourTurn);
                    yourTurn = !yourTurn;
                    if (checkWinner(positions)) {
                      print("winner");
                    }
                  });
                }
              },
              child: textColorController(positions[8], widthTenPercent * 2),
            ),
          ),
          Positioned(
            top: heightTenPercent * 4.5,
            left: widthTenPercent * 2.5,
            child: TextButton(
              onPressed: () {
                setState(() {
                  int? undo = order.pop();
                  if (undo is int) {
                    positions[undo] = " ";
                    availablePositions.add(undo);
                    yourTurn = !yourTurn;
                  }
                });
              },
              child: BorderText(
                text: "Undo",
                color: Colors.white,
                size: 58,
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
