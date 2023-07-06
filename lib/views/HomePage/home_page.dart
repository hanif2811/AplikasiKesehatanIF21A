import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Beranda.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/profile.dart';
import '../../widgets/AppBar.dart';
import '../../widgets/kalkulator_page.dart';
import 'circle_button.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavbar = 0;

  void changeNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  Widget halaman() {
    if (_selectedNavbar == 0) {
      return HalamanBeranda(context);
    } else if (_selectedNavbar == 1) {
      return kalkulator_Page();
    } else {
      return profile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 103, 187, 1),
        title: appBar(context),
        centerTitle: true,
        elevation: 0,
      ),
      body: halaman(),
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

        onTap: changeNavBar,
        currentIndex: _selectedNavbar,
        selectedItemColor: Color(0xFF1368BB),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
      ),
    );
  }

  Container HalamanBeranda(BuildContext context) {
    return Container(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Beranda()),
                      );
                    },
                  ),
                  CircleButton(
                    label: 'Ibu Hamil',
                    size: 50,
                    icon: Icons.pregnant_woman,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Beranda()),
                      );
                    },
                  ),
                  CircleButton(
                    label: 'Remaja',
                    size: 50,
                    icon: Icons.face,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Beranda()),
                      );
                    },
                  ),
                  CircleButton(
                    label: 'Dewasa',
                    size: 50,
                    icon: Icons.person,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Beranda()),
                      );
                    },
                  ),
                  CircleButton(
                    icon: Icons.people,
                    size: 50,
                    label: 'Lansia',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Beranda()),
                      );
                    },
                  ),
                  CircleButton(
                    label: 'Anak-Anak',
                    size: 50,
                    icon: Icons.child_friendly,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Beranda()),
                      );
                    },
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
