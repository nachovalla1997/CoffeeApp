// Mocks generated by Mockito 5.4.4 from annotations
// in coffee_app/test/mocks/test.mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:coffee_app/models/coffee_photo.dart' as _i2;
import 'package:coffee_app/repositories_interfaces/i_coffee_image_repository.dart'
    as _i3;
import 'package:coffee_app/repositories_interfaces/i_favorite_coffee_image_repository.dart'
    as _i6;
import 'package:coffee_app/services_interfaces/i_get_coffee_image_service.dart'
    as _i7;
import 'package:coffee_app/services_interfaces/i_get_uid_service.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCoffeePhoto_0 extends _i1.SmartFake implements _i2.CoffeePhoto {
  _FakeCoffeePhoto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ICoffeeImageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockICoffeeImageRepository extends _i1.Mock
    implements _i3.ICoffeeImageRepository {
  MockICoffeeImageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CoffeePhoto> saveCoffeeImage({
    required _i5.Uint8List? coffeeImage,
    required String? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveCoffeeImage,
          [],
          {
            #coffeeImage: coffeeImage,
            #id: id,
          },
        ),
        returnValue: _i4.Future<_i2.CoffeePhoto>.value(_FakeCoffeePhoto_0(
          this,
          Invocation.method(
            #saveCoffeeImage,
            [],
            {
              #coffeeImage: coffeeImage,
              #id: id,
            },
          ),
        )),
      ) as _i4.Future<_i2.CoffeePhoto>);

  @override
  _i4.Future<void> deleteCoffeeImage({required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteCoffeeImage,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [IFavoriteCoffeeImageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIFavoriteCoffeeImageRepository extends _i1.Mock
    implements _i6.IFavoriteCoffeeImageRepository {
  MockIFavoriteCoffeeImageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> saveFavoriteCoffeeImage({required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFavoriteCoffeeImage,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteFavoriteCoffeeImage({required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFavoriteCoffeeImage,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<List<String>> getFavoriteCoffeeImages() => (super.noSuchMethod(
        Invocation.method(
          #getFavoriteCoffeeImages,
          [],
        ),
        returnValue: _i4.Future<List<String>>.value(<String>[]),
      ) as _i4.Future<List<String>>);
}

/// A class which mocks [IGetCoffeeImageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGetCoffeeImageService extends _i1.Mock
    implements _i7.IGetCoffeeImageService {
  MockIGetCoffeeImageService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.Uint8List> getCoffeePhoto() => (super.noSuchMethod(
        Invocation.method(
          #getCoffeePhoto,
          [],
        ),
        returnValue: _i4.Future<_i5.Uint8List>.value(_i5.Uint8List(0)),
      ) as _i4.Future<_i5.Uint8List>);
}

/// A class which mocks [IGetUidService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGetUidService extends _i1.Mock implements _i8.IGetUidService {
  MockIGetUidService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String getUid() => (super.noSuchMethod(
        Invocation.method(
          #getUid,
          [],
        ),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.method(
            #getUid,
            [],
          ),
        ),
      ) as String);
}