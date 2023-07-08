import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
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
                'DAPATKAN TIPS TIPS HIDUP SEHAT',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/intro3.png"),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 10),
            Text(""),
          ],
        ),
      ),
    );
  }
}
