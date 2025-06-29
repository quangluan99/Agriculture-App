import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    //Lấy tạm 4 item trong List
    final cartItems = agroProducts.take(4).toList();
    double totalPrice = cartItems
        .map(
          (e) => e.price,
        )
        .reduce(
          (value, element) => value + element,
        );

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      children: [
        ...List.generate(
          cartItems.length,
          (index) {
            return CartItem(product: cartItems[index]);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              'Total (${cartItems.length} items)',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
            const Spacer(),
            Text(
              '\$$totalPrice',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        FilledButton.icon(
          onPressed: () {},
          label: const Text('Procced to checkout'),
          icon: const Icon(IconlyBold.arrowRight),
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            backgroundColor: Colors.green.shade800,
          ),
        )
      ],
    );
  }
}
