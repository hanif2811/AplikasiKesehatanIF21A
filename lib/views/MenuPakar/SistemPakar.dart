// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Hasil.dart';

double? totalsemua;
List<DocumentSnapshot> gejalaData = [];

class MenuPakar extends StatefulWidget {
  String MenuId;

  MenuPakar(this.MenuId);
  @override
  State<MenuPakar> createState() => _MenuPakarState();
}

class _MenuPakarState extends State<MenuPakar> {
  int currentIndex = 0;

  double total = 0;
  String hasil = "";
  double totall = 0;
  @override
  void initState() {
    super.initState();
    fetchData(widget.MenuId);
  }

  Future<void> fetchData(String menuId) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("tambah_menu")
        .doc(menuId)
        .collection("List_Gejala")
        .get();
    setState(() {
      gejalaData = snapshot.docs;
    });
  }

  void nextQuestion() {
    if (currentIndex < gejalaData.length - 1) {
      setState(() {
        hasil = "";
        totall += total;
        currentIndex++;
      });
    } else {
      setState(() {
        totall += total;
        totalsemua = totall;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HasilDeteksi(widget.MenuId)),
        );
      });
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      setState(() {
        hasil = "";
        totall -= total;
        currentIndex--;
      });
    } else if (currentIndex == 0) {
      setState(() {
        totall = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: gejalaData.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : DeteksiPenyakitPage(),
    );
  }

  Widget DeteksiPenyakitPage() {
    final currentQuestion = gejalaData[currentIndex];
    final question = currentQuestion['question'];
    final answers = currentQuestion['answers'];
    final nilai = currentQuestion['nilai'];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${currentIndex + 1}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            question,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: List.generate(answers.length, (index) {
              final answer = answers[index];
              final nil = nilai[index];
              return RadioListTile(
                title: Text(answer),
                value: nil,
                groupValue: hasil,
                onChanged: (value) {
                  // Lakukan sesuatu dengan nilai yang dipilih
                  setState(() {
                    hasil = value;
                    total = double.parse(hasil);
                  });
                },
              );
            }),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: previousQuestion,
                  child: Text('kembali'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 2, 54, 97)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 2, 54, 97))))),
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: nextQuestion,
                  child: Text('Selanjutnya'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 2, 54, 97)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 2, 54, 97))))),
                ),
              ),
            ],
          ),
          Text("Hasil = $total"),
          Text("Hasil = $totall"),
        ],
      ),
    );
  }
}
