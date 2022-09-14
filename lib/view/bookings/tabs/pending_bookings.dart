import 'package:carmarket/view/bookings/widgets/booking_details_card.dart';
import 'package:flutter/material.dart';

class PendingBookings extends StatelessWidget {
  const PendingBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: BookingDetailsCard(size: size),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
