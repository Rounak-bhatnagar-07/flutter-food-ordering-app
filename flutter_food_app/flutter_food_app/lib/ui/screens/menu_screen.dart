import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/restaurant.dart';
import '../../models/menu_item.dart';
import '../../bloc/cart/cart_cubit.dart';

class MenuScreen extends StatelessWidget {
  final Restaurant restaurant;
  const MenuScreen({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: restaurant.menu.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, idx) {
          final item = restaurant.menu[idx];
          return Card(
            child: ListTile(
              title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(item.description),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('₹${item.price.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    child: const Text('Add'),
                    onPressed: () => context.read<CartCubit>().add(item),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
