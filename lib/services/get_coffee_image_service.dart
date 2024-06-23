import 'dart:typed_data';

import 'package:coffee_app/services/adapter/get_coffee_image_adapter.dart';
import 'package:coffee_app/services/api/get_coffee_image_api.dart';
import 'package:coffee_app/services_interfaces/i_get_coffee_image_service.dart';

class GetCoffeeImageService implements IGetCoffeeImageService {
  final GetCoffeeImageAPI _getCoffeeImagesAPI = GetCoffeeImageAPI();

  @override
  Future<Uint8List> getCoffeeImage() async {
    final coffeeImageFromAPI = await _getCoffeeImagesAPI.getCoffeeImage();
    return GetCoffeeImageAdapter.convertToCoffeeImage(coffeeImageFromAPI);
  }
}
