import 'package:flutter/material.dart';
import 'package:tic_tac_toe/util/border_text.dart';
import 'package:tic_tac_toe/util/draw_board.dart';

class OnePlayerScreen extends StatefulWidget {
  const OnePlayerScreen({super.key});

  @override
  State<OnePlayerScreen> createState() => _OnePlayerScreenState();
}

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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/default.png"), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                BorderText(text: "$turnText \n turn", size: 54),
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      yourTurn = !yourTurn;
                      print("changing turn");
                    });
                  },
                  child: DrawBoard(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
