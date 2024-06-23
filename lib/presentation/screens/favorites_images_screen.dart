import 'package:coffee_app/business_logic/cubits/zoom_slider/zoom_slider_cubit.dart';
import 'package:coffee_app/presentation/widgets/zoom_slider_widget.dart';
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
      builder: (context, state) {
        return Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ZoomSliderWidget(
                  onSliderChanged: (value) {
                    context.read<ZoomSliderCubit>().changeSliderValue(value);
                  },
                  sliderValue: state.sliderValue,
                )),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: state.sliderValue.toInt(),
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
      },
    );
  }
}
