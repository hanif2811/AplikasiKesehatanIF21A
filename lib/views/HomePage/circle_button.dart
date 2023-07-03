import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String label;
  final double size;
  final IconData icon;

  const CircleButton({required this.label, this.size = 80, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue // Ubah warna tombol lingkaran menjadi putih
              ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.white, // Ubah warna ikon menjadi biru
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
