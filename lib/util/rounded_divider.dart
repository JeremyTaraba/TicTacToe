import 'package:flutter/material.dart';

Widget roundedDivider({double width = 300.0}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Divider(
      thickness: 10,
      color: Colors.white,
    ),
  );
}
