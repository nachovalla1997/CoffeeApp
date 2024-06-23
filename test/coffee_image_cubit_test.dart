import 'dart:io';
import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_app/business_logic/cubits/coffee_image/coffee_image_cubit.dart';
import 'package:coffee_app/models/coffee_photo.dart';
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
    final testPhotoFile = File('path/to/photo');
    final testCoffeePhoto = CoffeePhoto(id: testUid, photo: testPhotoFile);
    final testPhotoBytes = Uint8List(10);

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, loaded] when getCoffeePhoto succeeds',
      build: () {
        when(mockGetUidService.getUid()).thenReturn(testUid);
        when(mockGetCoffeeImageService.getCoffeePhoto())
            .thenAnswer((_) async => testPhotoBytes);
        when(mockCoffeeImageRepository.saveCoffeeImage(
                id: anyNamed('id'), coffeeImage: anyNamed('coffeeImage')))
            .thenAnswer((_) async => testCoffeePhoto);

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.getCoffeePhoto(),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImagesStatus.loading),
        GetCoffeeImageState.initial().copyWith(
            status: GetImagesStatus.loaded, coffeePhoto: testCoffeePhoto),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, error] when getCoffeePhoto fails',
      build: () {
        when(mockGetUidService.getUid()).thenReturn(testUid);
        when(mockGetCoffeeImageService.getCoffeePhoto())
            .thenThrow(Exception('error'));

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.getCoffeePhoto(),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImagesStatus.loading),
        GetCoffeeImageState.initial().copyWith(status: GetImagesStatus.error),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, loaded] when nextCoffeePhoto succeeds',
      build: () {
        when(mockCoffeeImageRepository.deleteCoffeeImage(id: anyNamed('id')))
            .thenAnswer((_) async => {});
        when(mockGetUidService.getUid()).thenReturn(testUid);
        when(mockGetCoffeeImageService.getCoffeePhoto())
            .thenAnswer((_) async => testPhotoBytes);
        when(mockCoffeeImageRepository.saveCoffeeImage(
                id: anyNamed('id'), coffeeImage: anyNamed('coffeeImage')))
            .thenAnswer((_) async => testCoffeePhoto);

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) => cubit.nextCoffeePhoto(currentPhotoId: 'current_photo_id'),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImagesStatus.loading),
        GetCoffeeImageState.initial().copyWith(
            status: GetImagesStatus.loaded, coffeePhoto: testCoffeePhoto),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, error] when nextCoffeePhoto fails to delete image',
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
      act: (cubit) => cubit.nextCoffeePhoto(currentPhotoId: 'current_photo_id'),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImagesStatus.loading),
        GetCoffeeImageState.initial().copyWith(status: GetImagesStatus.error),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, loaded] when addCoffeePhotoToFavorites succeeds',
      build: () {
        when(mockFavoriteCoffeeImageRepository.saveFavoriteCoffeeImage(
                id: anyNamed('id')))
            .thenAnswer((_) async => {});
        when(mockGetUidService.getUid()).thenReturn(testUid);
        when(mockGetCoffeeImageService.getCoffeePhoto())
            .thenAnswer((_) async => testPhotoBytes);
        when(mockCoffeeImageRepository.saveCoffeeImage(
                id: anyNamed('id'), coffeeImage: anyNamed('coffeeImage')))
            .thenAnswer((_) async => testCoffeePhoto);

        return CoffeeImageCubit(
          getCoffeeImagesService: mockGetCoffeeImageService,
          getUidService: mockGetUidService,
          coffeeImageRepository: mockCoffeeImageRepository,
          favoriteCoffeeImageRepository: mockFavoriteCoffeeImageRepository,
        );
      },
      act: (cubit) =>
          cubit.addCoffeePhotoToFavorites(currentPhotoId: 'current_photo_id'),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImagesStatus.loading),
        GetCoffeeImageState.initial().copyWith(
            status: GetImagesStatus.loaded, coffeePhoto: testCoffeePhoto),
      ],
    );

    blocTest<CoffeeImageCubit, GetCoffeeImageState>(
      'emits [loading, error] when addCoffeePhotoToFavorites fails to save favorite',
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
          cubit.addCoffeePhotoToFavorites(currentPhotoId: 'current_photo_id'),
      expect: () => [
        GetCoffeeImageState.initial().copyWith(status: GetImagesStatus.loading),
        GetCoffeeImageState.initial().copyWith(status: GetImagesStatus.error),
      ],
    );
  });
}
