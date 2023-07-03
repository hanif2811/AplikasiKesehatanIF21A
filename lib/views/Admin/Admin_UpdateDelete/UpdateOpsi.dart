// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_UpdateDelete/UpdateGejala.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_UpdateDelete/UpdateMenu.dart';

import '../../../services/database.dart';

class UpdateOpsi extends StatefulWidget {
  String question = "";
  String menuId = "";
  UpdateOpsi(this.question, this.menuId);

  @override
  State<UpdateOpsi> createState() => _UpdateOpsiState();
}

class _UpdateOpsiState extends State<UpdateOpsi> {
  TextEditingController conAnswer = TextEditingController();
  TextEditingController conNilai = TextEditingController();

  List<String> answers = [];
  List<String> nilai = [];

  DbService dbService = DbService();

  uploadGejala() async {
    Map<String, dynamic> gejalaMap = {
      "question": widget.question.toString(),
      "answers": answers,
      "nilai": nilai
    };

    await dbService.tambahGejala(gejalaMap, widget.menuId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Opsi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 50,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  helperText:
                      "Masukkan opsi penyakit seperti :\n'ya', 'tidak','panas','dingin','sering','terkadang', dan lainnya",
                  label: Text("Masukkan opsi penyakit"),
                  border: OutlineInputBorder()),
              controller: conAnswer,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  helperText:
                      "Ket. Masukkan dalam bentuk angka range 0-1 dengan ketentuan : \n0 untuk opsi tidak berpotensi dan 1 untuk opsi yang paling berpotensi. ",
                  label: Text("Masukkan nilai opsi penyakit"),
                  border: OutlineInputBorder()),
              controller: conNilai,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        answers.clear();
                        nilai.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateGejala(
                                    widget.menuId,
                                    widget.question,
                                    answers,
                                    nilai)));
                      },
                      child: Text("Kembali"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                          foregroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 2, 54, 97)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 2, 54, 97))))),
                    )),
                SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        if (conAnswer.text.isEmpty || conNilai.text.isEmpty) {
                          final snackBar = SnackBar(
                            content:
                                Text("Isi terlebih dahulu opsi dan nilainya"),
                            duration: Duration(seconds: 3),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          answers.add(conAnswer.text.toString());
                          nilai.add(conNilai.text.toString());

                          conAnswer.text = "";
                          conNilai.text = "";
                        }
                      },
                      child: Text("Tambah Opsi"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                          foregroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 2, 54, 97)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 2, 54, 97))))),
                    )),
              ],
            ),
            Center(
              child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      if (answers.isEmpty || nilai.isEmpty) {
                        final snackBar = SnackBar(
                          content: Text("Isi terlebih dahulu pilihan opsi"),
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        uploadGejala();

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    "Apakah anda ingin menambah gejala lagi?"),
                                content: Text(
                                    "Jika anda ingin menambah gejala lagi, Tekan tombol Ya. Jika Tidak Tekan tombol tidak"),
                                actions: [
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateGejala(
                                                            widget.menuId,
                                                            "", [], [])));
                                          },
                                          child: Text("Ya")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateMenu()));
                                          },
                                          child: Text("Tidak")),
                                    ],
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: Text("Tambah Gejala"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        foregroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 2, 54, 97)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 2, 54, 97))))),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
