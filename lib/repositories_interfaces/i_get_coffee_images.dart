import 'package:coffee_app/models/coffee_photo.dart';

abstract class IGetCoffeeImages {
  Future<CoffeePhoto> getCoffeePhoto();
}
