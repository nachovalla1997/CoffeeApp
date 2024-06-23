import 'package:bloc/bloc.dart';
import 'package:coffee_app/models/coffee_image.dart';
import 'package:coffee_app/repositories_interfaces/i_coffee_image_repository.dart';
import 'package:coffee_app/repositories_interfaces/i_favorite_coffee_image_repository.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:equatable/equatable.dart';

part 'favorite_coffee_state.dart';

class FavoriteCoffeeCubit extends Cubit<FavoriteCoffeeState> {
  final ICoffeeImageRepository _coffeeImageRepository;
  final IFavoriteCoffeeImageRepository _favoriteCoffeeImageRepository;

  FavoriteCoffeeCubit({
    required ICoffeeImageRepository coffeeImageRepository,
    required IFavoriteCoffeeImageRepository favoriteCoffeeImageRepository,
  })  : _coffeeImageRepository = coffeeImageRepository,
        _favoriteCoffeeImageRepository = favoriteCoffeeImageRepository,
        super(FavoriteCoffeeState.initial());

  Future getFavoriteImages() async {
    emit(state.copyWith(status: GetFavoriteImagesStatus.loading));
    try {
      final favoriteImagesIds =
          await _favoriteCoffeeImageRepository.getFavoriteCoffeeImages();
      final favoriteImages =
          await _coffeeImageRepository.getCoffeeImages(ids: favoriteImagesIds);
      emit(state.copyWith(
        status: GetFavoriteImagesStatus.loaded,
        favoriteImages: favoriteImages,
      ));
    } catch (e) {
      emit(state.copyWith(status: GetFavoriteImagesStatus.error));
    }
  }
}
