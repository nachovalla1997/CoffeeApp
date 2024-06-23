import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_app/business_logic/cubits/favorite_coffee/favorite_coffee_cubit.dart';
import 'package:coffee_app/models/coffee_image.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'dart:io';

import 'mocks/test.mocks.mocks.dart';

void main() {
  late MockICoffeeImageRepository mockCoffeeImageRepository;
  late MockIFavoriteCoffeeImageRepository mockFavoriteCoffeeImageRepository;

  setUp(() {
    mockCoffeeImageRepository = MockICoffeeImageRepository();
    mockFavoriteCoffeeImageRepository = MockIFavoriteCoffeeImageRepository();
  });

  group('FavoriteCoffeeCubit', () {
    final testImageFile = File('path/to/image');
    final testCoffeeImage = CoffeeImage(id: 'test_id', image: testImageFile);
    final List<CoffeeImage> testCoffeeImages = [testCoffeeImage];

    blocTest<FavoriteCoffeeCubit, FavoriteCoffeeState>(
      'emits [loading, loaded] when getFavoriteImages succeeds',
      build: () {
        when(mockFavoriteCoffeeImageRepository.getFavoriteCoffeeImages())
            .thenAnswer((_) async => ['test_id']);
        when(mockCoffeeImageRepository.getCoffeeImages(ids: anyNamed('ids')))
            .thenAnswer((_) async => testCoffeeImages);

        return FavoriteCoffeeCubit(
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.getFavoriteImages(),
      expect: () => [
        FavoriteCoffeeState.initial().copyWith(status: GetFavoriteImagesStatus.loading),
        FavoriteCoffeeState.initial().copyWith(
          status: GetFavoriteImagesStatus.loaded,
          favoriteImages: testCoffeeImages,
        ),
      ],
    );

    blocTest<FavoriteCoffeeCubit, FavoriteCoffeeState>(
      'emits [loading, error] when getFavoriteImages fails',
      build: () {
        when(mockFavoriteCoffeeImageRepository.getFavoriteCoffeeImages())
            .thenThrow(Exception('error'));

        return FavoriteCoffeeCubit(
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.getFavoriteImages(),
      expect: () => [
        FavoriteCoffeeState.initial().copyWith(status: GetFavoriteImagesStatus.loading),
        FavoriteCoffeeState.initial().copyWith(status: GetFavoriteImagesStatus.error),
      ],
    );

    blocTest<FavoriteCoffeeCubit, FavoriteCoffeeState>(
      'emits [loading, loaded] when addCoffeeImageToFavorites succeeds',
      build: () {
        when(mockFavoriteCoffeeImageRepository.saveFavoriteCoffeeImage(
                id: anyNamed('id')))
            .thenAnswer((_) async => {});

        return FavoriteCoffeeCubit(
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.addCoffeeImageToFavorites(
        currentCoffeeImage: testCoffeeImage,
      ),
      expect: () => [
        FavoriteCoffeeState.initial().copyWith(status: GetFavoriteImagesStatus.loading),
        FavoriteCoffeeState.initial().copyWith(
          status: GetFavoriteImagesStatus.loaded,
          favoriteImages: [testCoffeeImage],
        ),
      ],
    );

    blocTest<FavoriteCoffeeCubit, FavoriteCoffeeState>(
      'emits [loading, error] when addCoffeeImageToFavorites fails',
      build: () {
        when(mockFavoriteCoffeeImageRepository.saveFavoriteCoffeeImage(
                id: anyNamed('id')))
            .thenThrow(Exception('error'));

        return FavoriteCoffeeCubit(
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.addCoffeeImageToFavorites(
        currentCoffeeImage: testCoffeeImage,
      ),
      expect: () => [
        FavoriteCoffeeState.initial().copyWith(status: GetFavoriteImagesStatus.loading),
        FavoriteCoffeeState.initial().copyWith(status: GetFavoriteImagesStatus.error),
      ],
    );
  });
}
