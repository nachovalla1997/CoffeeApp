import 'package:flutter/material.dart';

class FavoritePhotosScreen extends StatefulWidget {
  const FavoritePhotosScreen({super.key});

  @override
  FavoritePhotosScreenState createState() => FavoritePhotosScreenState();
}

class FavoritePhotosScreenState extends State<FavoritePhotosScreen> {
  double _sliderValue = 2.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // TODO: Add localizations.
              const Text('Zoom:'),
              Expanded(
                child: Slider(
                  value: _sliderValue,
                  min: 1.0,
                  max: 6.0,
                  divisions: 5,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _sliderValue.toInt(),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return GridTile(
                // child: Image.network(
                //   widget.favoritePhotos[index],
                //   fit: BoxFit.cover,
                // ),
                child: Container(
                  color: Colors.grey[800],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
