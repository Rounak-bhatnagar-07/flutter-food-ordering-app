import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/order.dart';
import '../../models/menu_item.dart';
import 'dart:async';
part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(): super(CheckoutInitial()) {
    on<StartCheckout>(_onStart);
  }

  Future<void> _onStart(StartCheckout event, Emitter<CheckoutState> emit) async {
    emit(CheckoutProcessing());
    await Future.delayed(const Duration(seconds: 1)); // simulate processing
    // simulate a simple validation error
    if (event.items.isEmpty) {
      emit(const CheckoutFailed('Cart is empty.'));
      return;
    }
    try {
      final total = event.items.fold<double>(0, (p, e) => p + e.price);
      final order = Order(orderId: DateTime.now().millisecondsSinceEpoch.toString(), items: event.items, total: total);
      emit(CheckoutSuccess(order));
    } catch (e) {
      emit(CheckoutFailed(e.toString()));
    }
  }
}
