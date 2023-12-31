import 'package:flutter/material.dart';

import '../util/logic_functions.dart';
import '../util/my_texts.dart';

class TwoPlayerScreen extends StatefulWidget {
  const TwoPlayerScreen({super.key});

  @override
  State<TwoPlayerScreen> createState() => _TwoPlayerScreenState();
}

class _TwoPlayerScreenState extends State<TwoPlayerScreen> {
  bool yourTurn = true;
  var positions = List.filled(9, " ", growable: false);
  var availablePositions = <int>{0, 1, 2, 3, 4, 5, 6, 7, 8};
  var colorList = List.filled(9, Colors.pink, growable: false);
  String turnText = "X's";

  @override
  Widget build(BuildContext context) {
    //variables in here get rebuilt everytime set state is called
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/default.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: borderText(text: "$turnText \n turn"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 5,
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (checkPosition(index, availablePositions)) {
                              setState(() {
                                availablePositions.remove(index);
                                colorList[index] =
                                    yourTurn ? Colors.pink : Colors.blue;
                                positions[index] = positionText(yourTurn);
                                yourTurn = !yourTurn;
                                turnText = yourTurn ? "X's" : "O's";
                                if (checkWinner(positions).isNotEmpty) {
                                  checkWinner(positions).forEach((element) {
                                    colorList[element] = Colors.green;
                                  });
                                  showWinDialog();
                                }
                                if (availablePositions.isEmpty &&
                                    checkWinner(positions).isEmpty) {
                                  showTieDialog();
                                }
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.white,
                                width: 10,
                              ),
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: ticTacText(
                                  positions[index], colorList[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Column(
                verticalDirection: VerticalDirection.up,
                children: [
                  if (checkWinner(positions).isNotEmpty ||
                      (availablePositions.isEmpty &&
                          checkWinner(positions).isEmpty)) ...[
                    Center(
                      heightFactor: 3,
                      child: GestureDetector(
                          onTap: () {
                            resetBoard();
                          },
                          child: borderText(text: "play again")),
                    )
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetBoard() {
    setState(() {
      clearBoard(positions);
    });
    availablePositions = <int>{0, 1, 2, 3, 4, 5, 6, 7, 8};
    turnText = "X's";
    yourTurn = true;
  }

  void showWinDialog() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text("${yourTurn ? "O" : "X"} Wins"),
            ),
            actions: [
              Center(
                child: TextButton(
                  child: const Text("Play Again"),
                  onPressed: () {
                    resetBoard();
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }

  void showTieDialog() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(
              child: Text("Tie Game"),
            ),
            actions: [
              Center(
                child: TextButton(
                  child: const Text("Play Again"),
                  onPressed: () {
                    resetBoard();
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }
}
