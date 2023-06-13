// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/SistemPakar.dart';

double hasil() {
  return totalsemua! / gejalaData.length;
}

class HasilDeteksi extends StatefulWidget {
  String MenuId;

  HasilDeteksi(this.MenuId);

  @override
  State<HasilDeteksi> createState() => _HasilDeteksiState();
}

class _HasilDeteksiState extends State<HasilDeteksi> {
  List<DocumentSnapshot> penangananData = [];

  @override
  void initState() {
    super.initState();
    fetchData(widget.MenuId);
  }

  Future<void> fetchData(String menuId) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("tambah_menu")
        .doc(menuId)
        .collection("penanganan")
        .get();
    setState(() {
      penangananData = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil"),
      ),
      body: penangananData.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : penanganan(),
    );
  }

  Widget? penanganan() {
    final currentPenanganan = penangananData[0];
    final Rendah = currentPenanganan["Rendah"];
    final Tinggi = currentPenanganan["Tinggi"];
    if (hasil() <= 0.5) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Hasilnya adalah " + (hasil() * 100).toStringAsFixed(1),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                CircularProgressIndicator(
                  value: hasil(),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(_warnaresiko(hasil())),
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: Rendah.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Icon(Icons.circle),
                        title: Text(Rendah[index]));
                  }),
            )
          ],
        ),
      );
    } else
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Hasilnya adalah " + (hasil() * 100).toStringAsFixed(1),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                CircularProgressIndicator(
                  value: hasil(),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(_warnaresiko(hasil())),
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: Tinggi.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Icon(Icons.circle),
                        title: Text(Tinggi[index]));
                  }),
            )
          ],
        ),
      );
  }
}

Color _warnaresiko(double tingkat_bahaya) {
  if (tingkat_bahaya < 0.5) {
    return Colors.green;
  }
  if (tingkat_bahaya < 0.8) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
