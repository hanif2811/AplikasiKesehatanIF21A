import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/LoginRegister/HalamanAwal.dart';
import 'about.dart';
import 'editProfile.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  late String userId;
  bool loading = true;
  void getData() {
    loading = true;
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      userId = currentUser.uid;
    }
    loading = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.black, width: 5)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Icon(
                              Icons.person,
                              size: 100,
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(userId)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Text(" ");
                          }
                          return Text(snapshot.data?.get("nama_lengkap"));
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(userId)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Text(" ");
                          }
                          return Text(snapshot.data?.get("email"));
                        }),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 61, 48, 245),
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text("Edit Profil",
                              style: TextStyle(
                                color: Colors.white,
                              ))),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.monitor_weight,
                                color: Color.fromARGB(255, 61, 48, 245),
                                size: 50,
                              ),
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(userId)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Text(" ");
                                    }
                                    return Text(
                                        snapshot.data?.get("beratBadan"));
                                  })
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Color.fromARGB(255, 61, 48, 245),
                                size: 50,
                              ),
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(userId)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Text(" ");
                                    }
                                    return Text(
                                        snapshot.data?.get("tanggalLahir"));
                                  })
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.man_outlined,
                                color: Color.fromARGB(255, 61, 48, 245),
                                size: 50,
                              ),
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(userId)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Text(" ");
                                    }
                                    return Text(
                                        snapshot.data?.get("tinggiBadan"));
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    profileIcon(
                      judul: "About",
                      ikon: Icons.info,
                      saatTekan: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => about()));
                      },
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    profileIcon(
                        judul: "Logout",
                        ikon: Icons.logout,
                        saatTekan: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HalamanAwal()));
                        })
                  ],
                ),
              ),
            ),
    );
  }
}

class profileIcon extends StatelessWidget {
  const profileIcon({
    super.key,
    required this.judul,
    required this.ikon,
    required this.saatTekan,
    this.ikonAkhir = true,
  });

  final String judul;
  final IconData ikon;
  final VoidCallback saatTekan;
  final bool ikonAkhir;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: saatTekan,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromARGB(255, 61, 48, 245),
        ),
        child: Icon(
          ikon,
          color: Colors.white,
        ),
      ),
      title: Text(
        judul,
      ),
      trailing: ikonAkhir
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromRGBO(19, 103, 187, 1).withOpacity(0.1)),
              child: const Icon(
                Icons.arrow_forward_ios,
              ),
            )
          : null,
    );
  }
}
