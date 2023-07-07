import 'package:flutter/material.dart';
import 'dart:async';

import '../home_page.dart';

mixin CountdownMixin<T extends StatefulWidget> on State<T> {
  int _countdown = 90;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startCountdown(int seconds) {
    _countdown = seconds;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void resetCountdown() {
    _timer?.cancel();
    setState(() {
      _countdown = 90;
    });
  }

  void navigateToNextPage() {
    _timer?.cancel();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NextPage()),
    );
  }

  String formatDuration(Duration duration) {
    String minutes = (duration.inSeconds ~/ 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen>
    with CountdownMixin<CountdownScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration countdownDuration = Duration(seconds: _countdown);
    String formattedCountdown = formatDuration(countdownDuration);

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Duduk Bersila',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Image(
                      image: NetworkImage(
                        'https://st3.depositphotos.com/15891028/36804/v/450/depositphotos_368048054-stock-illustration-pregnant-female-sportswear-while-doing.jpg',
                      ),
                      width: 500,
                      height: 250,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  formattedCountdown,
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => startCountdown(90),
                      child: Text('Mulai'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: resetCountdown,
                      child: Text('Ulangi'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: navigateToNextPage,
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> with CountdownMixin<NextPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration countdownDuration = Duration(seconds: _countdown);
    String formattedCountdown = formatDuration(countdownDuration);

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Berdiri Kayang',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Image(
                      image: NetworkImage(
                        'https://st3.depositphotos.com/15891028/36747/v/450/depositphotos_367476024-stock-illustration-pregnant-female-sportswear-while-doing.jpg',
                      ),
                      width: 500,
                      height: 250,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  formattedCountdown,
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => startCountdown(90),
                      child: Text('Mulai'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: resetCountdown,
                      child: Text('Ulangi'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NextPageThree()),
                        );
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextPageThree extends StatefulWidget {
  @override
  _NextPageStateThree createState() => _NextPageStateThree();
}

class _NextPageStateThree extends State<NextPageThree>
    with CountdownMixin<NextPageThree> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration countdownDuration = Duration(seconds: _countdown);
    String formattedCountdown = formatDuration(countdownDuration);

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Duduk Ngangkang',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20),
                    Image(
                      image: NetworkImage(
                        'https://st3.depositphotos.com/15891028/36747/v/450/depositphotos_367476018-stock-illustration-pregnant-female-sportswear-while-doing.jpg',
                      ),
                      width: 500,
                      height: 250,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  formattedCountdown,
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => startCountdown(90),
                      child: Text('Mulai'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: resetCountdown,
                      child: Text('Ulangi'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NextPageFour()),
                        );
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextPageFour extends StatefulWidget {
  @override
  _NextPageStateFour createState() => _NextPageStateFour();
}

class _NextPageStateFour extends State<NextPageFour>
    with CountdownMixin<NextPageFour> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration countdownDuration = Duration(seconds: _countdown);
    String formattedCountdown = formatDuration(countdownDuration);

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tengkurap',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20),
                    Image(
                      image: NetworkImage(
                        'https://st3.depositphotos.com/15891028/36804/v/450/depositphotos_368048388-stock-illustration-pregnant-female-in-sportswear-while.jpg',
                      ),
                      width: 500,
                      height: 250,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  formattedCountdown,
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => startCountdown(90),
                      child: Text('Mulai'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: resetCountdown,
                      child: Text('Ulangi'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NextPageFive()),
                        );
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextPageFive extends StatefulWidget {
  @override
  _NextPageStateFive createState() => _NextPageStateFive();
}

class _NextPageStateFive extends State<NextPageFive>
    with CountdownMixin<NextPageFive> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration countdownDuration = Duration(seconds: _countdown);
    String formattedCountdown = formatDuration(countdownDuration);

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Telentang',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20),
                    Image(
                      image: NetworkImage(
                        'https://st3.depositphotos.com/15891028/36747/v/450/depositphotos_367476016-stock-illustration-pregnant-female-sportswear-while-doing.jpg',
                      ),
                      width: 500,
                      height: 250,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  formattedCountdown,
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => startCountdown(90),
                      child: Text('Mulai'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: resetCountdown,
                      child: Text('Ulangi'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NextPageSix()),
                        );
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextPageSix extends StatefulWidget {
  @override
  _NextPageStateSix createState() => _NextPageStateSix();
}

class _NextPageStateSix extends State<NextPageSix>
    with CountdownMixin<NextPageSix> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration countdownDuration = Duration(seconds: _countdown);
    String formattedCountdown = formatDuration(countdownDuration);

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gerakan Enam',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20),
                    Image(
                      image: NetworkImage(
                        'https://st3.depositphotos.com/15891028/36747/v/450/depositphotos_367476012-stock-illustration-pregnant-female-sportswear-while-doing.jpg',
                      ),
                      width: 500,
                      height: 250,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  formattedCountdown,
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => startCountdown(90),
                      child: Text('Mulai'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: resetCountdown,
                      child: Text('Ulangi'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NextPageSeven()),
                        );
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextPageSeven extends StatefulWidget {
  @override
  _NextPageStateSeven createState() => _NextPageStateSeven();
}

class _NextPageStateSeven extends State<NextPageSeven>
    with CountdownMixin<NextPageSeven> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration countdownDuration = Duration(seconds: _countdown);
    String formattedCountdown = formatDuration(countdownDuration);

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gerakan Tujuh',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20),
                    Image(
                      image: NetworkImage(
                        'https://st3.depositphotos.com/15891028/37023/v/450/depositphotos_370232396-stock-illustration-pregnant-female-sportswear-while-doing.jpg',
                      ),
                      width: 500,
                      height: 250,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  formattedCountdown,
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => startCountdown(90),
                      child: Text('Mulai'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: resetCountdown,
                      child: Text('Ulangi'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NextPageEight()),
                        );
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextPageEight extends StatefulWidget {
  @override
  _NextPageStateEight createState() => _NextPageStateEight();
}

class _NextPageStateEight extends State<NextPageEight>
    with CountdownMixin<NextPageEight> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Duration countdownDuration = Duration(seconds: _countdown);
    String formattedCountdown = formatDuration(countdownDuration);

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gerakan Delapan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20),
                    Image(
                      image: NetworkImage(
                        'https://st3.depositphotos.com/15891028/37023/v/450/depositphotos_370232408-stock-illustration-pregnant-female-sportswear-while-doing.jpg',
                      ),
                      width: 500,
                      height: 250,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  formattedCountdown,
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => startCountdown(90),
                      child: Text('Mulai'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: resetCountdown,
                      child: Text('Ulangi'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Finish()),
                        );
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Finish extends StatefulWidget {
  @override
  _Finish createState() => _Finish();
}

class _Finish extends State<Finish> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 103, 187, 1),
        appBar: AppBar(),
        body: Center(
          child: Container(
            height: 500,
            width: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffFFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'ANDA TELAH \nMENYELESAIKAN YOGA HARI INI',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 80),
                      Image(
                        image: NetworkImage(
                          'https://st2.depositphotos.com/3369547/44652/v/450/depositphotos_446527614-stock-illustration-young-woman-jumping-hands-up.jpg',
                        ),
                        width: 400,
                        height: 200,
                      ),
                      SizedBox(height: 70),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text('Selesai'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
