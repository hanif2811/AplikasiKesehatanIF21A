import 'dart:html';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  Future<void> tambahMenu(Map<String, String> dataMenu, String menuId) async {
    await FirebaseFirestore.instance
        .collection("tambah_menu")
        .doc(menuId)
        .set(dataMenu)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> tambahGejala(
      Map<String, dynamic> dataGejala, String menuId) async {
    await FirebaseFirestore.instance
        .collection("tambah_menu")
        .doc(menuId)
        .collection("List_Gejala")
        .add(dataGejala)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> tambahPenanganan(
      Map<String, dynamic> dataPenanganan, String menuId) async {
    await FirebaseFirestore.instance
        .collection("tambah_menu")
        .doc(menuId)
        .collection("penanganan")
        .add(dataPenanganan)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> tambahMaps(Map<String, dynamic> dataMap, String menuId) async {
    await FirebaseFirestore.instance
        .collection("tambah_menu")
        .doc(menuId)
        .collection("maps")
        .add(dataMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
