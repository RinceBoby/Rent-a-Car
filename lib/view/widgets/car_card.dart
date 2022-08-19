// import 'package:carmarket/controllers/car_controller.dart';
// import 'package:carmarket/view/details/car_details.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../core/constants/colors.dart';
// import '../../core/constants/dimensions.dart';

// class CarCard extends StatelessWidget {
//   const CarCard({
//     Key? key,
//     required this.index,
//   }) : super(key: key);
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     CarController carController = Get.put(CarController());
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Stack(
//           children: [
//             Container(
//               height: 150,
//               width: 170,
//               decoration: BoxDecoration(
//                 color: fieldColor,
//                 borderRadius: kRadius15,
//                 image: const DecorationImage(
//                   image: AssetImage("assets/lamborghini_PNG102917.png"),
//                 ),
//               ),

//               //<<<<<Fav_Icon>>>>>//
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 10,
//                     right: 10,
//                   ),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: Image.asset(
//                       "assets/fav-icon.png",
//                       height: 25,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         kHeight10,

//         //<<<<<Car_Short_Details>>>>>//
//         Padding(
//           padding: const EdgeInsets.only(left: 5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //<<<<<Car_Name>>>>>//
//               const Text(
//                 "Lamborgini",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: kText,
//                   letterSpacing: 1,
//                 ),
//               ),
//               kHeight05,

//               //<<<<<Price>>>>>//
//               Row(
//                 children: const [
//                   Text(
//                     "\$ 610/day",
//                     style: TextStyle(
//                       color: kWhite,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   Spacer(),
//                   Padding(
//                     padding: EdgeInsets.only(right: 12),
//                     child: Text(
//                       "\$62000",
//                       style: TextStyle(
//                         color: kGrey,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               kHeight05,

//               //<<<<<Price>>>>>//
//               const Text(
//                 "Available in: Idukki",
//                 style: TextStyle(
//                   color: kText,
//                   fontWeight: FontWeight.w300,
//                   fontSize: 16,
//                 ),
//               ),

//               //<<<<<Button>>>>>//
//               ElevatedButton(
//                 onPressed: () => Get.to(DetailsPage()),
//                 style: ElevatedButton.styleFrom(
//                   primary: kWhite,
//                   shape: RoundedRectangleBorder(borderRadius: kRadius30),
//                 ),
//                 child: const Text(
//                   "Book Now",
//                   style: TextStyle(
//                     color: kBlack,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
