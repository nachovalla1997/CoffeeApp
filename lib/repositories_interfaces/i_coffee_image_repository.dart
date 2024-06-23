import 'dart:typed_data';

import 'package:coffee_app/models/coffee_photo.dart';

abstract class ICoffeeImageRepository {
  Future<CoffeePhoto> saveCoffeeImage(
      {required Uint8List coffeeImage, required String id});
  Future<void> deleteCoffeeImage({required String id});
}
