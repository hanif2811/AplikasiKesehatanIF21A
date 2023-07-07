import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:tugasakhir_aplikasi_kesehatan/services/database.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/AdminBeranda.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/AppBar.dart';

class tipsTrik extends StatefulWidget {
  const tipsTrik({super.key});

  @override
  State<tipsTrik> createState() => _tipsTrikState();
}

class _tipsTrikState extends State<tipsTrik> {
  TextEditingController constBackground = TextEditingController();
  TextEditingController constJudul = TextEditingController();
  TextEditingController constLink = TextEditingController();

  DbService dbService = DbService();

  String IdTips = "";
  String background = "";
  String konten = "";
  String Judul = "";

  newTips() async {
    IdTips = randomAlphaNumeric(16);

    Map<String, String> dataTips = {
      "ID": IdTips,
      "Judul": Judul,
      "background": background,
      "konten": konten,
    };

    await dbService.tambahTipsTrik(dataTips, IdTips).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminBeranda()));
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          runSpacing: 20,
          children: [
            TextField(
              decoration: InputDecoration(
                  label: Text("Background"), border: OutlineInputBorder()),
              controller: constBackground,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text("Judul"), border: OutlineInputBorder()),
              controller: constJudul,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text("LINK"), border: OutlineInputBorder()),
              controller: constLink,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    background = constBackground.text;
                    konten = constLink.text;
                    Judul = constJudul.text;

                    newTips();
                  },
                  child: Text("Tambah")),
            )
          ],
        ),
      ),
    );
  }
}
