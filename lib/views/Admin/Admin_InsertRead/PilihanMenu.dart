import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_InsertRead/TambahMenu.dart';

class PilihanMenu extends StatefulWidget {
  const PilihanMenu({super.key});

  @override
  State<PilihanMenu> createState() => _PilihanMenuState();
}

class _PilihanMenuState extends State<PilihanMenu> {
  String pilihanMenu = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Menu Sistem Pakar"),
      ),
      body: Center(
        child: Wrap(
          children: [
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      pilihanMenu = "anak-anak";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahMenu(
                                    collectionMenu: pilihanMenu,
                                  )));
                    },
                    child: Text("Tambah menu anak-anak"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      pilihanMenu = "balita";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahMenu(
                                    collectionMenu: pilihanMenu,
                                  )));
                    },
                    child: Text("Tambah menu balita "))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      pilihanMenu = "dewasa";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahMenu(
                                    collectionMenu: pilihanMenu,
                                  )));
                    },
                    child: Text("Tambah Menu dewasa"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      pilihanMenu = "ibu hamil";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahMenu(
                                    collectionMenu: pilihanMenu,
                                  )));
                    },
                    child: Text("Tambah menu ibu hamil"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      pilihanMenu = "lansia";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahMenu(
                                    collectionMenu: pilihanMenu,
                                  )));
                    },
                    child: Text("Tambah menu lansia"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      pilihanMenu = "remaja";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahMenu(
                                    collectionMenu: pilihanMenu,
                                  )));
                    },
                    child: Text("Tambah menu remaja"))),
          ],
        ),
      ),
    );
  }
}
