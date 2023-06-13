import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 30),
      children: const <TextSpan>[
        TextSpan(
            text: 'Health',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
        TextSpan(
            text: ' KUY!',
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.blue)),
      ],
    ),
  );
}
