part of 'checkout_bloc.dart';
import '../../models/order.dart';

abstract class CheckoutState {}
class CheckoutInitial extends CheckoutState {}
class CheckoutProcessing extends CheckoutState {}
class CheckoutSuccess extends CheckoutState {
  final Order order;
  CheckoutSuccess(this.order);
}
class CheckoutFailed extends CheckoutState {
  final String message;
  const CheckoutFailed(this.message);
}
