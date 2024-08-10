// import 'package:flutter/material.dart';

// class CustomCardButton extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final VoidCallback onTap;
//   final Color backgroundColor;
//   final Color borderColor;
//   final Color titleColor;

//   CustomCardButton({
//     required this.imageUrl,
//     required this.onTap,
//     required this.title,
//     this.backgroundColor = Colors.white,
//     this.borderColor = Colors.grey,
//     this.titleColor = Colors.black,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         child: Container(
//           width: double.infinity,
//           margin: EdgeInsets.symmetric(vertical: 10),
//           decoration: BoxDecoration(
//             color: backgroundColor,
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: borderColor, width: 2),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 10,
//                 offset: Offset(0, 5),
//               ),
//             ],
//             gradient: LinearGradient(
//               colors: [backgroundColor.withOpacity(0.5), Colors.white],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//                 child: Image.asset(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 150,
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(12),
//                 alignment: Alignment.center,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: titleColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
