import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/utils/order.dart';

class Order {
  final String id;
  final List<AgroProduct> products;
  final DateTime orderingDate;
  final DateTime deliveryDatel;
  final OrderStatus statucs;
  Order(
      {required this.id,
      required this.products,
      required this.orderingDate,
      required this.deliveryDatel,
      required this.statucs});
}
