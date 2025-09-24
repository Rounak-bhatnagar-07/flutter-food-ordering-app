import 'dart:math';
import 'dart:async';
import '../models/restaurant.dart';
import '../models/menu_item.dart';
import 'restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  // Simulated network latency & failures
  final Random _rnd = Random();

  @override
  Future<List<Restaurant>> fetchNearbyRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 700));
    // Simulate random failure
    if (_rnd.nextInt(10) < 2) {
      throw RepositoryException('Failed to load restaurants (simulated network error).');
    }

    // Static demo data
    final menuA = [
      MenuItem(id: 'm1', name: 'Margherita Pizza', description: 'Tomato, mozzarella, basil', price: 8.5),
      MenuItem(id: 'm2', name: 'Pepperoni Pizza', description: 'Classic pepperoni', price: 9.5),
      MenuItem(id: 'm3', name: 'Tiramisu', description: 'Coffee-flavoured dessert', price: 4.0),
    ];
    final menuB = [
      MenuItem(id: 'm4', name: 'Veggie Burger', description: 'Patty with seasonal veggies', price: 7.0),
      MenuItem(id: 'm5', name: 'Fries', description: 'Crispy golden fries', price: 2.5),
      MenuItem(id: 'm6', name: 'Milkshake', description: 'Vanilla milkshake', price: 3.5),
    ];

    return [
      Restaurant(id: 'r1', name: 'Bella Napoli', address: '12 Olive St', rating: 4.6, menu: menuA),
      Restaurant(id: 'r2', name: 'Green Bite', address: '88 Garden Ave', rating: 4.2, menu: menuB),
    ];
  }
}
