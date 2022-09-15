class BookingsModel {
  List<BookingData>? bookingData;

  BookingsModel({this.bookingData});

  BookingsModel.fromJson(Map<String, dynamic> json) {
    if (json['bookingData'] != null) {
      bookingData = <BookingData>[];
      json['bookingData'].forEach((v) {
        bookingData!.add(new BookingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (bookingData != null) {
      data['bookingData'] = bookingData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingData {
  String? sId;
  String? carId;
  String? userId;
  String? username;
  String? carname;
  bool? cancel;
  bool? complete;
  String? startDate;
  String? endDate;
  int? payedAmount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BookingData(
      {this.sId,
      this.carId,
      this.userId,
      this.username,
      this.carname,
      this.cancel,
      this.complete,
      this.startDate,
      this.endDate,
      this.payedAmount,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BookingData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carId = json['carId'];
    userId = json['userId'];
    username = json['username'];
    carname = json['carname'];
    cancel = json['cancel'];
    complete = json['complete'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    payedAmount = json['PayedAmount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['carId'] = carId;
    data['userId'] = userId;
    data['username'] = username;
    data['carname'] = carname;
    data['cancel'] = cancel;
    data['complete'] = complete;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['PayedAmount'] = payedAmount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
