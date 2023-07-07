import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/Masuk.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/HomePage/home_page.dart';

import '../../widgets/AppBar.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  Future<void> registerUser(String email, String password, String no_telp,
      String nama_lengkap) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'no_telp': no_telp,
        'nama_lengkap': nama_lengkap,
        'email': email,
        'beratBadan': "",
        'tinggiBadan': '',
        'tanggalLahir': ''
      });
      print(
          'Pengguna berhasil ditambahkan ke Firebase Authentication dan Firestore.');
    } catch (error) {
      print('Gagal menambahkan pengguna: $error');
    }
  }

  void signUpWithEmailAndPassword(
      String email, String password, String username, String nama_lengkap) {
    registerUser(email, password, username, nama_lengkap);
  }

  String email = "";
  String password = "";
  String fullname = "";
  String no_telp = "";
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
                  return val!.isEmpty ? "no telp anda kosong" : null;
                },
                decoration: InputDecoration(
                    label: Text("Masukkan no telp"),
                    border: UnderlineInputBorder()),
                onChanged: (val) {
                  no_telp = val;
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
                      // final auth = FirebaseAuth.instance;

                      // auth
                      //     .createUserWithEmailAndPassword(
                      //         email: email, password: password)
                      //     .then((value) {
                      //   print("AKun telah dibuat");

                      // }).onError((error, stackTrace) {
                      //   print("error ${error.toString()}");
                      // });

                      signUpWithEmailAndPassword(
                          email, password, no_telp, fullname);

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
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
