import 'package:carmarket/controllers/profile_controller.dart';
import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/profile/profile_model.dart';

class Inbox extends StatelessWidget {
  Inbox({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());
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
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                //<<<<<Welcome>>>>>//
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: kGrey,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/564x/1d/3e/b9/1d3eb9f70bb9768090fc31e15a261fd4.jpg"),
                      ),
                    ),
                    kWidth05,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: 10,
                          width: size.width * .72,
                          decoration: const BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Obx(
                            () {
                              ProfileModel? userData =
                                  profileController.profileModel.value;
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  "Hi ${userData!.name!.capitalize!},\nI am Jane . \nYour Personal Chat Assistant.",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        kHeight05,
                        Container(
                          width: size.width * .6,
                          decoration: const BoxDecoration(
                            color: kGrey,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              "What's your problem?",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        kHeight20,
                      ],
                    ),
                  ],
                ),

                //<<<<<Questions_1>>>>>//
                BotQuestion(
                  size: size,
                  question: "If you have a personal complaint.",
                  answer:
                      "If You Have A Personal Complaint or You Want To Say Anything To Us Just Mail us in roadsterofficialpvt@",
                ),
                kHeight20,

                //<<<<<Questions_2>>>>>//
                BotQuestion(
                  size: size,
                  question: "How Can I Check My Booking History?",
                  answer:
                      "When You Completed Your Booking You Can Go Back To Your HomePage There You Can See A Three Dots On The Right Side Click. After That Click On The Booking History Option There You Can See Current Booking Booking History Etc..\nThank You",
                ),
                kHeight20,

                //<<<<<Questions_2>>>>>//
                BotQuestion(
                  size: size,
                  question: "How Can I Book A Car?",
                  answer:
                      "First login to your Account If You Have One , Next Select Your car , Click Book Now Then You Will Redirect To the Cars Page,There You Can Schedule The Date , After Scheduling Press Book Now Then You Will Redirect to Payment Page There You Can Pay Your Amount After That YOu will Get A Mail",
                ),
                kHeight20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BotQuestion extends StatelessWidget {
  BotQuestion({
    Key? key,
    required this.size,
    required this.question,
    required this.answer,
  }) : super(key: key);

  final Size size;
  String question;
  String answer;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: kGrey,
          child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
                "https://i.pinimg.com/564x/1d/3e/b9/1d3eb9f70bb9768090fc31e15a261fd4.jpg"),
          ),
        ),
        kWidth05,
        Container(
          width: size.width * .65,
          decoration: const BoxDecoration(
            color: kGrey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ExpansionTile(
            title: Text(
              question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
