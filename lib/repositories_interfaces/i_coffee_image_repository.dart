import 'dart:typed_data';

import 'package:coffee_app/models/coffee_image.dart';

abstract class ICoffeeImageRepository {
  Future<CoffeeImage> saveCoffeeImage(
      {required Uint8List coffeeImage, required String id});
  Future<void> deleteCoffeeImage({required String id});
  Future<List<CoffeeImage>> getCoffeeImages({required List<String> ids});
}
