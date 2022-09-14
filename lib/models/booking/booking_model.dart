class BookingModel {
  String carName;
  String? customer;
  String tripStart;
  String tripEnd;
  String location;
  String amount;
  String? id;
  BookingModel({
    required this.carName,
    this.customer,
    required this.tripStart,
    required this.tripEnd,
    required this.location,
    required this.amount,
    this.id,
  });
}
