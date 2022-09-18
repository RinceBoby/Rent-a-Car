// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/models/booking/booking_model.dart';
import 'package:carmarket/models/local_storage/local_storage.dart';
import 'package:carmarket/services/payment/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'razor_credentials.dart' as razorCredentials;

class RazorPay extends StatefulWidget {
  RazorPay({required this.bookingModel, Key? key}) : super(key: key);

  BookingModel bookingModel;

  @override
  State<RazorPay> createState() => _RazorPayState();
}

ProfileController profileController = Get.put(ProfileController());

class _RazorPayState extends State<RazorPay> {
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

    print("Payment Success");
    //On success we'll verify signature for authenticity//
    BookingModel bookingDetails = BookingModel(
      id: widget.bookingModel.id,
      carName: widget.bookingModel.carName,
      tripStart: widget.bookingModel.tripStart,
      tripEnd: widget.bookingModel.tripEnd,
      amount: widget.bookingModel.amount,
    );
    print(bookingDetails);
    //
    PaymentService.razorpaySuccess(bookingDetails);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Errorod error");
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
    int price = (int.parse(widget.bookingModel.amount) * 100);
    Map<String, dynamic> body = {
      "amount": price.toString(),
      // num.parse((widget.bookingModel.amount) * 100),
      "currency": "INR",
      "receipt": "rcptid_11"
      //Amount in it's lowest currency unit//
      //INR it's paisa, Rs 1 = 100 ps//
    };

    var response = await http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), //https://api.razorpay.com/v1/orders
      headers: <String, String>{
        "Contet-Type": "application/json",
        'authorization': basicAuth,
      },
      body: body,
      // jsonEncode(body),
    );

    if (response.statusCode == 200) {
      //in response of create order you'll get order id and pass it to checkout//
      openGateway(jsonDecode(response.body)['id']);
    }
    print(response.body);
  }

  openGateway(String orderId) {
    String? userEmail = GetLocalStorage.getUserIdAndToken('email');
    int price = (int.parse(widget.bookingModel.amount) * 100);

    var options = {
      'key': razorCredentials.keyId, //keyId from razorpay//
      'amount': price.toString(),
      //num.parse((widget.bookingModel.amount) * 100),
      'name': widget.bookingModel.customer,
      'description': "${widget.bookingModel.carName} is Booked",
      'timeout': 60 * 5, //in seconds//5 minutes//
      'prefill': {
        'contact': '9895711946',
        'email': userEmail,
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    } //Open payment gateway for checkout//
  }

  // Removes all listeners
  @override
  void dispose() {
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
