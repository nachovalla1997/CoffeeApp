import 'package:coffee_app/models/coffee_photo.dart';
import 'package:coffee_app/services/adapter/get_coffee_images_adapter.dart';
import 'package:coffee_app/services/api/get_coffee_images_api.dart';
import 'package:coffee_app/services_interfaces/i_get_coffee_images_service.dart';

class GetCoffeeImagesService implements IGetCoffeeImagesService {
  final GetCoffeeImagesAPI _getCoffeeImagesAPI = GetCoffeeImagesAPI();

  @override
  Future<CoffeePhoto> getCoffeePhoto() async {
    final coffeePhotoFromAPI = await _getCoffeeImagesAPI.getCoffeePhoto();
    return GetCoffeeImagesAdapter.convertToCoffeePhoto(coffeePhotoFromAPI);
  }
}
