part of 'restaurant_bloc.dart';

abstract class RestaurantEvent {}

class LoadRestaurants extends RestaurantEvent {}
class RefreshRestaurants extends RestaurantEvent {}
