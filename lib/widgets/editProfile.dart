import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/main.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController tBadan = TextEditingController();
  TextEditingController bBadan = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController noTelfon = TextEditingController();

  void kirimData() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        width: 300.0,
        height: 200.0,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Lengkap : ${nama.text}",
                    textAlign: TextAlign.justify),
                Text("E-Mail : ${email.text}", textAlign: TextAlign.justify),
                Text("Tanggal Lahir : ${tglLahir.text}",
                    textAlign: TextAlign.justify),
                Text("No. Telepon : ${noTelfon.text}",
                    textAlign: TextAlign.justify),
                Text("Alamat : ${alamat.text}", textAlign: TextAlign.justify),
                Text("Tinggi Badan : ${tBadan.text} cm",
                    textAlign: TextAlign.justify),
                Text("Berat Badan : ${bBadan.text} kg",
                    textAlign: TextAlign.justify),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MyHomePage()));
                        },
                        child: const Text("Simpan")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context as BuildContext,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  late DateTime date;
  late TextEditingController tglLahir;

  @override
  void initState() {
    super.initState();
    date = DateTime(2023, 6, 9);
    tglLahir = TextEditingController();
  }

  @override
  void dispose() {
    tglLahir.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 103, 187, 1),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          actions: [
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      kirimData();
                    },
                    icon: Icon(Icons.done)),
                Text(
                  "Simpan",
                  style: TextStyle(fontSize: 10),
                )
              ],
            )
          ],
          elevation: 0,
          title: Image(image: AssetImage("assets/images/logo.png")),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(19, 103, 187, 1),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white, width: 2)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage(
                              "assets/images/WhatsApp Image 2023-06-29 at 19.25.15.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromRGBO(247, 252, 4, 1)),
                      child: IconButton(
                          onPressed: () {},
                          icon:
                              Icon(Icons.edit, color: Colors.white, size: 20)),
                    ),
                  )
                ]),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 20),
                inputanProfile(judul: "Nama Lengkap", controller1: nama),
                const SizedBox(height: 20),
                inputanProfile(judul: "E-Mail", controller1: email),
                const SizedBox(height: 20),
                Container(
                  width: 600,
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Lahir : ${date.year}/${date.month}/${date.day}',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        width: 150,
                        height: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );

                            if (newDate == null) return;

                            setState(() {
                              date = newDate;
                              tglLahir.text =
                                  '${newDate.year}/${newDate.month}/${newDate.day}';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(247, 252, 4, 1),
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                          ),
                          child: Text(
                            "Select Date",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                inputanProfile(judul: "No. Telepon", controller1: noTelfon),
                const SizedBox(height: 20),
                inputanProfile(judul: "Alamat", controller1: alamat),
                const SizedBox(height: 20),
                inputanProfile(
                  judul: "Tinggi Badan",
                  controller1: tBadan,
                ),
                const SizedBox(height: 20),
                inputanProfile(judul: "Berat Badan", controller1: bBadan),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }
}

class inputanProfile extends StatelessWidget {
  const inputanProfile({
    super.key,
    required this.judul,
    required this.controller1,
  });

  final String judul;
  final TextEditingController controller1;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller1,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            label: Text(judul),
            labelStyle: TextStyle(color: Colors.white)),
        style: TextStyle(color: Colors.white));
  }
}