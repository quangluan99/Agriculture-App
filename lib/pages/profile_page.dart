import 'package:agriculture_app/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/girls.png',
                ),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 2.5),
            ),
          ),
          const Text('Nguyen Xuan Ngo'),
          Text(
            'XuanNgo02@gmail.com',
            style: textTheme.bodySmall!.copyWith(color: Colors.grey.shade500),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildFilledButton(
                    textTheme.bodyLarge!, IconlyLight.bag, 'My orders',() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage(),));
                      
                    },),
                buildFilledButton(
                    textTheme.bodyLarge!, IconlyLight.activity, 'About Us',() {
                      
                    },),
                buildFilledButton(
                    textTheme.bodyLarge!, IconlyLight.logout, 'Log out',() {
                      
                    },)
              ],
            ),
          )
        ],
      ),
    );
  }

  FilledButton buildFilledButton(
      TextStyle textTheme, IconData iCon, String label, void Function() onpres) {
    return FilledButton.tonalIcon(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      onPressed: onpres,
      icon: Icon(
        iCon,
        size: 30,
      ),
      label: Text(
        label,
        style: textTheme,
      ),
    );
  }
}
