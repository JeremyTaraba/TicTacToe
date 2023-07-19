import 'package:flutter/material.dart';

Widget BorderText(
    {text = "",
    borderColor = Colors.white,
    double width = 1.5,
    double size = 48,
    color = Colors.purple}) {
  return Text(text,
      style: TextStyle(
          fontFamily: "NicoMoji",
          fontSize: size,
          color: color,
          shadows: [
            Shadow(
                // bottomLeft
                offset: Offset(-width, -width),
                color: borderColor),
            Shadow(
                // bottomRight
                offset: Offset(width, -width),
                color: borderColor),
            Shadow(
                // topRight
                offset: Offset(width, width),
                color: borderColor),
            Shadow(
                // topLeft
                offset: Offset(-width, width),
                color: borderColor),
          ]));
}

Widget TicTacText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: text == "X" || text == "x" ? Colors.pink : Colors.blue,
      fontFamily: "PublicPixel",
    ),
  );
}
