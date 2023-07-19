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
                  SizedBox(height: 25, width: 0),
                  BorderText(text: "$turnText \n turn", size: 54),
                  SizedBox(
                    height: 50,
                  ),
                  DrawBoard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
