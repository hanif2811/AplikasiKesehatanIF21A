import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_aplikasi_kesehatan/widgets/AppBar.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  final TextEditingController controlleremail = TextEditingController();
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String userId;

  void getDataFromFirestore() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        userId = currentUser.uid;

        DocumentSnapshot documentSnapshot =
            await _firestore.collection('users').doc(userId).get();
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        String email = userData['email'];

        controlleremail.text = email;
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Terjadi kesalahan saat mengambil data.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void changePassword(BuildContext context) async {
    if (controlleremail.text.isEmpty ||
        currentPassword.text.isEmpty ||
        newPassword.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Harap isi semua field"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text("Konfirmasi"),
            content: Text("Apakah Anda yakin ingin mengubah password?"),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.of(dialogContext).pop();
                  try {
                    UserCredential userCredential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: controlleremail.text,
                      password: currentPassword.text,
                    );
                    User? user = userCredential.user;
                    if (user != null) {
                      await user.updatePassword(newPassword.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Sandi berhasil diubah"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  } catch (error) {
                    print('Terjadi kesalahan saat mengubah password: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Sandi gagal diubah"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Text("Ya"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text("Tidak"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataFromFirestore();
    super.initState();
  }

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Ubah kata sandi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controlleremail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text("E-mail")),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: currentPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text("Kata sandi saat ini")),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: newPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text("Kata sandi baru")),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      changePassword(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 61, 48, 245),
                        side: BorderSide.none,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.8, 40),
                        shape: const StadiumBorder()),
                    child: Text("Ubah kata sandi")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
