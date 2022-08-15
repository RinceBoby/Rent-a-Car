import 'package:carmarket/core/constants/colors.dart';
import 'package:carmarket/view/chat/chats.dart';
import 'package:carmarket/view/home/screen_home.dart';
import 'package:carmarket/view/home/screen_home.dart';
import 'package:carmarket/view/orders/screen_orders.dart';
import 'package:carmarket/view/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentSelectedIndex = 0;

  final _pages = [
    const ScreenHome(),
    const Orders(),
    const Inbox(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentSelectedIndex,
        onTap: (newIndex) => setState(() => _currentSelectedIndex = newIndex),
        selectedItemColor: kWhite,
        unselectedItemColor: kGrey,
        items: [
          //<<<Home>>>//
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.house),
            activeIcon: const Icon(CupertinoIcons.house_alt_fill),
            title: const Text("Home"),
          ),

          //<<<Orders>>>//
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.cart),
            activeIcon: const Icon(CupertinoIcons.cart_fill),
            title: const Text("Orders"),
          ),

          //<<<Inbox>>>//
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.chat_bubble_text),
            activeIcon: const Icon(CupertinoIcons.chat_bubble_text_fill),
            title: const Text("Inbox"),
          ),

          //<<<Profile>>>//
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.person_alt_circle),
            activeIcon: const Icon(CupertinoIcons.person_alt_circle_fill),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}
