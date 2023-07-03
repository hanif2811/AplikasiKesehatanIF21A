// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_UpdateDelete/UpdateMenu.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/AppBar.dart';

double? totalsemua;
List<DocumentSnapshot> gejalaData = [];

void updateValue(int index, String field, dynamic newValue) async {
  DocumentSnapshot documentSnapshot = gejalaData[index];
  DocumentReference documentReference = documentSnapshot.reference;

  await documentReference.update({field: newValue});
}

class Updatebaru extends StatefulWidget {
  String MenuId;
  String judul;

  Updatebaru(this.MenuId, this.judul);
  @override
  State<Updatebaru> createState() => _UpdatebaruState();
}

class _UpdatebaruState extends State<Updatebaru> {
  int currentIndex = 0;

  TextEditingController conGejala = TextEditingController();

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
        currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UpdateMenu()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    List valAnswer = [];

    void updateControllerAnswer(List<TextEditingController> controllerList) {
      controllerList.forEach((TextEditingController controller) {
        valAnswer.add(controller.text.toString());
      });
    }

    List valNilai = [];

    void updateControllerNilai(List<TextEditingController> controllerList) {
      controllerList.forEach((TextEditingController controller) {
        valNilai.add(controller.text.toString());
      });
    }

    final currentQuestion = gejalaData[currentIndex];
    final question = currentQuestion['question'];
    final answers = currentQuestion['answers'];
    final nilai = currentQuestion['nilai'];
    List<TextEditingController> conAnswer = [];
    List<TextEditingController> conNilai = [];

    for (var i in answers) {
      conAnswer.add(TextEditingController(text: i));
    }
    for (int i = 0; i < answers.length; i++) {
      conAnswer[i].text = answers[i];
    }
    for (var i in nilai) {
      conNilai.add(TextEditingController(text: i));
    }

    for (int i = 0; i < nilai.length; i++) {
      conNilai[i].text = nilai[i];
    }

    conGejala.text = question;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              'Pertanyaan ${currentIndex + 1}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: conGejala,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("isikan pertanyaan yang baru")),
              )),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              runSpacing: 10,
              children: List.generate(answers.length, (index) {
                return TextField(
                  controller: conAnswer[index],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Masukkan opsi yang baru")),
                );
              }),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              runSpacing: 10,
              children: List.generate(nilai.length, (index) {
                return TextField(
                  controller: conNilai[index],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                          "Masukkan nilai yang baru (harus berurutan dengan opsi)")),
                );
              }),
            ),
          ),
          SizedBox(
            width: 130,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  updateValue(currentIndex, 'question', conGejala.text);

                  updateControllerAnswer(conAnswer);
                  updateValue(currentIndex, 'answers', valAnswer);
                  valAnswer.clear;

                  updateControllerNilai(conNilai);
                  updateValue(currentIndex, 'nilai', valNilai);
                  valNilai.clear;

                  nextQuestion();
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Selanjutnya'), Icon(Icons.navigate_next)],
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromRGBO(255, 237, 0, 1)),
                  foregroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 2, 54, 97)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Color.fromARGB(255, 2, 54, 97))))),
            ),
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
