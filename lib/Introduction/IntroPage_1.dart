import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8),
        color: Color.fromRGBO(19, 103, 187, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'WELCOME TO HEALTHY SKUY',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/intro1.png"),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 20),
            Text(
              " ",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
