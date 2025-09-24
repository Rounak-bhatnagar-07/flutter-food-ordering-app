import 'package:flutter/material.dart';
import '../../models/order.dart';

class ConfirmationScreen extends StatelessWidget {
  final Order order;
  const ConfirmationScreen({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Confirmed')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order.orderId}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Items:', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ...order.items.map((e) => Text('- ${e.name} (₹${e.price.toStringAsFixed(2)})')),
            const SizedBox(height: 12),
            Text('Total: ₹${order.total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Center(child: ElevatedButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst), child: const Text('Back to Home'))),
          ],
        ),
      ),
    );
  }
}
