import 'package:coffee_app/business_logic/cubits/favorite_coffee/favorite_coffee_cubit.dart';
import 'package:coffee_app/business_logic/cubits/zoom_slider/zoom_slider_cubit.dart';
import 'package:coffee_app/presentation/screens/error_screen.dart';
import 'package:coffee_app/presentation/widgets/grid_view_widget.dart';
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
              padding: const EdgeInsets.all(12.0),
              child: ZoomSliderWidget(
                onSliderChanged: (value) {
                  context.read<ZoomSliderCubit>().changeSliderValue(value);
                },
                sliderValue: stateSlider.sliderValue,
              ),
            ),
            Expanded(
              child: BlocBuilder<FavoriteCoffeeCubit, FavoriteCoffeeState>(
                builder: (context, stateFavorite) {
                  if (stateFavorite.status == GetFavoriteImagesStatus.loaded) {
                    return GridViewWidget(
                      crossAxisCount: stateSlider.sliderValue.toInt(),
                      favoriteImages: stateFavorite.favoriteImages,
                    );
                  } else if (stateFavorite.status ==
                      GetFavoriteImagesStatus.loading) {
                    return const CoffeeProgressIndicator();
                  } else if (stateFavorite.status ==
                      GetFavoriteImagesStatus.error) {
                    return _errorScreen(context);
                  } else {
                    return _errorScreen(context);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }

  ErrorScreen _errorScreen(BuildContext context) {
    return ErrorScreen(onRetry: () {
      context.read<FavoriteCoffeeCubit>().getFavoriteImages();
    });
  }
}
