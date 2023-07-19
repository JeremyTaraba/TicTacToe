import 'package:flutter/material.dart';
import 'package:tic_tac_toe/util/my_texts.dart';
import 'package:tic_tac_toe/util/draw_board.dart';

import '../util/my_stack.dart';

class OnePlayerScreen extends StatefulWidget {
  const OnePlayerScreen({super.key});

  @override
  State<OnePlayerScreen> createState() => _OnePlayerScreenState();
}

// use a container for the tic tac toe board instead of textbuttons because the clickable area of text buttons depends on the text
// but the clickable area for container with a text child will always be the size of the container

class _OnePlayerScreenState extends State<OnePlayerScreen> {
  bool yourTurn = true;
  String turnText = "Your";
  var positions = List.filled(9, "", growable: false);
  void markPosition(int index) {
    print("marked position");
    setState(() {
      if (yourTurn) {
        positions[index] = "X";
      } else {
        positions[index] = "O";
      }
      yourTurn = !yourTurn;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool yourTurn = true;
    var positions = List.filled(9, " ", growable: false);
    var availablePositions = <int>{0, 1, 2, 3, 4, 5, 6, 7, 8};
    var order = MyStack<int>();

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
                            print("$index clicked");
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black,
                                width: 10,
                              ),
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: TicTacText("O"),
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
