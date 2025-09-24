import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/restaurant/restaurant_bloc.dart';
import '../../models/restaurant.dart';
import 'menu_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodFlow'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<RestaurantBloc>().add(RefreshRestaurants()),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
          ),
        ],
      ),
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is RestaurantLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RestaurantLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: state.restaurants.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, idx) {
                final r = state.restaurants[idx];
                return _RestaurantTile(restaurant: r);
              },
            );
          } else if (state is RestaurantError) {
            return _ErrorRetry(message: state.message);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class _RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;
  const _RestaurantTile({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MenuScreen(restaurant: restaurant))),
        title: Text(restaurant.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${restaurant.address} • ⭐ ${restaurant.rating}'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  final String message;
  const _ErrorRetry({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Error: $message', textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              onPressed: () => context.read<RestaurantBloc>().add(LoadRestaurants()),
            ),
          ],
        ),
      ),
    );
  }
}
