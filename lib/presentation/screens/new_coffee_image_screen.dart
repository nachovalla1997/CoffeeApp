import 'package:coffee_app/business_logic/cubits/coffee_image/coffee_image_cubit.dart';
import 'package:coffee_app/presentation/screens/error_screen.dart';
import 'package:coffee_app/presentation/widgets/coffee_card_widget.dart';
import 'package:coffee_app/presentation/widgets/progress_indicator/coffee_progress_indicator.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCoffeeImagesScreen extends StatelessWidget {
  const NewCoffeeImagesScreen({super.key});

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
                  if (state.status == GetImageStatus.loading) {
                    return const Center(child: CoffeeProgressIndicator());
                  } else if (state.status == GetImageStatus.error) {
                    return _errorScreen(context);
                  } else if (state.status == GetImageStatus.loaded) {
                    return CoffeeCard(coffeeImage: state.coffeeImage!);
                  } else {
                    return _errorScreen(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ErrorScreen _errorScreen(BuildContext context) {
    return ErrorScreen(onRetry: () {
      context.read<CoffeeImageCubit>().getCoffeeImage();
    });
  }
}
