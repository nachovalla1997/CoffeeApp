import 'package:coffee_app/business_logic/cubits/coffee_image/coffee_image_cubit.dart';
import 'package:coffee_app/presentation/screens/error_screen.dart';
import 'package:coffee_app/presentation/widgets/coffee_card_widget.dart';
import 'package:coffee_app/presentation/widgets/progress_indicator/coffee_progress_indicator.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCoffeePhotosScreen extends StatelessWidget {
  const NewCoffeePhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CoffeeImageCubit, GetCoffeeImageState>(
                builder: (context, state) {
                  if (state.status == GetImagesStatus.loading) {
                    return const Center(child: CoffeeProgressIndicator());
                  } else if (state.status == GetImagesStatus.error) {
                    return ErrorScreen(onRetry: () {
                      context.read<CoffeeImageCubit>().getCoffeePhoto();
                    });
                  } else if (state.status == GetImagesStatus.loaded) {
                    return CoffeeCard(coffeePhoto: state.coffeePhoto!);
                  } else {
                    return ErrorScreen(onRetry: () {
                      context.read<CoffeeImageCubit>().getCoffeePhoto();
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
