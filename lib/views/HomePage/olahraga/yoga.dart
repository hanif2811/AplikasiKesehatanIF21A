import 'package:flutter/material.dart';
import 'dart:async';

class CountdownApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Duduk Sila'),
        ),
        body: CountdownScreen(),
      ),
    );
  }
}

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int _countdown = 90;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

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
              color: Color(0xffFFFFFF)),
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
                        'https://cdn.pixabay.com/photo/2014/04/03/10/38/yoga-310940_1280.png',
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

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Selanjutnya'),
      ),
      body: Center(
        child: Text(
          'Halaman Selanjutnya',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
