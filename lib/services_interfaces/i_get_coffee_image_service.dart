import 'dart:typed_data';

abstract class IGetCoffeeImageService {
  Future<Uint8List> getCoffeeImage();
}
