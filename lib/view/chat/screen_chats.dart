import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
          automaticallyImplyLeading: false,
          leading: const Icon(
            CupertinoIcons.chat_bubble_text,
            color: kText,
            size: 30,
          ),
          title: const Text(
            "Chats",
            style: TextStyle(
              color: kText,
              fontSize: 26,
              // fontWeight: FontWeight.bold,
            ),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
