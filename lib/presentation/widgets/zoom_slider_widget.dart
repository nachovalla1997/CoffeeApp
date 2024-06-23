import 'package:coffee_app/localization.dart';
import 'package:flutter/material.dart';

class ZoomSliderWidget extends StatelessWidget {
  final double sliderValue;
  final Function(double) onSliderChanged;

  const ZoomSliderWidget({
    super.key,
    required this.sliderValue,
    required this.onSliderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(Localization.current.zoom),
        Expanded(
          child: Slider(
            value: sliderValue,
            min: 1.0,
            max: 6.0,
            divisions: 5,
            onChanged: (value) {
              onSliderChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
