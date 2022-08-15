import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: kText,
            ),
          ),
          title: const Text(
            "Car Name",
            style: TextStyle(fontSize: 26, color: kText),
          ),
          actions: const [
            Icon(
              CupertinoIcons.ellipsis_circle,
              color: kText,
              size: 32,
            ),
            kWidth10,
          ],
        ),
        body: Column(
          children: [
            kHeight10,
            Expanded(child: Container()),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Message..",
                  filled: true,
                  fillColor: fieldColor,
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
