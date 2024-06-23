import 'package:coffee_app/repositories_interfaces/i_favorite_coffee_image_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteCoffeeImageSharedPreferencesRepository
    implements IFavoriteCoffeeImageRepository {
  static const String favoritesKey = 'favorite_coffee_images';

  // INFO: Singleton pattern to ensure a single instance of SharedPreferences is used.
  static SharedPreferences? _database;

  static Future<void> _initDatabase() async {
    _database ??= await SharedPreferences.getInstance();
  }

  @override
  Future<void> deleteFavoriteCoffeeImage({required String id}) async {
    await _initDatabase();
    final favoriteCoffeeImages = _database!.getStringList(favoritesKey) ?? [];
    favoriteCoffeeImages.remove(id);
    await _database!.setStringList(favoritesKey, favoriteCoffeeImages);
  }

  @override
  Future<List<String>> getFavoriteCoffeeImages() async {
    await _initDatabase();
    return _database!.getStringList(favoritesKey) ?? [];
  }

  @override
  Future<void> saveFavoriteCoffeeImage({required String id}) async {
    await _initDatabase();
    final favoriteCoffeeImages = _database!.getStringList(favoritesKey) ?? [];
    if (!favoriteCoffeeImages.contains(id)) {
      favoriteCoffeeImages.add(id);
      await _database!.setStringList(favoritesKey, favoriteCoffeeImages);
    }
  }
}
