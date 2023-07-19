// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/HomePage/home_page.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Introduction.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/AppBar.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key, required this.collectionMenu});
  final collectionMenu;

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  Stream? menuStream;

  Widget menuList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(widget.collectionMenu)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Text("Tunggu");
          } else if (snapshot.hasError) {
            return Text("Ada error, Tunggu");
          } else {
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, Index) {
                  return menuTile(
                    url: snapshot.data?.docs[Index]["url"],
                    judul: snapshot.data?.docs[Index]["judul"],
                    deskripsi: snapshot.data?.docs[Index]["deskripsi"],
                    MenuId: snapshot.data?.docs[Index]["MenuId"],
                    fotoAhli: snapshot.data?.docs[Index]["fotoAhli"],
                    namaAhli: snapshot.data?.docs[Index]["namaAhli"],
                    collectionMenu: widget.collectionMenu,
                  );
                });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (HomePage())));
            },
            child: appBarMenuPakar(context)),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
  String fotoAhli = "";
  String namaAhli = "";
  final collectionMenu;
  menuTile(
      {required this.url,
      required this.judul,
      required this.deskripsi,
      required this.MenuId,
      required this.fotoAhli,
      required this.namaAhli,
      required this.collectionMenu});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Introduction(
                      Menuid: MenuId,
                      Judul: judul,
                      fotoAhli: fotoAhli,
                      namaAhli: namaAhli,
                      collectionMenu: collectionMenu,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 13),
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image:
                DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(30)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          ]),
        ),
      ),
    );
  }
}
