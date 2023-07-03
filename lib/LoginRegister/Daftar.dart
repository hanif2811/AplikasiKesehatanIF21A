import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/Masuk.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Beranda.dart';

import '../../widgets/AppBar.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  String email = "";
  String password = "";
  String fullname = "";
  String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "email anda kosong" : null;
                },
                decoration: InputDecoration(
                    label: Text("Masukkan email"),
                    border: UnderlineInputBorder()),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "Nama lengkap anda kosong" : null;
                },
                decoration: InputDecoration(
                    label: Text("Masukkan nama lengkap"),
                    border: UnderlineInputBorder()),
                onChanged: (val) {
                  fullname = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (val) {
                  return val!.isEmpty ? "username anda kosong" : null;
                },
                decoration: InputDecoration(
                    label: Text("Masukkan username"),
                    border: UnderlineInputBorder()),
                onChanged: (val) {
                  username = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                validator: (val) {
                  return val!.isEmpty ? "password anda kosong" : null;
                },
                decoration: InputDecoration(
                    label: Text("Masukkan password"),
                    border: UnderlineInputBorder()),
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      final auth = FirebaseAuth.instance;

                      auth
                          .createUserWithEmailAndPassword(
                              email: email, password: password)
                          .then((value) {
                        print("AKun telah dibuat");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Beranda()));
                      }).onError((error, stackTrace) {
                        print("error ${error.toString()}");
                      });
                    },
                    child: Text("Daftar"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah punya akun ? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
