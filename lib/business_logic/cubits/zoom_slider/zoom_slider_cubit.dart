import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'zoom_slider_state.dart';

class ZoomSliderCubit extends Cubit<ZoomSliderState> {
  ZoomSliderCubit() : super(ZoomSliderState.initial());

  void changeSliderValue(double value) {
    emit(state.copyWith(sliderValue: value));
  }
}
