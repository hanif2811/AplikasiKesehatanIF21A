import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/Daftar.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/Masuk.dart';

class HalamanAwal extends StatefulWidget {
  const HalamanAwal({super.key});

  @override
  State<HalamanAwal> createState() => _HalamanAwalState();
}

class _HalamanAwalState extends State<HalamanAwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Card(
                color: Colors.yellow,
                elevation: 5,
                child: Container(
                  height: 50,
                  child: InkWell(
                    splashColor: Colors.yellow,
                    child: Center(
                      child: Text(
                        "Masuk",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Daftar()),
                );
              },
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Container(
                  height: 50,
                  child: InkWell(
                    splashColor: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Center(
                      child: Text(
                        "Daftar",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Dengan Masuk atau mendaftar, Kamu menyetujui",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Text(
              "Ketentuan Layanan dan Kebijakan Privasi",
              style: TextStyle(fontSize: 15, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
