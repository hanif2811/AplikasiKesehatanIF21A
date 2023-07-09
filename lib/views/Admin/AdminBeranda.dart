import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/HalamanAwal.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_InsertRead/TambahIklan.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_InsertRead/TambahMenu.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_InsertRead/Tipstrik.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_UpdateDelete/UpdateMenu.dart';

class AdminBeranda extends StatefulWidget {
  const AdminBeranda({super.key});

  @override
  State<AdminBeranda> createState() => _AdminBerandaState();
}

class _AdminBerandaState extends State<AdminBeranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Home"),
      ),
      body: Center(
        child: Wrap(
          children: [
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahMenu()));
                    },
                    child: Text("Tambah menu dan Gejala"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateMenu()));
                    },
                    child: Text("Edit menu dan gejala "))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Iklan()));
                    },
                    child: Text("Edit Iklan"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => tipsTrik()));
                    },
                    child: Text("Edit Tips & Trik"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HalamanAwal()));
                    },
                    child: Text("Log OUT"))),
          ],
        ),
      ),
    );
  }
}
