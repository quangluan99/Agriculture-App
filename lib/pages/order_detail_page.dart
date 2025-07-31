import 'package:agriculture_app/models/class.dart';
import 'package:agriculture_app/utils/enums/extension/date.dart';
import 'package:agriculture_app/utils/order.dart';
import 'package:agriculture_app/widgets/order_item.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;
  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    const steps = OrderStatus.values;
    final activeStep = steps.indexOf(order.statucs);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          EasyStepper(
              activeStepTextColor: Colors.black87,
              finishedStepTextColor: Theme.of(context).colorScheme.primary,
              lineStyle: LineStyle(
                  defaultLineColor: Colors.grey.shade300,
                  lineLength:
                      (MediaQuery.of(context).size.width * 0.5) / steps.length),
              activeStep:
                  activeStep + 1 == steps.length ? activeStep + 1 : activeStep,
              stepRadius: 14,
              steps: List.generate(
                steps.length,
                (index) {
                  return EasyStep(
                      topTitle: true,
                      finishIcon: const Icon(
                        Icons.done,
                      ),
                      title: steps[index].name,
                      icon: const Icon(
                        Icons.local_shipping,
                      ));
                },
              )),
          const SizedBox(
            height: 18,
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.grey.shade200,
                  width: 2,
                )),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order ${order.id}"),
                      Chip(
                        iconTheme: const IconThemeData(size: 23),
                        side: BorderSide.none,
                        backgroundColor: Colors.green.shade400,
                        label: Text(steps[activeStep].name),
                        avatar: const Icon(
                          Icons.fire_truck,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Delivery Estimate'),
                      Text(
                        order.deliveryDatel.formDate,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  const Text(
                    'Bui Luan BT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Row(
                    children: [
                      Icon(IconlyLight.home),
                      Expanded(
                        child: Text(
                            '  Ngo 46 - 129 Cau Giay - Trung Kinh \n  Quan Cau Giay, Thanh Pho Ha Noi'),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        IconlyLight.call,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('233 5447 51048'),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Payment Method',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Spacer(),
                      Text(
                        'Credit Card **0354',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.grey.shade200,
                  width: 2,
                )),
            child: const Padding(
              padding: EdgeInsets.all(10),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OrderItem(
            orders: order,
            visibleProducts: 1,
          )
        ],
      ),
    );
  }
}
