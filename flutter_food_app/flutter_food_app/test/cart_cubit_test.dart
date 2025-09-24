import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_food_app/bloc/cart/cart_cubit.dart';
import 'package:flutter_food_app/models/menu_item.dart';

void main() {
  late CartCubit cubit;

  setUp(() {
    cubit = CartCubit();
  });

  test('initial cart is empty', () {
    expect(cubit.state.items, isEmpty);
    expect(cubit.state.total, 0);
  });

  test('add item increases total and items', () {
    final it = MenuItem(id: 'm1', name: 'X', description: 'd', price: 2.5);
    cubit.add(it);
    expect(cubit.state.items.length, 1);
    expect(cubit.state.total, 2.5);
  });

  test('remove item decreases items', () {
    final it = MenuItem(id: 'm1', name: 'X', description: 'd', price: 2.5);
    cubit.add(it);
    cubit.remove(it);
    expect(cubit.state.items, isEmpty);
  });
}
