part of 'zoom_slider_cubit.dart';

class ZoomSliderState extends Equatable {
  final double sliderValue;

  const ZoomSliderState({required this.sliderValue});

  factory ZoomSliderState.initial() {
    return const ZoomSliderState(sliderValue: 2.0);
  }

  ZoomSliderState copyWith({double? sliderValue}) {
    return ZoomSliderState(
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object> get props => [sliderValue];
}
