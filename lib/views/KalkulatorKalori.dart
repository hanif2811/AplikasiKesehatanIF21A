import 'package:flutter/material.dart';

List<String> aktifitas = [
  "Silahkan Pilih Aktifitas Anda",
  "Kurang aktif",
  "Aktif ringan",
  "Cukup aktif",
  "Sangat aktif",
  "Ekstra aktif"
];
String pilihAktifitas = "Silahkan Pilih Aktifitas Anda";

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: new myHomePage());
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = '';

  double calculateCalories() {
    double age = double.tryParse(ageController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;

    double bmr;

    if (pilihAktifitas == 'Kurang aktif') {
      if (jenisKelamin == 'Laki-Laki') {
        bmr = 88.4 + (13.4 * weight) + (4.8 * height) - (5.68 * age);
      } else {
        bmr = 447.6 + (9.25 * weight) + (3.10 * height) - (4.33 * age);
      }
      double calories = bmr * 1.2;

      return calories;
    } else if (pilihAktifitas == 'Aktif ringan') {
      if (jenisKelamin == 'Laki-Laki') {
        bmr = 88.4 + (13.4 * weight) + (4.8 * height) - (5.68 * age);
      } else {
        bmr = 447.6 + (9.25 * weight) + (3.10 * height) - (4.33 * age);
      }
      double calories = bmr * 1.375;

      return calories;
    } else if (pilihAktifitas == 'Cukup aktif') {
      if (jenisKelamin == 'Laki-Laki') {
        bmr = 88.4 + (13.4 * weight) + (4.8 * height) - (5.68 * age);
      } else {
        bmr = 447.6 + (9.25 * weight) + (3.10 * height) - (4.33 * age);
      }
      double calories = bmr * 1.55;

      return calories;
    } else if (pilihAktifitas == 'Sangat aktif') {
      if (jenisKelamin == 'Laki-Laki') {
        bmr = 88.4 + (13.4 * weight) + (4.8 * height) - (5.68 * age);
      } else {
        bmr = 447.6 + (9.25 * weight) + (3.10 * height) - (4.33 * age);
      }
      double calories = bmr * 1.725;

      return calories;
    } else {
      if (jenisKelamin == 'Laki-Laki') {
        bmr = 88.4 + (13.4 * weight) + (4.8 * height) - (5.68 * age);
      } else {
        bmr = 447.6 + (9.25 * weight) + (3.10 * height) - (4.33 * age);
      }
      double calories = bmr * 1.9;

      return calories;
    }
  }

  void kirimData() {
    String result = calculateCalories().toStringAsFixed(2);

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
                Text("Umur : ${ageController.text} Tahun",
                    textAlign: TextAlign.justify),
                Text("Berat Badan : ${weightController.text} Kg",
                    textAlign: TextAlign.justify),
                Text("Tinggi Badan : ${heightController.text} Cm",
                    textAlign: TextAlign.justify),
                Text("Jenis Kelamin : $jenisKelamin",
                    textAlign: TextAlign.justify),
                Text("Level Aktifitas : $pilihAktifitas",
                    textAlign: TextAlign.justify),
                Text("Kebutuhan Kalori Harian : $result Kalori",
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
                          Navigator.pop(context);
                        },
                        child: const Text("OK")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  String jenisKelamin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(
        title: Image.asset('assets/images/Untitled design (25).png'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(19, 104, 187, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text('Kalkulator Kalori'),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black)),
                      label: Text("Berat badan (KG)"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black)),
                      label: Text("Tinggi badan (CM)"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black)),
                      label: Text("Umur"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Level Aktivitas:  ',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DropdownButton(
                      hint: Text(
                        "Silahkan pilih aktifitas anda",
                      ),
                      icon: Icon(Icons.arrow_drop_down),
                      value: pilihAktifitas,
                      items: aktifitas.map((String value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          pilihAktifitas = value!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Pilih Jenis Kelamin",
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text(
                          "Pria",
                          style: TextStyle(fontSize: 16),
                        ),
                        value: "Laki-Laki",
                        groupValue: jenisKelamin,
                        onChanged: (value) {
                          setState(() {
                            jenisKelamin = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text(
                          "Wanita",
                          style: TextStyle(fontSize: 16),
                        ),
                        value: "Perempuan",
                        groupValue: jenisKelamin,
                        onChanged: (value) {
                          setState(() {
                            jenisKelamin = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    onPressed: kirimData,
                    child: Text('Calculate'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(
                              255, 237, 0, 1)), // Mengubah warna tombol
                      alignment: Alignment.center,
                      // Memindahkan tombol ke kanan
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
