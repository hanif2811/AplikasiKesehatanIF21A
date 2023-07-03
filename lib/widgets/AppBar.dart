import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 30),
      children: const <TextSpan>[
        TextSpan(
            text: 'HEALTHY',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color.fromRGBO(255, 237, 0, 1)
                // color: Colors.black
                )),
        TextSpan(
            text: ' SKUY',
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.blue)),
      ],
    ),
  );
}

Widget appBarMenuPakar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 30),
      children: const <TextSpan>[
        TextSpan(
            text: 'HEALTHY',
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black
                // color: Colors.black
                )),
        TextSpan(
            text: ' SKUY',
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.blue)),
      ],
    ),
  );
}
