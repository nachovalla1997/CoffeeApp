import 'package:coffee_app/business_logic/cubits/get_coffee_images/get_coffee_images_cubit.dart';
import 'package:coffee_app/presentation/widgets/coffee_card_widget.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCoffeePhotosWidget extends StatelessWidget {
  const NewCoffeePhotosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<GetCoffeeImagesCubit, GetCoffeeImagesState>(
                builder: (context, state) {
                  if (state.status == GetImagesStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == GetImagesStatus.error) {
                    return const Center(child: Text("Error"));
                  } else if (state.status == GetImagesStatus.loaded) {
                    return CoffeeCard(coffeePhoto: state.coffeePhoto!);
                  } else {
                    return const Center(child: Text("No data"));
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
