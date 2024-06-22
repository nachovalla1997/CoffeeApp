import 'package:bloc/bloc.dart';
import 'package:coffee_app/models/coffee_photo.dart';
import 'package:coffee_app/services_interfaces/i_get_coffee_image_service.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:equatable/equatable.dart';

part 'get_coffee_image_state.dart';

class GetCoffeeImageCubit extends Cubit<GetCoffeeImageState> {
  final IGetCoffeeImageService _getCoffeeImagesService;

  GetCoffeeImageCubit({
    required IGetCoffeeImageService getCoffeeImagesService,
  })  : _getCoffeeImagesService = getCoffeeImagesService,
        super(GetCoffeeImageState.initial());

  Future getCoffeePhoto() async {
    emit(state.copyWith(status: GetImagesStatus.loading));
    try {
      final coffeePhoto = await _getCoffeeImagesService.getCoffeePhoto();
      emit(state.copyWith(
        status: GetImagesStatus.loaded,
        coffeePhoto: coffeePhoto,
      ));
    } catch (e) {
      emit(state.copyWith(status: GetImagesStatus.error));
    }
  }
}
