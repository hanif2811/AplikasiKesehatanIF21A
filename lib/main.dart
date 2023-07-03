import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/HalamanAwal.dart';
import 'package:tugasakhir_aplikasi_kesehatan/firebase_options.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/KalkulatorKalori.dart';

import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/Daftar.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/HomePage/home_page.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/KalkulatorKalori.dart';

import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Beranda.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Beranda.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/HalamanAwal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return HomePage();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Daftar();
          }),
    );
  }
}
