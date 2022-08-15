// import 'package:flutter/material.dart';

// import '../../core/constants/colors.dart';
// import '../../core/constants/dimensions.dart';

// class RoundTabItem extends StatefulWidget {
//   RoundTabItem({
//     Key? key,
//     // required this.text,
//     // required this.index,
    
//   }) : super(key: key);

//   // final String text;
//   // final int index;

//   @override
//   State<RoundTabItem> createState() => _RoundTabItemState();
// }


// class _RoundTabItemState extends State<RoundTabItem> {
//   List<String> brands = [
//     "All",
//     "Mercedes",
//     "Volvo",
//     "BMW",
//     "Tesla",
//     "Land Rover",
//     "Toyota",
//     "Rolls Royce",
//     "Audi",
//     "Lexus",
//   ];

//   int tappedIndex = 0;
//   int? index;
//   String? text;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           tappedIndex = index!;
//         });
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           border: tappedIndex == index
//               ? Border.all(color: Colors.transparent)
//               : Border.all(color: kGrey),
//           borderRadius: kRadius30,
//           color: tappedIndex == index ? fieldColor : Colors.transparent,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 20,
//                 right: 20,
//               ),
//               child: Text(
//                 text!,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: kText,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
