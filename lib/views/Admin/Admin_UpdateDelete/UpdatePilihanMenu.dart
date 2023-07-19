import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_UpdateDelete/UpdateMenu.dart';

class UpdatePilihanMenu extends StatefulWidget {
  const UpdatePilihanMenu({super.key});

  @override
  State<UpdatePilihanMenu> createState() => _UpdatePilihanMenuState();
}

class _UpdatePilihanMenuState extends State<UpdatePilihanMenu> {
  String UpdatepilihanMenu = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Update Menu Sistem Pakar"),
      ),
      body: Center(
        child: Wrap(
          children: [
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      UpdatepilihanMenu = "anak-anak";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateMenu(
                                    collectionMenu: UpdatepilihanMenu,
                                  )));
                    },
                    child: Text("Update menu anak-anak"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      UpdatepilihanMenu = "balita";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateMenu(
                                    collectionMenu: UpdatepilihanMenu,
                                  )));
                    },
                    child: Text("Update menu balita "))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      UpdatepilihanMenu = "dewasa";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateMenu(
                                    collectionMenu: UpdatepilihanMenu,
                                  )));
                    },
                    child: Text("Update Menu dewasa"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      UpdatepilihanMenu = "ibu hamil";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateMenu(
                                    collectionMenu: UpdatepilihanMenu,
                                  )));
                    },
                    child: Text("Update menu ibu hamil"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      UpdatepilihanMenu = "lansia";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateMenu(
                                    collectionMenu: UpdatepilihanMenu,
                                  )));
                    },
                    child: Text("Update menu lansia"))),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      UpdatepilihanMenu = "remaja";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateMenu(
                                    collectionMenu: UpdatepilihanMenu,
                                  )));
                    },
                    child: Text("Update menu remaja"))),
          ],
        ),
      ),
    );
  }
}
