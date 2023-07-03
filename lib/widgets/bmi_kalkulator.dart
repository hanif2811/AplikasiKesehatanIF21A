import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/HomePage/home_page.dart';

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: BMICalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  int _selectedGenderIndex = 0;

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0.0;
    double weight = double.tryParse(_weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      String kategori = '';

      if (bmi < 18.5) {
        kategori = 'Kurus';
      } else if (bmi >= 18.5 && bmi < 25.0) {
        kategori = 'Normal';
      } else if (bmi >= 25.0 && bmi < 30.0) {
        kategori = 'Kelebihan Berat Badan';
      } else {
        kategori = 'Obesitas';
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BMIResultScreen(bmi: bmi, kategori: kategori),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Tinggi dan berat badan harus diisi dengan benar.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            Text('Kalkulator BMI'),
          ],
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.settings),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => SettingsScreen()),
        //       );
        //     },
        //   ),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Jenis Kelamin',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Pria'),
                    leading: Radio<int>(
                      value: 0,
                      groupValue: _selectedGenderIndex,
                      onChanged: (value) {
                        setState(() {
                          _selectedGenderIndex = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Wanita'),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: _selectedGenderIndex,
                      onChanged: (value) {
                        setState(() {
                          _selectedGenderIndex = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Tinggi Badan (cm)',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            Text(
              'Berat Badan (kg)',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Hitung',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BMIResultScreen extends StatelessWidget {
  final double bmi;
  final String kategori;

  BMIResultScreen({required this.bmi, required this.kategori});

  String getTips() {
    if (kategori == 'Kurus') {
      return 'Tips untuk kategori Kurus';
    } else if (kategori == 'Normal') {
      return 'Tips untuk kategori Normal';
    } else if (kategori == 'Kelebihan Berat Badan') {
      return 'Tips untuk kategori Kelebihan Berat Badan';
    } else {
      return 'Tips untuk kategori Obesitas';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil BMI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI Anda:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Kategori:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              kategori,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TipsScreen(kategori: kategori),
                  ),
                );
              },
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: 100.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Hitung Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class TipsScreen extends StatelessWidget {
  final String kategori;

  TipsScreen({required this.kategori});

  String getTips() {
    if (kategori == 'Kurus') {
      return 'Tips untuk kategori Kurus';
    } else if (kategori == 'Normal') {
      return 'Tips untuk kategori Normal';
    } else if (kategori == 'Kelebihan Berat Badan') {
      return 'Tips untuk kategori Kelebihan Berat Badan';
    } else {
      return 'Tips untuk kategori Obesitas';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tips Sesuai Kategori BMI',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(getTips()),
          ],
        ),
      ),
    );
  }
}
