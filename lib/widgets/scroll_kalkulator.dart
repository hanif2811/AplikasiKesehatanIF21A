import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/kalkultor_heartRate.dart';

import 'KalkulatorKalori.dart';
import 'bmi_kalkulator.dart';

Color _colorcontainer = Colors.white;

void main(List<String> args) {
  runApp(const scrol_kalkulator());
}

class scrol_kalkulator extends StatefulWidget {
  const scrol_kalkulator({super.key});

  @override
  State<scrol_kalkulator> createState() => _scrol_kalkulatorState();
}

class _scrol_kalkulatorState extends State<scrol_kalkulator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: Container(
            margin: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 10),
            height: 90,
            width: 63,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
              borderRadius: BorderRadius.circular(10),
              color: _colorcontainer,
            ),
            child: Column(
              children: [
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("Assets/images/pngwing.com.png"),
                        fit: BoxFit.cover),
                    border: Border.all(
                        color: const Color.fromARGB(0, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(0),
                    color: _colorcontainer,
                  ),
                ),
                const Text(
                  "Heart Rate",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => kalkulator_heartRate()));
            // setState(() {
            //   _colorcontainer = const Color.fromARGB(255, 190, 190, 190);
            // });
          },
        ),
        GestureDetector(
          child: Container(
            margin: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 10),
            height: 90,
            width: 63,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
              borderRadius: BorderRadius.circular(10),
              color: _colorcontainer,
            ),
            child: Column(
              children: [
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/images/pngwing.com.png"),
                        fit: BoxFit.cover),
                    border: Border.all(
                        color: const Color.fromARGB(0, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(0),
                    color: _colorcontainer,
                  ),
                ),
                const Text(
                  "IBM",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (BMICalculatorScreen())));
            // setState(() {
            //   _colorcontainer = const Color.fromARGB(255, 190, 190, 190);
            // });
          },
        ),
        GestureDetector(
          child: Container(
            margin: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 10),
            height: 90,
            width: 63,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
              borderRadius: BorderRadius.circular(10),
              color: _colorcontainer,
            ),
            child: Column(
              children: [
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/images/pngwing.com.png"),
                        fit: BoxFit.cover),
                    border: Border.all(
                        color: const Color.fromARGB(0, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(0),
                    color: _colorcontainer,
                  ),
                ),
                const Text(
                  "Kalori",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (kalkulator_kalori())));
            // setState(() {
            //   _colorcontainer = const Color.fromARGB(255, 190, 190, 190);
            // });
          },
        ),
      ],
    );
  }
}
