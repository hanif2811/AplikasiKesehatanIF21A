import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tugasakhir_aplikasi_kesehatan/views/MenuPakar/SistemPakar.dart';

class Introduction extends StatelessWidget {
  final Menuid;
  final Judul;
  final fotoAhli;
  final namaAhli;
  final collectionMenu;

  const Introduction(
      {super.key,
      required this.Menuid,
      required this.Judul,
      required this.fotoAhli,
      required this.namaAhli,
      required this.collectionMenu});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
            titleWidget: Text(
              "Jawab Pertanyaan",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            body:
                "Silahkan jawab pertanyaan dengan memilih opsi sesuai dengan keadaan anda sekarang",
            image: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                'assets/images/Pertanyaan.png',
              ),
            )),
        PageViewModel(
            titleWidget: Text(
              "Lihat Hasil",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            body:
                "Jika sudah selesai menjawab pertanyaan, hasil akan muncul sesuai rekomendasi ahli",
            image: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                'assets/images/Hasil.png',
              ),
            )),
        PageViewModel(
            titleWidget: Text(
              "Ahli : $namaAhli ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            body:
                "Semua pertanyaan dan hasil merupakan apa yang di rekomendasikan oleh ahli yang bersangkutan",
            image: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: NetworkImage(fotoAhli), fit: BoxFit.cover)))),
      ],
      onDone: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MenuPakar(Menuid, Judul, collectionMenu)));
      },
      onSkip: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MenuPakar(Menuid, Judul, collectionMenu)));
      },
      showSkipButton: true,
      skip: Text(
        "Skip",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      next: Icon(Icons.arrow_forward),
      done: Text("Lanjut",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      dotsDecorator: DotsDecorator(
        size: Size.square(10),
        activeSize: Size(20, 10),
        activeColor: Colors.black,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
      ),
    );
  }
}
