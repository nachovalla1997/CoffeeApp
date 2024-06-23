import 'package:bloc/bloc.dart';
import 'package:coffee_app/models/coffee_image.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:equatable/equatable.dart';

part 'favorite_coffee_state.dart';

class FavoriteCoffeeCubit extends Cubit<FavoriteCoffeeState> {
  FavoriteCoffeeCubit() : super(FavoriteCoffeeState.initial());
}
