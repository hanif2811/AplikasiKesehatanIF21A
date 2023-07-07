import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_InsertRead/InsertIklan.dart';
import 'package:url_launcher/url_launcher.dart';

class Iklan extends StatefulWidget {
  const Iklan({super.key});

  @override
  State<Iklan> createState() => _IklanState();
}

class _IklanState extends State<Iklan> {
  Widget menuList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("iklan").snapshots(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? Text("Tunggu")
                : ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, Index) {
                      return TipsnTrik(
                        url: snapshot.data?.docs[Index]["url"],
                        ID: snapshot.data?.docs[Index]["ID"],
                        background: snapshot.data?.docs[Index]["background"],
                      );
                    });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InsertIklan()));
            },
            child: Text("Tambah Iklan")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text("Edit Iklan"),
        ),
        body: menuList());
  }
}

class TipsnTrik extends StatelessWidget {
  final ID;
  final background;
  final url;

  const TipsnTrik(
      {super.key,
      required this.ID,
      required this.background,
      required this.url});

  Future<void> launherURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse)) {
      throw Exception("Tidak bisa melaunch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(bottom: 13),
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: NetworkImage(background), fit: BoxFit.cover)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                FirebaseFirestore.instance
                    .collection("iklan")
                    .doc(ID)
                    .delete()
                    .then((value) => print("Dokumen berhasil dihapus"))
                    .catchError((error) => print("Terjadi kesalahan: $error"));
              },
              child: InkWell(
                child: Icon(Icons.delete),
              ),
            ),
            Text("Hapus Iklan")
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
