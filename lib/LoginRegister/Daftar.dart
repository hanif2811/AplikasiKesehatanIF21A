import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/Masuk.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/HomePage/home_page.dart';

import '../../widgets/AppBar.dart';

class Daftar extends StatefulWidget {
  const Daftar({Key? key}) : super(key: key);

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  final _formKey = GlobalKey<FormState>();

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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: Column(
              children: [
                Container(
                    child: Image.network(
                        'https://cdni.iconscout.com/illustration/premium/thumb/online-doctor-consultation-5569146-4649561.png'),
                    height: 300,
                    width: 300),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  child: TextFormField(
                    validator: (val) {
                      return val!.isEmpty ? "Email anda kosong" : null;
                    },
                    decoration: InputDecoration(
                      labelText: "Masukkan email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  child: TextFormField(
                    validator: (val) {
                      return val!.isEmpty ? "Nama lengkap anda kosong" : null;
                    },
                    decoration: InputDecoration(
                      labelText: "Masukkan nama lengkap",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    onChanged: (val) {
                      fullname = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  child: TextFormField(
                    validator: (val) {
                      return val!.isEmpty ? "No telp anda kosong" : null;
                    },
                    decoration: InputDecoration(
                      labelText: "Masukkan no telp",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    onChanged: (val) {
                      no_telp = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  child: TextFormField(
                    obscureText: true,
                    validator: (val) {
                      return val!.isEmpty ? "Password anda kosong" : null;
                    },
                    decoration: InputDecoration(
                      labelText: "Masukkan password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUpWithEmailAndPassword(
                            email, password, no_telp, fullname);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 255, 255)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
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
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
