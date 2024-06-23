import 'package:bloc_test/bloc_test.dart';
import 'package:coffee_app/business_logic/cubits/zoom_slider/zoom_slider_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ZoomSliderCubit', () {
    blocTest<ZoomSliderCubit, ZoomSliderState>(
      'emits the correct state when changeSliderValue is called',
      build: () => ZoomSliderCubit(),
      act: (cubit) => cubit.changeSliderValue(5.0),
      expect: () => [
        ZoomSliderState.initial().copyWith(sliderValue: 5.0),
      ],
    );

    blocTest<ZoomSliderCubit, ZoomSliderState>(
      'emits the correct initial state',
      build: () => ZoomSliderCubit(),
      verify: (cubit) => expect(cubit.state, ZoomSliderState.initial()),
    );
  });
}
