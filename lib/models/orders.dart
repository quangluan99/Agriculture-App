import 'package:agriculture_app/models/class.dart';
import 'package:agriculture_app/models/product.dart';
import 'package:agriculture_app/utils/order.dart';

List<Order> orders = [
  Order(
      id: '401afsg',
      products: agroProducts.reversed.take(3).toList(),
      orderingDate: DateTime.utc(2024, 5, 12),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.processing),
  Order(
      id: '122fsg',
      products: agroProducts.reversed.take(1).toList(),
      orderingDate: DateTime.utc(2024, 8, 4),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.delivered),
  Order(
      id: '111aua',
      products: agroProducts.reversed.take(3).toList(),
      orderingDate: DateTime.utc(2024, 7, 6),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.processing),
  Order(
      id: '222aass',
      products: agroProducts.reversed.take(2).toList(),
      orderingDate: DateTime.utc(2024, 1, 3),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.processing),
  Order(
      id: '333ndbd',
      products: agroProducts.reversed.take(1).toList(),
      orderingDate: DateTime.utc(2024, 4, 5),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.delivered),
  Order(
      id: '77asbn',
      products: agroProducts.reversed.take(3).toList(),
      orderingDate: DateTime.utc(2024, 5, 12),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.picking),
  Order(
      id: '999sdd',
      products: agroProducts.reversed.take(4).toList(),
      orderingDate: DateTime.utc(2024, 8, 4),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.shipping),
  Order(
      id: '555dssad',
      products: agroProducts.reversed.take(3).toList(),
      orderingDate: DateTime.utc(2024, 7, 6),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.picking),
  Order(
      id: '866shb',
      products: agroProducts.reversed.take(2).toList(),
      orderingDate: DateTime.utc(2024, 1, 3),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.shipping),
  Order(
      id: '4441bbs',
      products: agroProducts.reversed.take(1).toList(),
      orderingDate: DateTime.utc(2024, 4, 5),
      deliveryDatel: DateTime.utc(2024, 2, 10),
      statucs: OrderStatus.delivered)
];
