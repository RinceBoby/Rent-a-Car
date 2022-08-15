import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/core/constants/dimensions.dart';
import 'package:carmarket/view/orders/order_successfull.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kTrans,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: kText,
            ),
          ),
          title: const Text(
            "Checkout",
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
              size: 30,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight15,
                const Text(
                  "Shipping Address",
                  style: TextStyle(
                    color: kText,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight20,

                //<<<<<Address_Tab>>>>>//
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: fieldColor,
                    borderRadius: kRadius15,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      kWidth10,
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: kWhite.withOpacity(.08),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: kText,
                          child: Icon(
                            CupertinoIcons.location_solid,
                            color: kBlack,
                            size: 30,
                          ),
                        ),
                      ),
                      kWidth10,
                      SizedBox(
                        width: size.width * .55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Home",
                              style: TextStyle(
                                color: kWhite,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Address",
                              style: TextStyle(color: kText),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.edit_location_alt_rounded,
                          color: kText,
                          size: 30,
                        ),
                      ),
                      kWidth10,
                    ],
                  ),
                ),
                kHeight30,

                //<<<<<Car_Details>>>>>//
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: fieldColor,
                    borderRadius: kRadius15,
                  ),
                  child: Row(
                    children: [
                      kWidth30,
                      Container(
                        height: 90,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: kRadius15,
                          color: kWhite.withOpacity(.08),
                        ),
                        child: Image.asset("assets/Urus.png"),
                      ),
                      kWidth20,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Lamborghini Urus",
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            "₹ 24 L",
                            style: TextStyle(
                              color: kText,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                kHeight30,

                //<<<<<Amount>>>>>//
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: fieldColor,
                    borderRadius: kRadius15,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * .4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Amount",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                ),
                              ),
                              kHeight10,
                              Text(
                                "Shipping",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                ),
                              ),
                              kHeight10,
                              Text(
                                "Tax",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                color: kWhite,
                              ),
                              kHeight10,
                              Text(
                                "Total",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Spacer(),
                        SizedBox(
                          width: size.width * .4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                "Amount",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                ),
                              ),
                              kHeight10,
                              Text(
                                "Shipping",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                ),
                              ),
                              kHeight10,
                              Text(
                                "Tax",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                color: kWhite,
                              ),
                              kHeight10,
                              Text(
                                "Total",
                                style: TextStyle(
                                  color: kText,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                kHeight75,

                //<<<<<Payment_Button>>>>>//
                Center(
                  child: ElevatedButton(
                    onPressed: () => Get.to(const OrderSuccessful()),
                    style: ElevatedButton.styleFrom(
                      primary: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: kRadius30,
                      ),
                      fixedSize: Size(size.width * .9, 50),
                    ),
                    child: const Text(
                      "Continue to Payment",
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                kHeight15
              ],
            ),
          ),
        ),
      ),
    );
  }
}
