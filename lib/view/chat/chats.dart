import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/chat/chat_screen.dart';
import 'package:carmarket/view/widgets/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              fontWeight: FontWeight.bold,
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
            children: [
              //
              //<<<<<Chat_List>>>>>//
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => ChatList(size),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  //
  //
  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Methods>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
  //
  //
  //
  Padding ChatList(Size size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () => Get.to(const ChatScreen()),
        child: Container(
          decoration: BoxDecoration(
            color: fieldColor,
            borderRadius: kRadius10,
          ),
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                //
                //<<<<<Car_Image>>>>>//
                const CircleAvatar(
                  backgroundColor: kText,
                  radius: 30,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/Urus.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                kWidth15,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight10,

                      //<<<<<Car_Name>>>>>//
                      Row(
                        children: const [
                          Text(
                            "Lamborghini Urus",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                            ),
                          ),
                          Spacer(),

                          //<<<<<Time>>>>>//
                          Text(
                            "11:11 am",
                            style: TextStyle(
                              color: kText,
                            ),
                          ),
                        ],
                      ),
                      kHeight10,

                      //<<<<<Message>>>>>//
                      SizedBox(
                        width: size.width * .7,
                        child: const Text(
                          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kText,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
