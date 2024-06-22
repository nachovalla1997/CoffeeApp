import 'package:bloc/bloc.dart';
import 'package:coffee_app/models/coffee_photo.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:equatable/equatable.dart';

part 'get_coffee_images_state.dart';

class GetCoffeeImagesCubit extends Cubit<GetCoffeeImagesState> {
  GetCoffeeImagesCubit() : super(GetCoffeeImagesState.initial());

  void getCoffeePhoto() async {}
}
