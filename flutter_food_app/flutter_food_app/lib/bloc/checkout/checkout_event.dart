part of 'checkout_bloc.dart';
import '../../models/menu_item.dart';

abstract class CheckoutEvent {}

class StartCheckout extends CheckoutEvent {
  final List<MenuItem> items;
  StartCheckout(this.items);
}
