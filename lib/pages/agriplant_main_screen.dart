import 'package:agriculture_app/pages/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'agriplant_home_screen.dart';

class Agriplantmainscreen extends StatefulWidget {
  const Agriplantmainscreen({super.key});

  @override
  State<Agriplantmainscreen> createState() {
    return _AgriplantmainscreenState();
  }
}

class _AgriplantmainscreenState extends State<Agriplantmainscreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const AgriplantHomeScreen(),
    const ServiceScreen(),
    const Scaffold(),
    const Scaffold()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(IconlyBold.home),
              label: 'Home',
              activeIcon: Icon(IconlyLight.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Services',
              activeIcon: Icon(Icons.store)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
              activeIcon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              activeIcon: Icon(Icons.person)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
