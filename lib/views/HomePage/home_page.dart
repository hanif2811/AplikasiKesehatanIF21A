import 'package:flutter/material.dart';
import 'circle_button.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/bmi_kalkulator.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
        '/settings': (context) => UserPage(),
        '/calculator': (context) => BMICalculatorApp(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Tambahkan dengan Navigator.push()
          },
        ),
        title: Text(
          'Healthy Skuy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.yellow.shade100,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue, // Ubah warna background menjadi biru
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 300,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text('Widget 1')),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text('Widget 2')),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text('Widget 3')),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding:
                    EdgeInsets.only(top: 40, bottom: 20, right: 20, left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridView.count(
                  crossAxisCount: 3, // Jumlah kolom
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Agar GridView tidak dapat discroll
                  children: [
                    CircleButton(
                      label: 'Balita',
                      size: 50,
                      icon: Icons.child_care,
                    ),
                    CircleButton(
                      label: 'Ibu Hamil',
                      size: 50,
                      icon: Icons.pregnant_woman,
                    ),
                    CircleButton(
                      label: 'Remaja',
                      size: 50,
                      icon: Icons.face,
                    ),
                    CircleButton(
                      label: 'Dewasa',
                      size: 50,
                      icon: Icons.person,
                    ),
                    CircleButton(
                      label: 'Lansia',
                      size: 50,
                      icon: Icons.people,
                    ),
                    CircleButton(
                      label: 'Anak-Anak',
                      size: 50,
                      icon: Icons.child_friendly,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor:
                            Colors.white, // Ubah warna tombol menjadi putih
                      ),
                      child: Text(
                        'Running Apps',
                        style: TextStyle(
                          color: Colors.black, // Ubah warna teks menjadi hitam
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor:
                            Colors.white, // Ubah warna tombol menjadi putih
                      ),
                      child: Text(
                        'Latihan Kebugaran',
                        style: TextStyle(
                          color: Colors.black, // Ubah warna teks menjadi hitam
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor:
                            Colors.white, // Ubah warna tombol menjadi putih
                      ),
                      child: Text(
                        'Yoga Ibu Hamil',
                        style: TextStyle(
                          color: Colors.black, // Ubah warna teks menjadi hitam
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'User',
          ),
        ],

        //     NavigationBar.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => BMICalculatorApp())
        //     )
        // },

        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Home_Screen()));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BMICalculatorApp()));
              break;
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserPage()));
              break;
          }
        },
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Container(
        child: Center(
          child: Text('Hai Asep !'),
        ),
      ),
    );
  }
}
