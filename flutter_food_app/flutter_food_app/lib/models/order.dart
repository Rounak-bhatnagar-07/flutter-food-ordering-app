import 'menu_item.dart';

class Order {
  final String orderId;
  final List<MenuItem> items;
  final double total;

  Order({
    required this.orderId,
    required this.items,
    required this.total,
  });
}
