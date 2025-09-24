import '../models/restaurant.dart';

abstract class RestaurantRepository {
  /// Fetch list of nearby restaurants. May throw RepositoryException.
  Future<List<Restaurant>> fetchNearbyRestaurants();
}

class RepositoryException implements Exception {
  final String message;
  RepositoryException(this.message);
  @override
  String toString() => 'RepositoryException: $message';
}
