// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/models/booking/booking_model.dart';
import 'package:carmarket/models/car/car_model.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/services/payment/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'razor_credentials.dart' as razorCredentials;

class PaymentScreen extends StatefulWidget {
  PaymentScreen({required this.bookingModel, Key? key}) : super(key: key);

  BookingModel bookingModel;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

ProfileController profileController = Get.find<ProfileController>();

class _PaymentScreenState extends State<PaymentScreen> {
  carDetails? id;

  final _razorpay = Razorpay();

  //<<<<<Event_Listerners>>>>>//
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
        _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
        _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      },
    );
    super.initState();
  }

  //<<<<<Event_Handlers>>>>>//
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
    //On success we'll verify signature for authenticity//
    BookingModel bookingModel = BookingModel(
      id: widget.bookingModel.id,
      carName: widget.bookingModel.carName,
      // customer: widget.bookingModel.customer,
      tripStart: widget.bookingModel.tripStart,
      tripEnd: widget.bookingModel.tripEnd,
      location: widget.bookingModel.location,
      amount: widget.bookingModel.amount,
    );
    //
    PaymetService.razorpaySuccess(bookingModel);
    //
    // verifySignature(
    //   signature: response.signature,
    //   paymentId: response.paymentId,
    //   orderId: response.orderId,
    // );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print(response);
    Get.snackbar("Warning", response.message ?? '', backgroundColor: kWhite);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print(response);
    Get.snackbar("Message", response.walletName ?? '', backgroundColor: kWhite);
  }

  //<<<<<Create_Order>>>>>//
  void createOrder() async {
    String username = razorCredentials.keyId;
    String password = razorCredentials.keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    //Key id from razorpay setting//
    //Secret code from razorpay setting//
    //API required basic auth user and password//

    Map<String, dynamic> body = {
      "amount": (int.parse(widget.bookingModel.amount) * 100).toString(),
      "currency": 'INR',
      "receipt": "rcptid_11"
      //Amount in it's lowest currency unit//
      //INR it's paisa, Rs 1 = 100 ps//
    };

    var response = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Contet-Type": "application/json",
        "authorization": basicAuth,
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      //in response of create order you'll get order id and pass it to checkout//
      openGateway(jsonDecode(response.body)['id']);
    }
    print(response.body);
  }

  openGateway(String orderId) {
    String? email = GetLocalStorage.getUserIdAndToken('email');
    var options = {
      'key': razorCredentials.keyId, //keyId from razorpay//
      'amount': (int.parse(widget.bookingModel.amount) * 100).toString(),
      'name': widget.bookingModel.customer,
      'order_id': orderId, //Generate orderId using Orders API//
      'description': "${widget.bookingModel.carName} is Booked",
      'timeout': 60 * 5, //in seconds//5 minutes//
      'prefill': {
        'contact': '9123456789',
        'email': email,
      }
    };
    _razorpay.open(options); //Open payment gateway for checkout//
  }

  // verifySignature({
  //   String? signature,
  //   String? paymentId,
  //   String? orderId,
  // }) async {
  //   Map<String, dynamic> body = {
  //     'razorpay_signature': signature,
  //     'razorpay_payment_id': paymentId,
  //     'razorpay_order_id': orderId,
  //   };

  //   var parts = [];
  //   body.forEach(
  //     (key, value) {
  //       parts.add(
  //         '${Uri.encodeQueryComponent(key)}='
  //         '${Uri.encodeQueryComponent(value)}',
  //       );
  //     },
  //   );
  //   var formData = parts.join('&');
  //   var response = await http.post(
  //     Uri.http(
  //       "10.0.2.2",
  //       "razorpay_signature_verify.php",
  //     ),
  //     headers: {
  //       "Content_Type": "application/x-www-form-urlrencoded",
  //     },
  //     body: formData,
  //   );
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     Get.snackbar("Success", response.body);
  //   }
  // }

  @override
  void dispose() {
    // Removes all listeners
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        createOrder();
      },
      style: ElevatedButton.styleFrom(
        primary: kWhite,
        shape: RoundedRectangleBorder(borderRadius: kRadius30),
        fixedSize: Size(size.width * .9, 50),
      ),
      child: const Text(
        "Pay",
        style: TextStyle(
          color: kBlack,
          fontSize: 20,
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
