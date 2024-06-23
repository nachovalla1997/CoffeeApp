part of 'favorite_coffee_cubit.dart';

class FavoriteCoffeeState extends Equatable {
  final GetFavoriteImagesStatus status;
  final List<CoffeeImage> favoriteImages;

  const FavoriteCoffeeState({
    required this.status,
    required this.favoriteImages,
  });

  factory FavoriteCoffeeState.initial() {
    return const FavoriteCoffeeState(
      status: GetFavoriteImagesStatus.initial,
      favoriteImages: [],
    );
  }

  FavoriteCoffeeState copyWith({
    GetFavoriteImagesStatus? status,
    List<CoffeeImage>? favoriteImages,
  }) {
    return FavoriteCoffeeState(
      status: status ?? this.status,
      favoriteImages: favoriteImages ?? this.favoriteImages,
    );
  }

  @override
  List<Object> get props => [];
}
