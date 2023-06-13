// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_InsertRead/TambahPenanganan.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_UpdateDelete/UpdateGejala.dart';

import 'package:tugasakhir_aplikasi_kesehatan/widgets/AppBar.dart';

class UpdateMenu extends StatefulWidget {
  const UpdateMenu({super.key});

  @override
  State<UpdateMenu> createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  Stream? menuStream;

  // DbService dbService = DbService();

  Widget menuList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("tambah_menu").snapshots(),
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Text("Tunggu")
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, Index) {
                    return menuTile(
                      url: snapshot.data?.docs[Index]["url"],
                      judul: snapshot.data?.docs[Index]["judul"],
                      deskripsi: snapshot.data?.docs[Index]["deskripsi"],
                      MenuId: snapshot.data?.docs[Index]["MenuId"],
                    );
                  });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: menuList(),
    );
  }
}

class menuTile extends StatelessWidget {
  String url = "";
  String judul = "";
  String deskripsi = "";
  String MenuId = "";
  menuTile(
      {required this.url,
      required this.judul,
      required this.deskripsi,
      required this.MenuId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.only(bottom: 13),
              height: 150,
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    url,
                    width: MediaQuery.of(context).size.width - 48,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  // color: Colors.black26,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black54),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        judul,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        deskripsi,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ])),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  InkWell(
                    child: Icon(Icons.update),
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection("tambah_menu")
                          .doc(MenuId)
                          .collection("List_Gejala")
                          .get()
                          .then((querySnapshot) {
                        querySnapshot.docs.forEach((doc) {
                          doc.reference.delete();
                        });
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UpdateGejala(MenuId, "", [], [])));
                    },
                  ),
                  Text(
                    "Update data gejala",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  InkWell(
                    child: Icon(Icons.change_circle_sharp),
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection("tambah_menu")
                          .doc(MenuId)
                          .collection("penanganan")
                          .get()
                          .then((querySnapshot) {
                        querySnapshot.docs.forEach((doc) {
                          doc.reference.delete();
                        });
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahPenanganan(MenuId)));
                    },
                  ),
                  Text(
                    "Update penanganan",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  InkWell(
                    child: Icon(Icons.delete),
                    onTap: () {
                      //action code when clicked
                      FirebaseFirestore.instance
                          .collection("tambah_menu")
                          .doc(MenuId)
                          .collection("List_Gejala")
                          .get()
                          .then((querySnapshot) {
                        querySnapshot.docs.forEach((doc) {
                          doc.reference.delete();
                        });
                      });

                      FirebaseFirestore.instance
                          .collection("tambah_menu")
                          .doc(MenuId)
                          .collection("penanganan")
                          .get()
                          .then((querySnapshot) {
                        querySnapshot.docs.forEach((doc) {
                          doc.reference.delete();
                        });
                      });

                      FirebaseFirestore.instance
                          .collection("tambah_menu")
                          .doc(MenuId)
                          .delete()
                          .then((value) => print("Dokumen berhasil dihapus"))
                          .catchError(
                              (error) => print("Terjadi kesalahan: $error"));
                    },
                  ),
                  Text(
                    "Hapus semua data",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
