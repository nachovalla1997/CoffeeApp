import 'dart:io';

import 'package:coffee_app/models/coffee_photo.dart';

class GetCoffeeImagesAdapter {
  static CoffeePhoto convertToCoffeePhoto(File coffeeImage) {
    return CoffeePhoto(
      photo: coffeeImage,
    );
  }
}
