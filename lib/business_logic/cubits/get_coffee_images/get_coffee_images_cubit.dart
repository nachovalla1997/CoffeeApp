import 'package:bloc/bloc.dart';
import 'package:coffee_app/models/coffee_photo.dart';
import 'package:coffee_app/services_interfaces/i_get_coffee_images_service.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:equatable/equatable.dart';

part 'get_coffee_images_state.dart';

class GetCoffeeImagesCubit extends Cubit<GetCoffeeImagesState> {
  final IGetCoffeeImagesService _getCoffeeImagesService;

  GetCoffeeImagesCubit({
    required IGetCoffeeImagesService getCoffeeImagesService,
  })  : _getCoffeeImagesService = getCoffeeImagesService,
        super(GetCoffeeImagesState.initial());

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
