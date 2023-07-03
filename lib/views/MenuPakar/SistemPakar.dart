// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Hasil.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/AppBar.dart';

double? totalsemua;
List<DocumentSnapshot> gejalaData = [];

class MenuPakar extends StatefulWidget {
  String MenuId;
  String judul;

  MenuPakar(this.MenuId, this.judul);
  @override
  State<MenuPakar> createState() => _MenuPakarState();
}

class _MenuPakarState extends State<MenuPakar> {
  int currentIndex = 0;
  double jumlah_sementara = 0;
  String hasil = "";
  double total = 0;

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
    if (hasil == "") {
      final snackBar = SnackBar(
        content: Text("Isi terlebih dahulu pilihan anda"),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      if (currentIndex < gejalaData.length - 1) {
        setState(() {
          hasil = "";
          total += jumlah_sementara;
          currentIndex++;
        });
      } else {
        setState(() {
          total += jumlah_sementara;
          totalsemua = total;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HasilDeteksi(widget.MenuId, widget.judul)),
          );
        });
      }
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      setState(() {
        hasil = "";
        total -= jumlah_sementara;
        currentIndex--;
      });
    } else if (currentIndex == 0) {
      setState(() {
        total = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 103, 187, 1),
        title: appBar(context),
        centerTitle: true,
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
          Container(
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              children: [
                Text(
                  'Pertanyaan ${currentIndex + 1}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    question,
                    style: TextStyle(
                      fontSize: 18,
                    ),
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
                          jumlah_sementara = double.parse(hasil);
                        });
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  onPressed: previousQuestion,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.navigate_before), Text('kembali')],
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(255, 237, 0, 1)),
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
                width: 130,
                child: ElevatedButton(
                  onPressed: nextQuestion,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('Selanjutnya'), Icon(Icons.navigate_next)],
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(255, 237, 0, 1)),
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
        ],
      ),
    );
  }
}

Widget Pertanyaan_Jawaban(BuildContext context) {
  return Container(
    height: 400,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [],
    ),
  );
}
