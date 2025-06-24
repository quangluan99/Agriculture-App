import 'package:agriculture_app/pages/cart_page.dart';
import 'package:agriculture_app/pages/explore_page.dart';
import 'package:agriculture_app/pages/profile_page.dart';
import 'package:agriculture_app/pages/services_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List pages = <Widget>[
    const ExplorePage(),
    const ServicesPage(),
    const CartPage(),
    const ProfileScreen()
  ];
  int curentIndex = 0;

  void onTap(int cur) {
    setState(() {
      curentIndex = cur;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello Bui Luan 👏',
              style: TextStyle(fontSize: 15.0),
            ),
            Text('Enjoy our service', style: textTheme.bodySmall),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: Colors.lightGreen.shade200),
                onPressed: () {},
                icon: badges.Badge(
                  badgeContent: Text(
                    '3',
                    style: textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                  badgeStyle: const badges.BadgeStyle(badgeColor: Colors.green),
                  position: badges.BadgePosition.topEnd(top: -15.0, end: -12.0),
                  child: const Icon(IconlyBroken.notification),
                )),
          )
        ],
      ),
      drawer: const Drawer(),
      body: pages.elementAt(curentIndex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: curentIndex,
          selectedFontSize: 16.0,
          selectedItemColor: Colors.red,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  IconlyBold.home,
                  size: 30,
                ),
                icon: Icon(IconlyLight.home),
                label: 'home'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  IconlyBold.call,
                  size: 30,
                ),
                icon: Icon(IconlyLight.call),
                label: 'call'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  IconlyBold.buy,
                  size: 30,
                ),
                icon: Icon(IconlyLight.buy),
                label: 'buy'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  IconlyBold.profile,
                  size: 30,
                ),
                icon: Icon(IconlyLight.profile),
                label: 'profile'),
          ]),
    );
  }
}
