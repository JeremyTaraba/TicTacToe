import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/one_player.dart';
import 'package:tic_tac_toe/screens/two_player.dart';
import 'package:tic_tac_toe/util/my_texts.dart';
import 'package:tic_tac_toe/util/my_text_button.dart';
import 'package:tic_tac_toe/util/rounded_divider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 150),
                  child: borderText(
                    text: "Tic",
                    borderColor: Colors.blue,
                    color: Colors.purple,
                    size: 120,
                  ),
                ),
                borderText(
                  text: "Tac",
                  borderColor: Colors.blue,
                  color: Colors.purple,
                  size: 120,
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 18, left: 100),
                  child: borderText(
                    text: "Toe",
                    borderColor: Colors.blue,
                    color: Colors.purple,
                    size: 120,
                  ),
                ),
                roundedDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 34.0),
                  child: myTextButton(
                    text: "1 Player",
                    color: Colors.blue,
                    pressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnePlayerScreen()),
                      );
                    },
                    height: 70,
                    width: width / 1.2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: myTextButton(
                    text: "2 Players",
                    color: Colors.pink,
                    pressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TwoPlayerScreen()),
                      );
                    },
                    height: 70,
                    width: width / 1.2,
                  ),
                ),
                // for changing the theme
              ],
            ),
          ),
        ),
      ),
    );
  }
}
