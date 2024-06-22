part of 'get_coffee_images_cubit.dart';

class GetCoffeeImagesState extends Equatable {
  final GetImagesStatus status;
  final CoffeePhoto? coffeePhoto;

  const GetCoffeeImagesState({
    required this.status,
    this.coffeePhoto,
  });

  factory GetCoffeeImagesState.initial() {
    return const GetCoffeeImagesState(
      status: GetImagesStatus.initial,
    );
  }

  GetCoffeeImagesState copyWith({
    GetImagesStatus? status,
    CoffeePhoto? coffeePhoto,
  }) {
    return GetCoffeeImagesState(
      status: status ?? this.status,
      coffeePhoto: coffeePhoto ?? this.coffeePhoto,
    );
  }

  @override
  List<Object> get props => [status];
}
