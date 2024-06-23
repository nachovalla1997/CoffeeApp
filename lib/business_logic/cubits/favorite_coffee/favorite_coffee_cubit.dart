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

  List<CoffeeImage> _favoriteImagesCache = [];

  FavoriteCoffeeCubit({
    required ICoffeeImageRepository coffeeImageRepository,
    required IFavoriteCoffeeImageRepository favoriteCoffeeImageRepository,
  })  : _coffeeImageRepository = coffeeImageRepository,
        _favoriteCoffeeImageRepository = favoriteCoffeeImageRepository,
        super(FavoriteCoffeeState.initial());

  Future<void> getFavoriteImages() async {
    emit(state.copyWith(status: GetFavoriteImagesStatus.loading));

    if (_favoriteImagesCache.isNotEmpty) {
      emit(state.copyWith(
        status: GetFavoriteImagesStatus.loaded,
        favoriteImages: _favoriteImagesCache,
      ));
    } else {
      await _fetchFavoriteImages();
    }
  }

  Future<void> _fetchFavoriteImages() async {
    try {
      final favoriteImagesIds =
          await _favoriteCoffeeImageRepository.getFavoriteCoffeeImages();
      final favoriteImages =
          await _coffeeImageRepository.getCoffeeImages(ids: favoriteImagesIds);

      _favoriteImagesCache = favoriteImages;

      emit(state.copyWith(
        status: GetFavoriteImagesStatus.loaded,
        favoriteImages: favoriteImages,
      ));
    } catch (e) {
      emit(state.copyWith(status: GetFavoriteImagesStatus.error));
    }
  }

  Future<void> addCoffeeImageToFavorites(
      {required CoffeeImage currentCoffeeImage}) async {
    emit(state.copyWith(status: GetFavoriteImagesStatus.loading));
    try {
      await _favoriteCoffeeImageRepository.saveFavoriteCoffeeImage(
          id: currentCoffeeImage.id);
      _favoriteImagesCache.add(currentCoffeeImage);
      emit(state.copyWith(
        status: GetFavoriteImagesStatus.loaded,
        favoriteImages: _favoriteImagesCache,
      ));
    } catch (e) {
      emit(state.copyWith(status: GetFavoriteImagesStatus.error));
    }
  }
}
