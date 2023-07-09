import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController controllernama = TextEditingController();
  final TextEditingController controllertBadan = TextEditingController();
  final TextEditingController controllerbBadan = TextEditingController();
  final TextEditingController controlleremail = TextEditingController();
  final TextEditingController controllernoTelfon = TextEditingController();
  final TextEditingController tglLahir = TextEditingController();

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

        String notelfon = userData['no_telp'];
        String username = userData['nama_lengkap'];
        String email = userData['email'];
        String beratBadan = userData['beratBadan'];
        String tinggiBadan = userData['tinggiBadan'];
        String tanggalLahir = userData['tanggalLahir'];

        controllernama.text = username;
        controllernoTelfon.text = notelfon;
        controlleremail.text = email;
        controllerbBadan.text = beratBadan;
        controllertBadan.text = tinggiBadan;
        tglLahir.text = tanggalLahir;
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

  void kirimData() async {
    if (controllernama.text.isEmpty ||
        controlleremail.text.isEmpty ||
        tglLahir.text.isEmpty ||
        controllernoTelfon.text.isEmpty ||
        controllertBadan.text.isEmpty ||
        controllerbBadan.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Harap isi semua field.'),
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
    } else {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'nama_lengkap': controllernama.text,
          'email': controlleremail.text,
          'tanggalLahir': tglLahir.text,
          'no_telp': controllernoTelfon.text,
          'tinggiBadan': controllertBadan.text,
          'beratBadan': controllerbBadan.text,
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sukses'),
              content: Text('Data berhasil disimpan.'),
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
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Terjadi kesalahan saat menyimpan data.'),
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
  }

  bool validateEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );

    if (emailRegex.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();

    getDataFromFirestore();
  }

  @override
  void dispose() {
    controllernama.dispose();
    controllertBadan.dispose();
    controllerbBadan.dispose();
    controlleremail.dispose();
    controllernoTelfon.dispose();
    tglLahir.dispose();
    super.dispose();
  }

  Future<void> pickDob() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      calculateAge(pickedDate);
    }
  }

  void calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    String myAge = '$years tahun';

    setState(() {
      date = birth;
      tglLahir.text = myAge;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  kirimData();
                },
                icon: Icon(Icons.done),
              ),
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
              const SizedBox(height: 20),
              inputanProfile(
                  judul: "Nama Lengkap", controller1: controllernama),
              const SizedBox(height: 20),
              inputanProfile(
                judul: "E-Mail",
                controller1: controlleremail,
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.1,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tanggal Lahir : ${date.year}/${date.month}/${date.day}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: ElevatedButton(
                          onPressed: () async {
                            await pickDob();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(19, 103, 187, 1),
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                          ),
                          child: Text(
                            "Select Date",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              inputanProfile(
                judul: "No. Telepon",
                controller1: controllernoTelfon,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              inputanProfile(
                judul: "Tinggi Badan",
                controller1: controllertBadan,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              inputanProfile(
                judul: "Berat Badan",
                controller1: controllerbBadan,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class inputanProfile extends StatefulWidget {
  const inputanProfile({
    Key? key,
    required this.judul,
    required this.controller1,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  final String judul;
  final TextEditingController controller1;
  final TextInputType inputType;

  @override
  _InputanProfileState createState() => _InputanProfileState();
}

class _InputanProfileState extends State<inputanProfile> {
  bool showError = false;
  String errorMessage = '';

  bool validateEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );
    return emailRegex.hasMatch(email);
  }

  void showErrorMsg(String message) {
    setState(() {
      showError = true;
      errorMessage = message;
    });
  }

  void hideErrorMsg() {
    setState(() {
      showError = false;
      errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller1,
          keyboardType: widget.inputType,
          inputFormatters: widget.inputType == TextInputType.number
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : null,
          onChanged: (value) {
            if (widget.inputType == TextInputType.emailAddress) {
              bool isValid = validateEmail(value);
              if (!isValid) {
                showErrorMsg('Email tidak valid');
              } else {
                hideErrorMsg();
              }
            }
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: widget.judul,
          ),
        ),
        if (showError)
          Text(
            errorMessage,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
