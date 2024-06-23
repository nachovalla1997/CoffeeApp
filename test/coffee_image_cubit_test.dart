import 'dart:io';
import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_app/business_logic/cubits/coffee_image/coffee_image_cubit.dart';
import 'package:coffee_app/models/coffee_image.dart';
import 'package:coffee_app/repositories_interfaces/i_coffee_image_repository.dart';
import 'package:coffee_app/repositories_interfaces/i_favorite_coffee_image_repository.dart';
import 'package:coffee_app/services_interfaces/i_get_coffee_image_service.dart';
import 'package:coffee_app/services_interfaces/i_get_uid_service.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mocks/test.mocks.mocks.dart';

@GenerateMocks([
  ICoffeeImageRepository,
  IFavoriteCoffeeImageRepository,
  IGetCoffeeImageService,
  IGetUidService,
])
void main() {
  late MockICoffeeImageRepository mockCoffeeImageRepository;
  late MockIFavoriteCoffeeImageRepository mockFavoriteCoffeeImageRepository;
  late MockIGetCoffeeImageService mockGetCoffeeImageService;
  late MockIGetUidService mockGetUidService;

  setUp(() {
    mockCoffeeImageRepository = MockICoffeeImageRepository();
    mockFavoriteCoffeeImageRepository = MockIFavoriteCoffeeImageRepository();
    mockGetCoffeeImageService = MockIGetCoffeeImageService();
    mockGetUidService = MockIGetUidService();
  });

  group('CoffeeImageCubit', () {
    const testUid = 'test_uid';
    final testImageFile = File('path/to/image');
    final testCoffeeImage = CoffeeImage(id: testUid, image: testImageFile);
    final testImageBytes = Uint8List(10);

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, loaded] when getCoffeeImage succeeds',
      build: () {
        when(mockGetUidService.getUid()).thenReturn(testUid);
        when(mockGetCoffeeImageService.getCoffeeImage())
            .thenAnswer((_) async => testImageBytes);
        when(mockCoffeeImageRepository.saveCoffeeImage(
                id: anyNamed('id'), coffeeImage: anyNamed('coffeeImage')))
            .thenAnswer((_) async => testCoffeeImage);

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.getCoffeeImage(),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImageStatus.loading),
        GetCoffeeImageState.initial().copyWith(
            status: GetImageStatus.loaded, coffeeImage: testCoffeeImage),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, error] when getCoffeeImage fails',
      build: () {
        when(mockGetUidService.getUid()).thenReturn(testUid);
        when(mockGetCoffeeImageService.getCoffeeImage())
            .thenThrow(Exception('error'));

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.getCoffeeImage(),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImageStatus.loading),
        GetCoffeeImageState.initial().copyWith(status: GetImageStatus.error),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, loaded] when nextCoffeeImage succeeds',
      build: () {
        when(mockCoffeeImageRepository.deleteCoffeeImage(id: anyNamed('id')))
            .thenAnswer((_) async => {});
        when(mockGetUidService.getUid()).thenReturn(testUid);
        when(mockGetCoffeeImageService.getCoffeeImage())
            .thenAnswer((_) async => testImageBytes);
        when(mockCoffeeImageRepository.saveCoffeeImage(
                id: anyNamed('id'), coffeeImage: anyNamed('coffeeImage')))
            .thenAnswer((_) async => testCoffeeImage);

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.nextCoffeeImage(currentImageId: 'current_image_id'),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImageStatus.loading),
        GetCoffeeImageState.initial().copyWith(
            status: GetImageStatus.loaded, coffeeImage: testCoffeeImage),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, error] when nextCoffeeImage fails to delete image',
      build: () {
        when(mockCoffeeImageRepository.deleteCoffeeImage(id: anyNamed('id')))
            .thenThrow(Exception('error'));

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.nextCoffeeImage(currentImageId: 'current_image_id'),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImageStatus.loading),
        GetCoffeeImageState.initial().copyWith(status: GetImageStatus.error),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, loaded] when addCoffeeImageToFavorites succeeds',
      build: () {
        when(mockFavoriteCoffeeImageRepository.saveFavoriteCoffeeImage(
                id: anyNamed('id')))
            .thenAnswer((_) async => {});
        when(mockGetUidService.getUid()).thenReturn(testUid);
        when(mockGetCoffeeImageService.getCoffeeImage())
            .thenAnswer((_) async => testImageBytes);
        when(mockCoffeeImageRepository.saveCoffeeImage(
                id: anyNamed('id'), coffeeImage: anyNamed('coffeeImage')))
            .thenAnswer((_) async => testCoffeeImage);

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) =>
          cubit.addCoffeeImageToFavorites(currentImageId: 'current_image_id'),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImageStatus.loading),
        GetCoffeeImageState.initial().copyWith(
            status: GetImageStatus.loaded, coffeeImage: testCoffeeImage),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, error] when addCoffeeImageToFavorites fails to save favorite',
      build: () {
        when(mockFavoriteCoffeeImageRepository.saveFavoriteCoffeeImage(
                id: anyNamed('id')))
            .thenThrow(Exception('error'));

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) =>
          cubit.addCoffeeImageToFavorites(currentImageId: 'current_image_id'),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImageStatus.loading),
        GetCoffeeImageState.initial().copyWith(status: GetImageStatus.error),
      ],
    );
  });
}
