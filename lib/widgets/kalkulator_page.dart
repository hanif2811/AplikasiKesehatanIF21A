import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/AppBar.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/scroll_kalkulator.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/scroll_tips.dart';

class kalkulator_Page extends StatefulWidget {
  const kalkulator_Page({super.key});

  @override
  State<kalkulator_Page> createState() => _kalkulator_PageState();
}

class _kalkulator_PageState extends State<kalkulator_Page> {
  double BeratBandan = 80;
  double TinggiBadan = 170;
  int umur = 17;
  String kategori = "";
  String warna = "";
  Color _rubahwarna = Colors.black;
  @override
  void initState() {
    // TODO: implement initState
    kegemukan();
    super.initState();
  }

  void kegemukan() {
    if (TinggiBadan > 0 && BeratBandan > 0) {
      double bmi = BeratBandan / ((TinggiBadan / 100) * (TinggiBadan / 100));

      if (bmi < 18.5) {
        kategori = 'Kurus';
        _rubahwarna = Colors.green;
      } else if (bmi >= 18.5 && bmi < 25.0) {
        kategori = 'Normal';
        _rubahwarna = Colors.blue;
      } else if (bmi >= 25.0 && bmi < 30.0) {
        kategori = 'Kegemukan';
        _rubahwarna = Colors.orange;
      } else {
        kategori = 'Obesitas';
        _rubahwarna = Colors.red;
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1368BB),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
              height: 165,
              width: 312,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffFFFFFF)),
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xffFFFFFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(33, 10, 0, 0),
                    child: Text(
                      "Total Balance",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(33, 10, 0, 0),
                    child: Text("$BeratBandan",
                        style: TextStyle(fontSize: 31),
                        textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(33, 10, 0, 0),
                    child: Container(
                      height: 18,
                      width: 88,
                      decoration: BoxDecoration(
                        border: Border.all(color: _rubahwarna),
                        borderRadius: BorderRadius.circular(25),
                        color: _rubahwarna,
                      ),
                      child: Center(
                        child: Text(
                          "$kategori",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Tinggi badan : $TinggiBadan"
                                      "\nBerat Badan : $BeratBandan"
                                      "\nUmur : $umur"
                                      "\nKategori : $kategori"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ok"))
                                  ],
                                );
                              });
                        },
                        child: const Text('Detail >'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
              height: 174,
              width: 312,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffFFFFFF)),
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xffFFFFFF),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.fromSTEB(27, 18, 0, 0),
                    height: 27,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff1368BB)),
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xff1368BB)),
                    child: Center(
                      child: Text(
                        "Calculator",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  scrol_kalkulator()
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Text(
                    "Tips & trik",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                  child: Text(
                    "Lihat semua >",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
            const Tipsandtrik()
          ],
        ));
  }
}
