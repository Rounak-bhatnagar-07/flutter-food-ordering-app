import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/checkout/checkout_bloc.dart';
import '../../models/menu_item.dart';
import 'confirmation_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final List<MenuItem> items;
  const CheckoutScreen({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: BlocListener<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            // clear cart
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ConfirmationScreen(order: state.order)));
          } else if (state is CheckoutFailed) {
            final snack = SnackBar(content: Text('Checkout failed: ${state.message}'));
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, idx) {
                    final it = items[idx];
                    return ListTile(
                      title: Text(it.name),
                      subtitle: Text('₹${it.price.toStringAsFixed(2)}'),
                    );
                  },
                ),
              ),
              ElevatedButton(
                child: const Text('Confirm Order'),
                onPressed: () => context.read<CheckoutBloc>().add(StartCheckout(items)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
