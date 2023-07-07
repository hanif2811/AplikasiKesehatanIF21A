import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/Daftar.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/HomePage/home_page.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Beranda.dart';

import 'package:tugasakhir_aplikasi_kesehatan/widgets/AppBar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey1 = GlobalKey<FormState>();
  String email = "";
  String password = "";
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
        child: Form(
          key: _formkey1,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Jangan kosongi email anda';
                    }
                    return null;
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
                  obscureText: true,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Jangan kosongi Password anda';
                    }
                    return null;
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
                        login();
                      },
                      child: Text("Masuk"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Tidak punya akun ? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Daftar()),
                        );
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (_formkey1.currentState!.validate()) {
      final auth = FirebaseAuth.instance;
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Beranda()));
      }).onError((error, stackTrace) {
        final snackBar = SnackBar(
          content: Text("Username atau paswword salah"),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }
}
