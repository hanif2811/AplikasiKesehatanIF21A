import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/AppBar.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/scroll_kalkulator.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/scroll_tips.dart';
import 'package:url_launcher/url_launcher.dart';

import 'editProfile.dart';

class kalkulator_Page extends StatefulWidget {
  const kalkulator_Page({super.key});

  @override
  State<kalkulator_Page> createState() => _kalkulator_PageState();
}

class _kalkulator_PageState extends State<kalkulator_Page> {
  double? BeratBandan = 0;
  double? TinggiBadan = 0;
  int umur = 17;
  String kategori = "";
  String warna = "";
  Color _rubahwarna = Colors.black;
  late String userId;
  bool loading = true;

  void getDataFromFirebase() async {
    // Mendapatkan referensi Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Mendapatkan dokumen dari koleksi yang sesuai
    var documentSnapshot =
        await firestore.collection('users').doc(userId).get();

    setState(() {
      String beratBadanString = documentSnapshot.get('beratBadan');
      String tinggiBadanString = documentSnapshot.get('tinggiBadan');

      if (beratBadanString != "" || tinggiBadanString != "") {
        BeratBandan = double.parse(beratBadanString);
        TinggiBadan = double.parse(tinggiBadanString);

        double bmi =
            BeratBandan! / ((TinggiBadan! / 100) * (TinggiBadan! / 100));
        if (BeratBandan! > 0 && TinggiBadan! > 0) {
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
    });
  }

  void getData() {
    loading = true;
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      userId = currentUser.uid;
    }
    loading = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    getDataFromFirebase();
    // kegemukan();

    super.initState();
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
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(userId)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Text(
                              " ",
                            );
                          }
                          final beratBadan =
                              snapshot.data?.get("beratBadan") ?? "";
                          return Text(
                            beratBadan,
                            style: TextStyle(fontSize: 31),
                          );
                        }),
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
            Container(
              height: 200,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("TipsTrik")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Text("Tunggu");
                  } else if (snapshot.hasError) {
                    return Text("Ada error, Tunggu");
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, Index) {
                          return TipsnTrik(
                            background: snapshot.data?.docs[Index]
                                ["background"],
                            ID: snapshot.data?.docs[Index]["ID"],
                            url: snapshot.data?.docs[Index]["konten"],
                            Judul: snapshot.data?.docs[Index]["Judul"],
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ));
  }
}

class TipsnTrik extends StatelessWidget {
  final ID;
  final background;
  final url;
  final Judul;

  const TipsnTrik(
      {super.key,
      required this.ID,
      required this.background,
      required this.url,
      required this.Judul});

  Future<void> launherURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse)) {
      throw Exception("Tidak bisa melaunch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launherURL(url),
      child: Column(
        children: [
          Container(
            width: 300,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: NetworkImage(background), fit: BoxFit.cover)),
          ),
          Text(Judul)
        ],
      ),
    );
  }
}
