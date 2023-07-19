import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:tugasakhir_aplikasi_kesehatan/services/database.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/AdminBeranda.dart';

class InsertIklan extends StatefulWidget {
  const InsertIklan({super.key});

  @override
  State<InsertIklan> createState() => _InsertIklanState();
}

class _InsertIklanState extends State<InsertIklan> {
  TextEditingController conBackground = TextEditingController();
  TextEditingController conUrl = TextEditingController();

  DbService dbService = DbService();

  String IdIklan = "";
  String background = "";
  String url = "";

  newIklan() async {
    IdIklan = randomAlphaNumeric(16);

    Map<String, String> dataIklan = {
      "ID": IdIklan,
      "background": background,
      "url": url
    };

    await dbService.tambahIklan(dataIklan, IdIklan).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminBeranda()));
    }).catchError((e) {
      print(e.toString());
    });
  }

  void deleteOldData() {
    // FirebaseFirestore.instance
    //                 .collection("iklan")
    //                 .doc(ID)
    //                 .delete()
    //                 .then((value) => print("Dokumen berhasil dihapus"))
    //                 .catchError((error) => print("Terjadi kesalahan: $error"));

    DateTime currentTime = DateTime.now();

    // Batasi jangka waktu tertentu, misal 7 hari
    DateTime cutoffTime = currentTime.subtract(Duration(seconds: 50));

    // Ambil referensi koleksi 'data'
    CollectionReference dataCollection =
        FirebaseFirestore.instance.collection('iklan');

    // Buat query untuk mengambil dokumen dengan waktu yang telah berlalu
    Query oldDataQuery =
        dataCollection.where('timestamp', isLessThan: cutoffTime);

    // Jalankan query untuk mengambil data
    oldDataQuery.get().then((snapshot) {
      // Hapus dokumen yang terpilih
      snapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah iklan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 20,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Masukkan background"),
              ),
              controller: conBackground,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Masukkan url"),
              ),
              controller: conUrl,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    background = conBackground.text;
                    url = conUrl.text;

                    newIklan();
                  },
                  child: Text("Tambah")),
            )
          ],
        ),
      ),
    );
  }
}
