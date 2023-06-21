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
        backgroundColor: Color.fromRGBO(19, 103, 187, 1),
        elevation: 0,
        leading: Icon(Icons.dehaze),
        centerTitle: true,
        title: Center(
          child: Image.asset(
            'assets/images/Untitled design (25).png',
            width: 600,
            height: 800,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          runSpacing: 10,
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              controller: weightController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2.0, color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2.0, color: Colors.white)),
                  label: Text("Berat badan (KG)"),
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: heightController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2.0, color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2.0, color: Colors.white)),
                  label: Text("Tinggi Badan (CM)"),
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: ageController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2.0, color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2.0, color: Colors.white)),
                  label: Text("Umur"),
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20.0),
            Text(
              'Jenis Kelamin:',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text("Laki-Laki",
                        style: TextStyle(color: Colors.white)),
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
                    title: Text("Perempuan",
                        style: TextStyle(color: Colors.white)),
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
            Row(
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Level Aktivitas:  ',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                DropdownButton(
                  hint: Text(
                    "Silahkan pilih aktifitas anda",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.arrow_drop_down),
                  value: pilihAktifitas,
                  items: aktifitas.map((String value) {
                    return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style:
                              TextStyle(color: Color.fromRGBO(255, 237, 0, 1)),
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
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: kirimData,
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
