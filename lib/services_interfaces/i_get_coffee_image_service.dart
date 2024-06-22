import 'package:coffee_app/models/coffee_photo.dart';

abstract class IGetCoffeeImageService {
  Future<CoffeePhoto> getCoffeePhoto();
}
