import 'package:flutter/material.dart';
import 'package:tic_tac_toe/util/draw_board.dart';

import '../util/my_texts.dart';

class TwoPlayerScreen extends StatelessWidget {
  const TwoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool yourTurn = true;
    String turnText = "X's";
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
                DrawBoard(),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
