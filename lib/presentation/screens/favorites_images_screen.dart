import 'package:coffee_app/business_logic/cubits/favorite_coffee/favorite_coffee_cubit.dart';
import 'package:coffee_app/business_logic/cubits/zoom_slider/zoom_slider_cubit.dart';
import 'package:coffee_app/presentation/widgets/coffee_image_widget.dart';
import 'package:coffee_app/presentation/widgets/progress_indicator/coffee_progress_indicator.dart';
import 'package:coffee_app/presentation/widgets/zoom_slider_widget.dart';
import 'package:coffee_app/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteImagesScreen extends StatefulWidget {
  const FavoriteImagesScreen({super.key});

  @override
  FavoriteImagesScreenState createState() => FavoriteImagesScreenState();
}

class FavoriteImagesScreenState extends State<FavoriteImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZoomSliderCubit, ZoomSliderState>(
      builder: (context, stateSlider) {
        return Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ZoomSliderWidget(
                  onSliderChanged: (value) {
                    context.read<ZoomSliderCubit>().changeSliderValue(value);
                  },
                  sliderValue: stateSlider.sliderValue,
                )),
            Expanded(
              child: BlocConsumer<FavoriteCoffeeCubit, FavoriteCoffeeState>(
                listener: (context, state) {
                  if (state.status == GetFavoriteImagesStatus.initial) {
                    context.read<FavoriteCoffeeCubit>().getFavoriteImages();
                  }
                },
                builder: (context, stateFavorite) {
                  if (stateFavorite.status == GetFavoriteImagesStatus.loaded) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: stateSlider.sliderValue.toInt(),
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: stateFavorite.favoriteImages.length,
                      itemBuilder: (context, index) {
                        return GridTile(
                            child: CoffeeImageWidget(
                          coffeeImage: stateFavorite.favoriteImages[index],
                        ));
                      },
                    );
                  } else {
                    return const CoffeeProgressIndicator();
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
