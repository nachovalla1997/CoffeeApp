import 'package:coffee_app/models/coffee_photo.dart';

abstract class IGetCoffeeImagesService {
  Future<CoffeePhoto> getCoffeePhoto();
}
