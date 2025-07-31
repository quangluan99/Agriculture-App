import 'package:agriculture_app/models/class.dart';
import 'package:agriculture_app/widgets/order_product.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final Order orders;
  final int visibleProducts;
  const OrderItem({super.key, required this.orders, this.visibleProducts = 2});

  @override
  Widget build(BuildContext context) {
    final totalPrice = orders.products.fold(
      0.0,
      (sum, value) {
        return sum + value.price;
      },
    );
    final odProducts = orders.products.take(visibleProducts).toList();
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        side: const BorderSide(
          color: Colors.grey,
          width: 0.1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Order: ${orders.id}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text('(${orders.products.length} item)',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${totalPrice.toStringAsFixed(3)}',
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(
              odProducts.length,
              (index) {
                return OrderProduct(
                  product: odProducts[index],
                  order: orders,
                );
              },
            ),
            if (orders.products.length > 2)
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            itemCount: orders.products.length,
                            itemBuilder: (context, index) {
                              final product = orders.products[index];
                              return OrderProduct(
                                  order: orders, product: product);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.home),
                label: const Text('View All'),
              ),
          ],
        ),
      ),
    );
  }
}
