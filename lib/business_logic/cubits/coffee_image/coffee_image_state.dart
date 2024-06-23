part of 'coffee_image_cubit.dart';

class GetCoffeeImageState extends Equatable {
  final GetImageStatus status;
  final CoffeeImage? coffeeImage;

  const GetCoffeeImageState({
    required this.status,
    this.coffeeImage,
  });

  factory GetCoffeeImageState.initial() {
    return const GetCoffeeImageState(
      status: GetImageStatus.initial,
    );
  }

  GetCoffeeImageState copyWith({
    GetImageStatus? status,
    CoffeeImage? coffeeImage,
  }) {
    return GetCoffeeImageState(
      status: status ?? this.status,
      coffeeImage: coffeeImage ?? this.coffeeImage,
    );
  }

  @override
  List<Object> get props => [status];
}
