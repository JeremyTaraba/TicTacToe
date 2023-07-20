import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/util/my_texts.dart';

import '../util/logic_functions.dart';

class OnePlayerScreen extends StatefulWidget {
  const OnePlayerScreen({super.key});

  @override
  State<OnePlayerScreen> createState() => _OnePlayerScreenState();
}

// use a container for the tic tac toe board instead of textbuttons because the clickable area of text buttons depends on the text
// but the clickable area for container with a text child will always be the size of the container

class _OnePlayerScreenState extends State<OnePlayerScreen> {
  bool yourTurn = true;
  var positions = List.filled(9, " ", growable: false);
  var availablePositions = <int>{0, 1, 2, 3, 4, 5, 6, 7, 8};
  String turnText = "X's";
  var colorList = List.filled(9, Colors.pink, growable: false);

  @override
  Widget build(BuildContext context) {
    //variables in here get rebuilt everytime setstate is called
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
                      child: BorderText(text: "$turnText \n turn"),
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (checkPosition(index, availablePositions)) {
                              setState(() {
                                availablePositions.remove(index);
                                positions[index] = positionText(yourTurn);
                                colorList[index] =
                                    yourTurn ? Colors.pink : Colors.blue;
                                yourTurn = !yourTurn;
                                turnText = yourTurn ? "X's" : "O's";
                                if (checkWinner(positions).isNotEmpty) {
                                  checkWinner(positions).forEach((element) {
                                    setState(() {
                                      colorList[element] = Colors.green;
                                    });
                                  });

                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Center(
                                            child: Text(
                                                "${yourTurn ? "O" : "X"} Wins"),
                                          ),
                                          actions: [
                                            Center(
                                              child: TextButton(
                                                child: const Text("Play Again"),
                                                onPressed: () {
                                                  setState(() {
                                                    clearBoard(positions);
                                                  });
                                                  availablePositions = <int>{
                                                    0,
                                                    1,
                                                    2,
                                                    3,
                                                    4,
                                                    5,
                                                    6,
                                                    7,
                                                    8
                                                  };
                                                  turnText = "X's";
                                                  yourTurn = true;
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                }
                                if (availablePositions.isEmpty &&
                                    checkWinner(positions).isEmpty) {
                                  showDialog(
                                      barrierDismissible: false,
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
                                                  setState(() {
                                                    clearBoard(positions);
                                                  });
                                                  availablePositions = <int>{
                                                    0,
                                                    1,
                                                    2,
                                                    3,
                                                    4,
                                                    5,
                                                    6,
                                                    7,
                                                    8
                                                  };
                                                  turnText = "X's";
                                                  yourTurn = true;
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                }
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.white,
                                width: 10,
                              ),
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: TicTacText(
                                  positions[index], colorList[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
