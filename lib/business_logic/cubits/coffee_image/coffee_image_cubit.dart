import 'package:bloc/bloc.dart';
import 'package:coffee_app/models/coffee_photo.dart';
import 'package:coffee_app/repositories_interfaces/i_coffee_image_repository.dart';
import 'package:coffee_app/services_interfaces/i_get_coffee_image_service.dart';
import 'package:coffee_app/services_interfaces/i_get_uid_service.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:equatable/equatable.dart';

part 'coffee_image_state.dart';

class CoffeeImageCubit extends Cubit<GetCoffeeImageState> {
  final IGetCoffeeImageService _getCoffeeImagesService;
  final IGetUidService _getUidService;
  final ICoffeeImageRepository _coffeeImageRepository;

  CoffeeImageCubit({
    required IGetCoffeeImageService getCoffeeImagesService,
    required IGetUidService getUidService,
    required ICoffeeImageRepository coffeeImageRepository,
  })  : _getCoffeeImagesService = getCoffeeImagesService,
        _getUidService = getUidService,
        _coffeeImageRepository = coffeeImageRepository,
        super(GetCoffeeImageState.initial());

  Future getCoffeePhoto() async {
    emit(state.copyWith(status: GetImagesStatus.loading));
    try {
      final uidPhoto = _getUidService.getUid();
      final coffeePhotoInBytes = await _getCoffeeImagesService.getCoffeePhoto();
      final coffeeImageSaved = await _coffeeImageRepository.saveCoffeeImage(
          id: uidPhoto, coffeeImage: coffeePhotoInBytes);

      emit(state.copyWith(
        status: GetImagesStatus.loaded,
        coffeePhoto: coffeeImageSaved,
      ));
    } catch (e) {
      emit(state.copyWith(status: GetImagesStatus.error));
    }
  }

  Future nextCoffeePhoto({required String currentPhotoId}) async {
    emit(state.copyWith(status: GetImagesStatus.loading));
    try {
      await _coffeeImageRepository.deleteCoffeeImage(id: currentPhotoId);
    } catch (e) {
      emit(state.copyWith(status: GetImagesStatus.error));
    }

    await getCoffeePhoto();
  }
}
