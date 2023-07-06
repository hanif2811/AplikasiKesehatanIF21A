// import 'package:flutter/material.dart';

// class CircleButton extends StatelessWidget {
//   final IconData icon;
//   final double size;
//   final String label;

//   const CircleButton({required this.icon, this.size = 80, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: size,
//           height: size,
//           decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.blue // Ubah warna tombol lingkaran menjadi putih
//               ),
//           child: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               icon,
//               color: Colors.white, // Ubah warna ikon menjadi biru
//             ),
//           ),
//         ),
//         SizedBox(height: 10),
//         Text(
//           label,
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String label;
  final double size;
  final IconData icon;
  final Function() onPressed;

  CircleButton({
    required this.label,
    required this.size,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(
              icon,
              size: size * 0.6,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8), // Jarak antara ikon dan label
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
