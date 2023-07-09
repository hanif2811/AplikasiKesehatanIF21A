import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:tugasakhir_aplikasi_kesehatan/firebase_options.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/AdminBeranda.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/HomePage/home_page.dart';
import 'Introduction/Onbording.dart';

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
              // if (snapshot.hasData && snapshot.data != null) {
              //   return HomePage();
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData && snapshot.data != null) {
                return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(snapshot.data!.uid)
                        .get(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData && snapshot.data != null) {
                        String role = snapshot.data!.get("role");
                        if (role == 'admin') {
                          return AdminBeranda();
                        } else if (role == 'user') {
                          return HomePage();
                        }
                      }

                      return OnbordingScreen();
                    });
              }
              return OnbordingScreen();
            }));
  }
}
