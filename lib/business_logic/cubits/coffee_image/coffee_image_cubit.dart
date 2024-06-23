import 'package:bloc/bloc.dart';
import 'package:coffee_app/models/coffee_image.dart';
import 'package:coffee_app/repositories_interfaces/i_coffee_image_repository.dart';
import 'package:coffee_app/repositories_interfaces/i_favorite_coffee_image_repository.dart';
import 'package:coffee_app/services_interfaces/i_get_coffee_image_service.dart';
import 'package:coffee_app/services_interfaces/i_get_uid_service.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:equatable/equatable.dart';

part 'coffee_image_state.dart';

class CoffeeImageCubit extends Cubit<GetCoffeeImageState> {
  final IGetCoffeeImageService _getCoffeeImagesService;
  final IGetUidService _getUidService;
  final ICoffeeImageRepository _coffeeImageRepository;
  final IFavoriteCoffeeImageRepository _favoriteCoffeeImageRepository;

  CoffeeImageCubit({
    required IGetCoffeeImageService getCoffeeImagesService,
    required IGetUidService getUidService,
    required ICoffeeImageRepository coffeeImageRepository,
    required IFavoriteCoffeeImageRepository favoriteCoffeeImageRepository,
  })  : _getCoffeeImagesService = getCoffeeImagesService,
        _getUidService = getUidService,
        _coffeeImageRepository = coffeeImageRepository,
        _favoriteCoffeeImageRepository = favoriteCoffeeImageRepository,
        super(GetCoffeeImageState.initial());

  Future getCoffeeImage() async {
    emit(state.copyWith(status: GetImageStatus.loading));
    await _fetchAndSaveCoffeeImage();
  }

  Future _fetchAndSaveCoffeeImage() async {
    try {
      final uidImage = _getUidService.getUid();
      final coffeeImageInBytes = await _getCoffeeImagesService.getCoffeeImage();
      final coffeeImageSaved = await _coffeeImageRepository.saveCoffeeImage(
          id: uidImage, coffeeImage: coffeeImageInBytes);

      emit(state.copyWith(
        status: GetImageStatus.loaded,
        coffeeImage: coffeeImageSaved,
      ));
    } catch (e) {
      emit(state.copyWith(status: GetImageStatus.error));
    }
  }

  Future nextCoffeeImage({required String currentImageId}) async {
    emit(state.copyWith(status: GetImageStatus.loading));
    try {
      await _coffeeImageRepository.deleteCoffeeImage(id: currentImageId);
    } catch (e) {
      emit(state.copyWith(status: GetImageStatus.error));
      return;
    }

    await _fetchAndSaveCoffeeImage();
  }
}
