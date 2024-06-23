import 'package:coffee_app/business_logic/cubits/coffee_image/coffee_image_cubit.dart';
import 'package:coffee_app/models/coffee_image.dart';
import 'package:coffee_app/presentation/widgets/coffee_actions_widget.dart';
import 'package:coffee_app/presentation/widgets/coffee_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeImage coffeeImage;

  const CoffeeCard({super.key, required this.coffeeImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          CoffeeImageWidget(coffeeImage: coffeeImage),
          CoffeeActionsWidget(
            onAddToFavorites: () {
              context
                  .read<CoffeeImageCubit>()
                  .addCoffeeImageToFavorites(currentImageId: coffeeImage.id);
            },
            onSkip: () {
              context
                  .read<CoffeeImageCubit>()
                  .nextCoffeeImage(currentImageId: coffeeImage.id);
            },
          ),
        ],
      ),
    );
  }
}
