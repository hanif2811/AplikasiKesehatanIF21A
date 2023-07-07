// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Beranda.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/SistemPakar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/AppBar.dart';

double hasil() {
  return totalsemua! / gejalaData.length;
}

class HasilDeteksi extends StatefulWidget {
  String MenuId;
  String judul;

  HasilDeteksi(this.MenuId, this.judul);

  @override
  State<HasilDeteksi> createState() => _HasilDeteksiState();
}

class _HasilDeteksiState extends State<HasilDeteksi> {
  List<DocumentSnapshot> penangananData = [];
  List<DocumentSnapshot> mapsData = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataPenanganan(widget.MenuId);
    fetchDataMaps(widget.MenuId);
  }

  Future<void> fetchDataPenanganan(String menuId) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("tambah_menu")
        .doc(menuId)
        .collection("penanganan")
        .get();
    setState(() {
      penangananData = snapshot.docs;
    });
  }

  Future<void> fetchDataMaps(String menuId) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("tambah_menu")
        .doc(menuId)
        .collection("maps")
        .get();
    setState(() {
      mapsData = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 103, 187, 1),
        title: appBar(context),
        centerTitle: true,
      ),
      body: penangananData.isEmpty || mapsData.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : penanganan(),
      floatingActionButton: SizedBox(
        width: 130,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Beranda()));
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromRGBO(255, 237, 0, 1)),
              foregroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 2, 54, 97)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side:
                          BorderSide(color: Color.fromARGB(255, 2, 54, 97))))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Icon(Icons.navigate_before), Text('Back')],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget? penanganan() {
    if (hasil() <= 0.5) {
      return Solusi(
        solusi: penangananData[0]["Rendah"],
        judul: widget.judul,
        maps: mapsData[0]["listMap"],
        namaLokasi: mapsData[0]["nama"],
      );
    } else {
      return Solusi(
        solusi: penangananData[0]["Tinggi"],
        judul: widget.judul,
        maps: mapsData[0]["listMap"],
        namaLokasi: mapsData[0]["nama"],
      );
    }
  }
}

class Solusi extends StatelessWidget {
  final maps;
  final solusi;
  final judul;
  final namaLokasi;
  const Solusi(
      {super.key,
      required this.solusi,
      required this.judul,
      required this.maps,
      required this.namaLokasi});

  Future<void> launherURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse)) {
      throw Exception("Tidak bisa melaunch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 13, bottom: 13, right: 13, left: 30),
              child: resiko(hasil())),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Hasil dari " + judul + " adalah : ",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 19, right: 50, top: 20),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kemungkinan anda terkena " +
                                (hasil() * 100).toStringAsFixed(1) +
                                " %",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 10),
                          CircularProgressIndicator(
                            value: hasil(),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                _warnaresiko(hasil())),
                            backgroundColor: Colors.grey[300],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Apa yang sebaiknya anda lakukan : ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: solusi.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: Icon(Icons.circle),
                              title: Text(
                                solusi[index],
                                style: TextStyle(fontSize: 15),
                              ));
                        }),
                  ),
                  Center(
                      child: Text(
                    "List Rekomendasi Rujukan Terbaik : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
                  Container(
                    height: 150,
                    child: ListView.builder(
                        itemCount: maps.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.local_hospital),
                            title: GestureDetector(
                                onTap: () {
                                  launherURL(maps[index]);
                                },
                                child: Text(
                                  namaLokasi[index],
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
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

Text resiko(double tingkat_resiko) {
  if (tingkat_resiko <= 0.5) {
    return Text(
      "Hasil : Anda tidak berpotensi",
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
    );
  } else {
    return Text(
      "Hasil : Anda berpotensi",
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
