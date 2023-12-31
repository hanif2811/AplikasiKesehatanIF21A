import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'AppBar.dart';

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
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: const Color(0xFF1368BB),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffFFFFFF)),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Kalkulator",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xffFFED00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "BMI",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF1368BB),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
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
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 1.0, color: Colors.black)),
                      label: Text("Tinggi Badan (CM)"),
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateBMI,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(255, 237, 0, 1)),
                  ),
                  child: Text(
                    'Hitung',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'BMI Anda:',
                  style: TextStyle(fontSize: 20.0),
                ),
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
                  // child: Icon(
                  //   Icons.arrow_forward,
                  //   size: 100.0,
                  //   color: Colors.white,
                  // ),
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
        ));
  }
}

class TipsScreen extends StatelessWidget {
  final String kategori;

  TipsScreen({required this.kategori});

  String getTips() {
    if (kategori == 'Kurus') {
      return '1. Mengonsumsi Makanan yang Kaya Nutrisi\n2. Makan Lebih Sering dengan Porsi Sedikit\n3. Memilih Makanan Padat Kalori\n4. Mengonsumsi Camilan Sehat\n5. Rutin Berolahraga\n6. Minum di Waktu yang Tepat\n7. Memperbanyak Air Mineral dan Susu';
    } else if (kategori == 'Normal') {
      return 'Cara menjaga berat badan tetap ideal\n\n1. Kurangi cemilan tinggi GGL dan mengkonsumsi lebih banyak buah dan sayur\n2. Lakukan aktivitas fisik 30 menit per hari\n3. Istirahat yang cukup\n';
    } else if (kategori == 'Kelebihan Berat Badan') {
      return 'Tips untuk kategori Kelebihan Berat Badan\n\n1. Hindari melewatkan sarapan\n2. Hindari minuman manis\n3. Konsumsi air putih sebelum makan\n4. Konsumsi makanan yang mengandung serat larut\n5. Konsumsi kopi dan teh\n6. Hindari makanan olahan\n7. Konsumsi makanan secara perlahan\n8. Lakukan olahraga secara rutin\n9. Tidur yang cukup';
    } else {
      return 'Tips untuk kategori Obesitas\n\n1. Konsumsi sayur dan buah minimal 5 porsi setiap harinya\n2. Membatasi tidur yang berlebihan\n3. Meningkatkan aktivitas fisik minimal 30 menit setiap hari. Lakukan secara teratur\n3-5 kali per minggu kemudian lakukan penyesuaian setelah beberapa minggu\n4. Membatasi aktivitas, seperti menonton televisi, bermain komputer dan games\n5. Batasi konsumsi gula, garam, dan lemak berlebih';
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
