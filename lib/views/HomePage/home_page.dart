import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/Beranda.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/profile.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/AppBar.dart';
import '../../widgets/kalkulator_page.dart';
import 'circle_button.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/HomePage/SportPage/YogaPage.dart';

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
      backgroundColor: Color.fromRGBO(19, 103, 187, 1),
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
      color:
          Color.fromRGBO(19, 103, 187, 1), // Ubah warna background menjadi biru
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("iklan").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Text("Tunggu");
                  } else if (snapshot.hasError) {
                    return Text("Ada error, Tunggu");
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, Index) {
                          return TipsnTrik(
                            background: snapshot.data?.docs[Index]
                                ["background"],
                            ID: snapshot.data?.docs[Index]["ID"],
                            url: snapshot.data?.docs[Index]["url"],
                          );
                        });
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      EdgeInsets.only(top: 0, bottom: 20, right: 20, left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          height: 27,
                          width: 130,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff1368BB)),
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xff1368BB)),
                          child: Center(
                            child: Text(
                              "Sistem Pakar",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          GridView.count(
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
                                    MaterialPageRoute(
                                        builder: (context) => Beranda()),
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
                                    MaterialPageRoute(
                                        builder: (context) => Beranda()),
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
                                    MaterialPageRoute(
                                        builder: (context) => Beranda()),
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
                                    MaterialPageRoute(
                                        builder: (context) => Beranda()),
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
                                    MaterialPageRoute(
                                        builder: (context) => Beranda()),
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
                                    MaterialPageRoute(
                                        builder: (context) => Beranda()),
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CountdownScreen()),
                      );
                    },
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
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
    return GestureDetector(
      onTap: () => launherURL(url),
      child: Container(
        width: 300,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: NetworkImage(background), fit: BoxFit.cover)),
      ),
    );
  }
}
