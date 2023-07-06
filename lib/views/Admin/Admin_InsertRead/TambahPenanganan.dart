// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_InsertRead/TambahMaps.dart';
import '../../../services/database.dart';

class TambahPenanganan extends StatefulWidget {
  String menuId = "";

  TambahPenanganan(
    this.menuId,
  );

  @override
  State<TambahPenanganan> createState() => _TambahPenangananState();
}

class _TambahPenangananState extends State<TambahPenanganan> {
  TextEditingController conRendah = TextEditingController();
  TextEditingController conTinggi = TextEditingController();

  List<String> Rendah = [];
  List<String> Tinggi = [];

  DbService dbService = DbService();
  addPenanganan() async {
    Map<String, dynamic> add_penanganan = {
      'Rendah': Rendah,
      'Tinggi': Tinggi,
    };

    await dbService.tambahPenanganan(add_penanganan, widget.menuId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Masukkan penanganan penyakit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                  helperText:
                      "Ket. Masukkan penanganan untuk resiko rendah (hasil < 50%)",
                  label: Text("Masukkan penanganan untuk resiko rendah"),
                  border: OutlineInputBorder()),
              controller: conRendah,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (conRendah.text.isNotEmpty) {
                      Rendah.add(conRendah.text.toString());
                      conRendah.text = "";
                    }
                  },
                  child: Text("Tambah(Resiko Rendah)"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 2, 54, 97)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 2, 54, 97))))),
                )),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                  helperText:
                      "Ket. Masukkan penanganan untuk resiko Tinggi (hasil > 80%)",
                  label: Text("Masukkan penanganan untuk resiko Tinggi"),
                  border: OutlineInputBorder()),
              controller: conTinggi,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (conTinggi.text.isNotEmpty) {
                      Tinggi.add(conTinggi.text.toString());
                      conTinggi.text = "";
                    }
                  },
                  child: Text("Tambah(Resiko Tinggi)"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 2, 54, 97)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 2, 54, 97))))),
                )),
            SizedBox(height: 60),
            SizedBox(
                width: 600,
                child: ElevatedButton(
                  onPressed: () {
                    if (Rendah.isEmpty || Tinggi.isEmpty) {
                      final snackBar = SnackBar(
                        content:
                            Text("Isi terlebih dahulu opsi tinggi dan rendah"),
                        duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      addPenanganan();

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TambahMaps(menuId: widget.menuId)));
                    }
                  },
                  child: Text("Tambah"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 2, 54, 97)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 2, 54, 97))))),
                )),
          ],
        ),
      ),
    );
  }
}
