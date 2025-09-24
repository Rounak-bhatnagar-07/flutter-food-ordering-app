import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/checkout/checkout_bloc.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CartCubit, dynamic>(
                builder: (context, state) {
                  final items = state.items as List;
                  if (items.isEmpty) {
                    return const Center(child: Text('Your cart is empty.'));
                  }
                  return ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, idx) {
                      final item = items[idx];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('₹${item.price.toStringAsFixed(2)}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => context.read<CartCubit>().remove(item),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            BlocBuilder<CartCubit, dynamic>(
              builder: (context, state) {
                final total = (state as dynamic).total as double;
                return Column(
                  children: [
                    Text('Total: ₹${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      child: const Text('Proceed to Checkout'),
                      onPressed: () {
                        final items = (context.read<CartCubit>().state as dynamic).items as List;
                        Navigator.push(context, MaterialPageRoute(builder: (_) => BlocProvider(
                          create: (_) => CheckoutBloc(),
                          child: CheckoutScreen(items: List.from(items)),
                        )));
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
