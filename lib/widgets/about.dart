import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        title: Image(image: AssetImage("assets/images/logo.png")),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text("Apa itu Healthy kuy?",
                    style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 400,
                  child: Text(
                    """Healthy kuy merupakan aplikasi kesehatan yang dibuat dengan tujuan agar user dapat mengidentifikasi penyakit yang diderita oleh user karena pada aplikasi ini tersedia berbagai macam gejala yang telah ditulis oleh pakar untuk diidentifikasi apakah user itu mengidap penyakit tersebut atau tidak.

Dibuat oleh:
Hanif Hidayatulloh (21SA1068)
M. Abdul Rohman (21SA1067)
Hanan Abdul Ghani (21SA1035)
Farhan Fadillah (21SA1033)
Aden Hidayatuloh (21SA1251)""",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
