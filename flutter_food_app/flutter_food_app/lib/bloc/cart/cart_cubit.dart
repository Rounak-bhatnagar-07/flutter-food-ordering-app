import 'package:bloc/bloc.dart';
import '../../models/menu_item.dart';

class CartState {
  final List<MenuItem> items;
  CartState(this.items);

  double get total => items.fold(0.0, (p, e) => p + e.price);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void add(MenuItem item) {
    final newItems = List<MenuItem>.from(state.items)..add(item);
    emit(CartState(newItems));
  }

  void remove(MenuItem item) {
    final newItems = List<MenuItem>.from(state.items)..remove(item);
    emit(CartState(newItems));
  }

  void clear() => emit(CartState([]));
}
