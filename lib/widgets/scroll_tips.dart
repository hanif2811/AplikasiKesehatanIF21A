import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Tipsandtrik());
}

class Tipsandtrik extends StatefulWidget {
  const Tipsandtrik({super.key});

  @override
  State<Tipsandtrik> createState() => _TipsandtrikState();
}

class _TipsandtrikState extends State<Tipsandtrik> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 199,
            width: 246,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 246,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 165, 165, 165),
                      border:
                          Border.all(color: Color.fromARGB(255, 165, 165, 165)),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 199,
            width: 246,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 199,
            width: 246,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 199,
            width: 246,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ],
      ),
    );
  }
}
