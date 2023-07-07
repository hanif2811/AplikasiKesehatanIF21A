import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/HalamanAwal.dart';

import 'IntroPage_1.dart';
import 'IntroPage_2.dart';
import 'IntroPage_3.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<OnbordingScreen> {
  PageController _controller = PageController();

  bool onLasPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLasPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'skip',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                onLasPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HalamanAwal();
                          }));
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      )
              ],
            )),
      ],
    ));
  }
}
