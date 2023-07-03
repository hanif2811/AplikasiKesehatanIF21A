import 'package:flutter/material.dart';
import 'editProfile.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      border: Border.all(color: Colors.white, width: 2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage(
                          "assets/images/WhatsApp Image 2023-06-29 at 19.25.15.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Profile",
              ),
              Text(
                "Percobaan isi profile",
              ),
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
              const SizedBox(
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
                        Text(
                          "70 kg",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Color.fromARGB(255, 61, 48, 245),
                          size: 50,
                        ),
                        Text(
                          "10-June-2003",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.man_outlined,
                          color: Color.fromARGB(255, 61, 48, 245),
                          size: 50,
                        ),
                        Text(
                          "170 cm",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              profileIcon(
                judul: "Settings",
                ikon: Icons.settings,
                saatTekan: () {},
              ),
              profileIcon(
                judul: "User Management",
                ikon: Icons.manage_accounts,
                saatTekan: () {},
              ),
              profileIcon(
                judul: "About",
                ikon: Icons.info,
                saatTekan: () {},
              ),
              const Divider(),
              const SizedBox(height: 10),
              profileIcon(judul: "Logout", ikon: Icons.logout, saatTekan: () {})
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
