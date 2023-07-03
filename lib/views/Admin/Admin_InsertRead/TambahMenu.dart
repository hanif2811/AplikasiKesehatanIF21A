import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:tugasakhir_aplikasi_kesehatan/services/database.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/Admin/Admin_InsertRead/TambahGejala.dart';

class TambahMenu extends StatefulWidget {
  const TambahMenu({super.key});

  @override
  State<TambahMenu> createState() => _TambahMenuState();
}

class _TambahMenuState extends State<TambahMenu> {
  final _formkey1 = GlobalKey<FormState>();
  String url = "";
  String judul = "";
  String deskripsi = "";
  String menuId = "";
  String fotoAhli = "";
  String namaAhli = "";

  DbService dbService = DbService();

  newMenu() async {
    if (_formkey1.currentState!.validate()) {
      menuId = randomAlphaNumeric(16);

      Map<String, String> menuMap = {
        "MenuId": menuId,
        "url": url,
        "judul": judul,
        "deskripsi": deskripsi,
        "fotoAhli": fotoAhli,
        "namaAhli": namaAhli
      };

      await dbService.tambahMenu(menuMap, menuId).then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TambahGejala(menuId, "", [], [])));
      }).catchError((e) {
        print(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("TambahMenu"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: Form(
          key: _formkey1,
          child: Center(
            child: ListView(
              children: [
                TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Jangan kosongi url foto ahli atau url bukan sebuah gambar';
                    } else if (!val.contains(".png") &&
                        !val.contains(".jpg") &&
                        !val.contains(".jpeg")) {
                      return 'Url bukan sebuah gambar';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      label: Text("Masukkan url gambar ahli/dokter peninjau"),
                      border: UnderlineInputBorder()),
                  onChanged: (val) {
                    fotoAhli = val;
                  },
                ),
                TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Jangan kosongi nama ahli';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      label: Text("Masukkan nama ahli"),
                      border: UnderlineInputBorder()),
                  onChanged: (val) {
                    namaAhli = val;
                  },
                ),
                TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Jangan kosongi url background atau url bukan sebuah gambar';
                    } else if (!val.contains(".png") &&
                        !val.contains(".jpg") &&
                        !val.contains(".jpeg")) {
                      return 'Url bukan sebuah gambar';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      label: Text("Masukkan url gambar background menu"),
                      border: UnderlineInputBorder()),
                  onChanged: (val) {
                    url = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Jangan kosongi judul';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Masukkan judul tes"),
                      border: UnderlineInputBorder()),
                  onChanged: (val) {
                    judul = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Jangan kosongi deskripsi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Masukkan deskripsi"),
                      border: UnderlineInputBorder()),
                  onChanged: (val) {
                    deskripsi = val;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        newMenu();
                      },
                      child: Text("Tambah"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                          foregroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 2, 54, 97)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 2, 54, 97))))),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
