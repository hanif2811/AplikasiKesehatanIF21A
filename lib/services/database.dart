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

  Future<void> tambahIklan(
      Map<String, dynamic> dataIklan, String iklanId) async {
    await FirebaseFirestore.instance
        .collection("iklan")
        .doc(iklanId)
        .set(dataIklan)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> tambahTipsTrik(
      Map<String, dynamic> dataTips, String TipsId) async {
    await FirebaseFirestore.instance
        .collection("TipsTrik")
        .doc(TipsId)
        .set(dataTips)
        .catchError((e) {
      print(e.toString());
    });
  }
}
