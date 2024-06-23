import 'package:coffee_app/repositories_interfaces/i_coffee_image_repository.dart';
import 'package:coffee_app/repositories_interfaces/i_favorite_coffee_image_repository.dart';
import 'package:coffee_app/services_interfaces/i_get_coffee_image_service.dart';
import 'package:coffee_app/services_interfaces/i_get_uid_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ICoffeeImageRepository,
  IFavoriteCoffeeImageRepository,
  IGetCoffeeImageService,
  IGetUidService,
])
void main() {}
