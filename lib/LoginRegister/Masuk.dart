import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/Daftar.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/AdminBeranda.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/HomePage/home_page.dart';
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
  bool _obscureText = true;

  bool _isValidEmail(String value) {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );
    return emailRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Color.fromARGB(0, 0, 174, 255),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Image.network(
                        'https://png.pngtree.com/png-vector/20220712/ourmid/pngtree-doctor-talking-to-patient-via-internet-png-image_5930390.png'),
                    height: 300,
                    width: 300),
                SizedBox(height: 20),
                Container(
                  width: 400,
                  child: TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Email anda kosong";
                      } else if (!_isValidEmail(val)) {
                        return "Email tidak valid";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukkan Email",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.person),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 400,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText:
                        _obscureText, // variabel untuk mengontrol apakah password tersembunyi atau tidak
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Jangan kosongi Password anda';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukkan Password",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.lock),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      password = val;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        var user = userCredential.user;

        if (user != null) {
          DocumentSnapshot snapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
          if (snapshot.exists) {
            String role = snapshot.get("role");

            if (role == 'admin') {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AdminBeranda()));
            } else if (role == 'user') {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          }
        }
      } catch (e) {
        print(e.toString());

        final snackBar = SnackBar(
          content: Text("Email atau paswword salah"),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      // final auth = FirebaseAuth.instance;
      // auth
      //     .signInWithEmailAndPassword(email: email, password: password)
      //         .then((value) {
      //       Navigator.pushReplacement(
      //           context, MaterialPageRoute(builder: (context) => HomePage()));
      //     }).onError((error, stackTrace) {
      //       final snackBar = SnackBar(
      //         content: Text("Username atau paswword salah"),
      //         duration: Duration(seconds: 3),
      //       );
      //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //     });
      //   }
      // }
    }
  }
}
