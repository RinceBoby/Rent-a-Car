import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/bookings/tabs/cancelled_bookings.dart';
import 'package:carmarket/view/bookings/tabs/pending_bookings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(
            CupertinoIcons.car_detailed,
            color: kText,
            size: 30,
          ),
          title: const Text(
            "Bookings",
            style: TextStyle(
              color: kText,
              fontSize: 26,
              // fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Icon(
              CupertinoIcons.ellipsis_circle,
              size: 30,
              color: kText,
            ),
            kWidth10,
          ],
          bottom: TabBar(
            indicatorColor: kText,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            labelStyle: GoogleFonts.philosopher(
              color: kText,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: "Pending"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            //
            //<<<<<Pending>>>>>//
            PendingBookings(),

            // Center(
            //   child: Text(
            //     "No Pending Trips",
            //     style: TextStyle(
            //       color: kText,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),

            //<<<<<Completed>>>>>//
            // CompletedBookings(),

            Center(
              child: Text(
                "No Completed Trips",
                style: TextStyle(
                  color: kText,
                  fontSize: 20,
                ),
              ),
            ),

            //<<<<<Cancelled>>>>>//
            CancelledBooking(),

            // Center(
            //   child: Text(
            //     "No Cancelled Trips",
            //     style: TextStyle(
            //       color: kText,
            //       fontSize: 20,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
