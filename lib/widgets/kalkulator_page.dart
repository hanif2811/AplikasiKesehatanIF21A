import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/scroll_kalkulator.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/scroll_tips.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1368BB),
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: Center(
              child: Image.asset('Asset/image/logo.png', fit: BoxFit.cover)),
          backgroundColor: const Color(0xFF1368BB),
          elevation: 0,
        ),
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
                  const Padding(
                    padding: EdgeInsets.fromLTRB(33, 10, 0, 0),
                    child: Text("89 KG",
                        style: TextStyle(fontSize: 31),
                        textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(33, 10, 0, 0),
                    child: Container(
                      height: 18,
                      width: 88,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffF49D1A)),
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xffF49D1A),
                      ),
                      child: const Center(
                        child: Text(
                          "Kegemukan",
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
                                  title: const Text("Kamu Kekar"),
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
