import 'package:coffee_app/models/coffee_image.dart';
import 'package:coffee_app/presentation/widgets/coffee_image_widget.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final int crossAxisCount;
  final List<CoffeeImage> favoriteImages;

  const GridViewWidget({
    super.key,
    required this.crossAxisCount,
    required this.favoriteImages,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: favoriteImages.length,
      itemBuilder: (context, index) {
        return GridTile(
            child: CoffeeImageWidget(
          coffeeImage: favoriteImages[index],
        ));
      },
    );
  }
}
