import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "AppBar.dart";

class kalkulator_heartRate extends StatefulWidget {
  const kalkulator_heartRate({super.key});

  @override
  State<kalkulator_heartRate> createState() => _kalkulator_heartRateState();
}

class _kalkulator_heartRateState extends State<kalkulator_heartRate> {
  TextEditingController Umur = TextEditingController();
  TextEditingController DetakJantung = TextEditingController();
  TextEditingController consthasil = TextEditingController();

  void heartrate() {
    if (Umur.text.isEmpty || DetakJantung.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Harap isi semua field"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      int age = int.parse(Umur.text);
      int detak = int.parse(DetakJantung.text);
      String hasil = "";
      String tingkat_umur = "";

      if (age >= 60) {
        tingkat_umur = "Lansia";
        // } else if (age >= 50) {
        //   tingkat_umur = "awal lamsia";
      } else if (age >= 35) {
        tingkat_umur = "Dewasa part2";
      } else if (age >= 20) {
        tingkat_umur = "Dewasa";
      } else if (age >= 15) {
        tingkat_umur = "Remaja";
      } else if (age >= 11) {
        tingkat_umur = "Anak part2";
      } else if (age >= 6) {
        tingkat_umur = "anak";
      } else {
        tingkat_umur = "Balita";
      }

      if (tingkat_umur == "Lamsia") {
        if (detak >= 80 && detak <= 130) {
          hasil = "Normal";
        } else if (detak >= 130) {
          hasil = "Tinggi";
        } else {
          hasil = "Rendah";
        }
      } else if (tingkat_umur == "Dewasa part2") {
        if (detak >= 85 && detak <= 155) {
          hasil = "Normal";
        } else if (detak >= 155) {
          hasil = "Tinggi";
        } else {
          hasil = "Rendah";
        }
      } else if (tingkat_umur == "Dewasa") {
        if (detak >= 95 && detak <= 170) {
          hasil = "Normal";
        } else if (detak >= 170) {
          hasil = "Tinggi";
        } else {
          hasil = "Rendah";
        }
      } else if (tingkat_umur == "Remaja") {
        if (detak >= 60 && detak <= 100) {
          hasil = "Normal";
        } else if (detak >= 100) {
          hasil = "Tinggi";
        } else {
          hasil = "Rendah";
        }
      } else if (tingkat_umur == "anak") {
        if (detak >= 70 && detak <= 110) {
          hasil = "Normal";
        } else if (detak >= 110) {
          hasil = "Tinggi";
        } else {
          hasil = "Rendah";
        }
      } else if (tingkat_umur == "Balita") {
        if (detak >= 80 && detak <= 130) {
          hasil = "Normal";
        } else if (detak >= 110) {
          hasil = "Tinggi";
        } else {
          hasil = "Rendah";
        }
      } else if (tingkat_umur == "Anak part2") {
        if (detak >= 60 && detak <= 105) {
          hasil = "Normal";
        } else if (detak >= 105) {
          hasil = "Tinggi";
        } else {
          hasil = "Rendah";
        }
      }

      consthasil.text = hasil;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: const Text(
                "Detak Jantung anda",
                style: TextStyle(color: Colors.white),
              ),
              content: Center(
                  child: Text("" + consthasil.text,
                      style: const TextStyle(color: Colors.white))),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1368BB),
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: const Color(0xFF1368BB),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              height: 329,
              width: 330,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffFFFFFF)),
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffFFFFFF),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Center(
                            child: Text(
                              "Kalkulator",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xffFFED00),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15, left: 5),
                          child: Center(
                            child: Text(
                              "Heart Rate",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xFF1368BB),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    width: 1.0, color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    width: 1.0, color: Colors.black)),
                            label: Text("Umur"),
                            labelStyle: TextStyle(color: Colors.black)),
                        controller: Umur,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "*masukan umur anda",
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 185, 185),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    width: 1.0, color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    width: 1.0, color: Colors.black)),
                            label: Text("Detak Jantung"),
                            labelStyle: TextStyle(color: Colors.black)),
                        controller: DetakJantung,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 21, right: 21, bottom: 15),
                      child: Text(
                        "*Hitung detang jantung anda dengan stop wacth dalam 1 menit",
                        style: TextStyle(
                            color: Color.fromARGB(255, 150, 150, 150)),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: SizedBox(
                          height: 38,
                          width: 138,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffFFED00),
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () {
                              heartrate();
                            },
                            child: const SizedBox(
                              width: 120,
                              child: Center(
                                  child: Text(
                                "Hitung",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          )

          // TextField(
          //   decoration: InputDecoration(
          //       label: Text("hasil"), border: OutlineInputBorder()),
          //   controller: consthasil,
          // ),
        ],
      ),
    );
  }
}
