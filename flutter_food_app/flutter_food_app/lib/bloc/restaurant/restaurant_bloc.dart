import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/restaurant.dart';
import '../../repositories/restaurant_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository repository;
  RestaurantBloc(this.repository) : super(RestaurantInitial()) {
    on<LoadRestaurants>(_onLoad);
    on<RefreshRestaurants>(_onRefresh);
  }

  Future<void> _onLoad(LoadRestaurants event, Emitter<RestaurantState> emit) async {
    emit(RestaurantLoading());
    try {
      final restaurants = await repository.fetchNearbyRestaurants();
      emit(RestaurantLoaded(restaurants));
    } catch (e) {
      emit(RestaurantError(e.toString()));
    }
  }

  Future<void> _onRefresh(RefreshRestaurants event, Emitter<RestaurantState> emit) async {
    try {
      final restaurants = await repository.fetchNearbyRestaurants();
      emit(RestaurantLoaded(restaurants));
    } catch (e) {
      emit(RestaurantError(e.toString()));
    }
  }
}
