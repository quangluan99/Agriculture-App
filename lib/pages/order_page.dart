import 'package:agriculture_app/models/orders.dart';
import 'package:agriculture_app/utils/order.dart';
import 'package:agriculture_app/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final tabs = OrderStatus.values.map(
    (e) {
      return e.name;
    },
  ).toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My orders'),
          centerTitle: true,
          bottom: TabBar(
              tabs: List.generate(
            tabs.length,
            (index) {
              return Tab(
                text: tabs[index],
              );
            },
          )),
        ),
        body: TabBarView(
            children: List.generate(
          tabs.length,
          (index) {
            final filetredOrders = orders
                .where(
                  (element) => element.statucs == OrderStatus.values[index],
                )
                .toList();

            return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                itemBuilder: (context, index) {
                  final order = filetredOrders[index];

                  return OrderItem(
                    orders: order,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: filetredOrders.length);
          },
        )),
      ),
    );
  }
}
