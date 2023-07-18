import 'package:flutter/material.dart';

Widget myTextButton(
    {required text,
    required color,
    required pressed,
    required double height,
    required double width}) {
  return TextButton(
    onPressed: () {
      pressed();
    },
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 3),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          text,
          style:
              TextStyle(fontSize: 30, color: color, fontFamily: 'PublicPixel'),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
