import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositories/restaurant_repository_impl.dart';
import 'repositories/restaurant_repository.dart';
import 'bloc/restaurant/restaurant_bloc.dart';
import 'bloc/cart/cart_cubit.dart';
import 'ui/screens/home_screen.dart';

void main() {
  final RestaurantRepository restaurantRepository = RestaurantRepositoryImpl();
  runApp(MyApp(restaurantRepository: restaurantRepository));
}

class MyApp extends StatelessWidget {
  final RestaurantRepository restaurantRepository;
  const MyApp({required this.restaurantRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RestaurantBloc(restaurantRepository)..add(LoadRestaurants()),
        ),
        BlocProvider(
          create: (_) => CartCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'FoodFlow',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
