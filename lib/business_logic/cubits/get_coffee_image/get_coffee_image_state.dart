part of 'get_coffee_image_cubit.dart';

class GetCoffeeImageState extends Equatable {
  final GetImagesStatus status;
  final CoffeePhoto? coffeePhoto;

  const GetCoffeeImageState({
    required this.status,
    this.coffeePhoto,
  });

  factory GetCoffeeImageState.initial() {
    return const GetCoffeeImageState(
      status: GetImagesStatus.initial,
    );
  }

  GetCoffeeImageState copyWith({
    GetImagesStatus? status,
    CoffeePhoto? coffeePhoto,
  }) {
    return GetCoffeeImageState(
      status: status ?? this.status,
      coffeePhoto: coffeePhoto ?? this.coffeePhoto,
    );
  }

  @override
  List<Object> get props => [status];
}
