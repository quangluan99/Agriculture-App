import 'package:agriculture_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Image.asset(
            'assets/images/onboarding.png',
            height: MediaQuery.of(context).size.height * 0.65,
          ),
          Text(
            'Welcome to Agriplant',
            style:
                TextTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
                'Get your agriculture products from the comfort of your home. You\'re just a few clicks away from your products '),
          ),
          FilledButton.tonalIcon(
              style: FilledButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: Colors.green.shade300),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
              label: Text(
                'Contune with Google',
                style: TextTheme.bodyLarge,
              ),
              icon: const Icon(IconlyLight.logout)),
        ]),
      )),
    );
  }
}
