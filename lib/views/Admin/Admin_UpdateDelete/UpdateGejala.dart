// ignore_for_file: must_be_immutable

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/services/database.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_UpdateDelete/UpdateOpsi.dart';

class UpdateGejala extends StatefulWidget {
  String menuId = "";
  String question = "";
  List answers = [];
  List nilai = [];
  UpdateGejala(this.menuId, this.question, this.answers, this.nilai);

  @override
  State<UpdateGejala> createState() => _UpdateGejalaState();
}

class _UpdateGejalaState extends State<UpdateGejala> {
  final _formkey1 = GlobalKey<FormState>();
  DbService dbService = DbService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Tambahkan gejala dan opsi"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20),
        child: Form(
          key: _formkey1,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Gejala kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text("Masukkan gejala penyakit"),
                    border: OutlineInputBorder()),
                onChanged: (val) {
                  widget.question = val;
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey1.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateOpsi(
                                        widget.question, widget.menuId)));
                          }
                        },
                        child: Text("Selanjutnya"),
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
                                        color:
                                            Color.fromARGB(255, 2, 54, 97))))),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
