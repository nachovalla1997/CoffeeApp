import 'dart:io';
import 'dart:typed_data';

import 'package:coffee_app/models/coffee_photo.dart';
import 'package:coffee_app/repositories_interfaces/i_coffee_image_repository.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class CoffeeImagePathProviderRepository implements ICoffeeImageRepository {
  @override
  Future<CoffeePhoto> saveCoffeeImage(
      {required Uint8List coffeeImage, required String id}) async {
    final image = img.decodeJpg(coffeeImage);
    if (image == null) {
      throw Exception('Invalid image data');
    }

    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = File('${documentDirectory.path}/$id.jpg');
    await file.writeAsBytes(coffeeImage);

    return CoffeePhoto(
      id: id,
      photo: file,
    );
  }

  @override
  Future<void> deleteCoffeeImage({required String id}) async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final filePath = '${documentDirectory.path}/$id.jpg';
    final file = File(filePath);

    if (await file.exists()) {
      await file.delete();
    } else {
      throw Exception('File not found');
    }
  }
}
