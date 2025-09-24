import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_food_app/bloc/restaurant/restaurant_bloc.dart';
import 'package:flutter_food_app/repositories/restaurant_repository.dart';
import 'package:flutter_food_app/models/restaurant.dart';
import 'package:flutter_food_app/models/menu_item.dart';

class _MockRepo extends Mock implements RestaurantRepository {}

void main() {
  late RestaurantBloc bloc;
  late _MockRepo repo;

  setUp(() {
    repo = _MockRepo();
    bloc = RestaurantBloc(repo);
  });

  test('initial state is RestaurantInitial', () {
    expect(bloc.state, isA<RestaurantInitial>());
  });

  blocTest<RestaurantBloc, RestaurantState>(
    'emits [Loading, Loaded] when fetch succeeds',
    build: () {
      when(() => repo.fetchNearbyRestaurants()).thenAnswer((_) async => [
        Restaurant(id: 'r1', name: 'A', address: 'a', rating: 4.0, menu: [MenuItem(id: 'm1', name: 'X', description: 'd', price: 1.0)])
      ]);
      return bloc;
    },
    act: (b) => b.add(LoadRestaurants()),
    expect: () => [isA<RestaurantLoading>(), isA<RestaurantLoaded>()],
  );

  blocTest<RestaurantBloc, RestaurantState>(
    'emits [Loading, Error] when fetch throws',
    build: () {
      when(() => repo.fetchNearbyRestaurants()).thenThrow(RepositoryException('oops'));
      return bloc;
    },
    act: (b) => b.add(LoadRestaurants()),
    expect: () => [isA<RestaurantLoading>(), isA<RestaurantError>()],
  );
}
