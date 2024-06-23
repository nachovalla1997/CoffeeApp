import 'package:coffee_app/business_logic/cubits/favorite_coffee/favorite_coffee_cubit.dart';
import 'package:coffee_app/business_logic/cubits/zoom_slider/zoom_slider_cubit.dart';
import 'package:coffee_app/presentation/screens/error_screen.dart';
import 'package:coffee_app/presentation/widgets/grid_view_widget.dart';
import 'package:coffee_app/presentation/widgets/no_favorites_widget.dart';
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
    return BlocBuilder<FavoriteCoffeeCubit, FavoriteCoffeeState>(
      builder: (context, stateFavorite) {
        return Column(
          children: [
            if (_isZoomSliderShow(stateFavorite))
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: BlocBuilder<ZoomSliderCubit, ZoomSliderState>(
                  builder: (context, stateSlider) {
                    return ZoomSliderWidget(
                      onSliderChanged: (value) {
                        context
                            .read<ZoomSliderCubit>()
                            .changeSliderValue(value);
                      },
                      sliderValue: stateSlider.sliderValue,
                    );
                  },
                ),
              ),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (stateFavorite.status == GetFavoriteImagesStatus.loaded) {
                    if (stateFavorite.favoriteImages.isEmpty) {
                      return const NoFavoritesWidget();
                    } else {
                      return BlocBuilder<ZoomSliderCubit, ZoomSliderState>(
                        builder: (context, stateSlider) {
                          return GridViewWidget(
                            crossAxisCount: stateSlider.sliderValue.toInt(),
                            favoriteImages: stateFavorite.favoriteImages,
                          );
                        },
                      );
                    }
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

  bool _isZoomSliderShow(FavoriteCoffeeState stateFavorite) {
    return stateFavorite.status == GetFavoriteImagesStatus.loaded &&
        stateFavorite.favoriteImages.isNotEmpty;
  }

  ErrorScreen _errorScreen(BuildContext context) {
    return ErrorScreen(onRetry: () {
      context.read<FavoriteCoffeeCubit>().getFavoriteImages();
    });
  }
}
