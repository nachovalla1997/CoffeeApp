abstract class IFavoriteCoffeeImageRepository {
  Future<void> saveFavoriteCoffeeImage({required String id});
  Future<List<String>> getFavoriteCoffeeImages();
}
