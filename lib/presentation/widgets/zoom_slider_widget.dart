import 'package:coffee_app/localization.dart';
import 'package:flutter/material.dart';

class ZoomSliderWidget extends StatelessWidget {
  final double sliderValue;
  final Function(double) onSliderChanged;

  static const double _minValue = 1.0;
  static const double _maxValue = 6.0;
  static const double _transformBase = 7.0;

  const ZoomSliderWidget({
    super.key,
    required this.sliderValue,
    required this.onSliderChanged,
  });

  double _transformValue(double value) {
    return _transformBase - value;
  }

  double _reverseTransformValue(double value) {
    return _transformBase - value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(Localization.current.zoom),
        Expanded(
          child: Slider(
            value: _transformValue(sliderValue),
            min: _minValue,
            max: _maxValue,
            divisions: (_maxValue - _minValue).toInt(),
            onChanged: (value) {
              onSliderChanged(_reverseTransformValue(value));
            },
          ),
        ),
      ],
    );
  }
}
