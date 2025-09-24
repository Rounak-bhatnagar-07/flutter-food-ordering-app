import 'menu_item.dart';

class Restaurant {
  final String id;
  final String name;
  final String address;
  final double rating;
  final List<MenuItem> menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.menu,
  });
}
