import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/services/database.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/AdminBeranda.dart';

class TambahMaps extends StatefulWidget {
  final menuId;
  const TambahMaps({super.key, required this.menuId});

  @override
  State<TambahMaps> createState() => _TambahMapsState();
}

class _TambahMapsState extends State<TambahMaps> {
  TextEditingController conListMap = TextEditingController();
  TextEditingController conNama = TextEditingController();

  List<String> ListMap = [];
  List<String> ListNama = [];

  DbService dbService = DbService();
  addMaps() async {
    Map<String, dynamic> add_Maps = {
      'listMap': ListMap,
      'nama': ListNama,
    };

    await dbService.tambahMaps(add_Maps, widget.menuId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Maps Rujukan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(runSpacing: 20, children: [
          TextField(
            decoration: InputDecoration(
                label: Text("Masukkan link maps"),
                border: OutlineInputBorder()),
            controller: conListMap,
          ),
          TextField(
            decoration: InputDecoration(
                label: Text("Masukkan nama tempat rujukan"),
                border: OutlineInputBorder()),
            controller: conNama,
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    ListMap.add(conListMap.text);
                    ListNama.add(conNama.text);

                    conListMap.text = "";
                    conNama.text = "";
                  },
                  child: Text("Tambah maps")),
            ),
          ),
          SizedBox(
              width: 600,
              child: ElevatedButton(
                onPressed: () {
                  if (ListMap.isEmpty || ListNama.isEmpty) {
                    final snackBar = SnackBar(
                      content:
                          Text("Isi terlebih dahulu link maps dan nama tempat"),
                      duration: Duration(seconds: 3),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    addMaps();

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminBeranda()));
                  }
                },
                child: Text("Simpan"),
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
        ]),
      ),
    );
  }
}
