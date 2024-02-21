part of 'slider_bloc.dart';

@immutable
sealed class SliderEvent {}

class InitSliderEvent extends SliderEvent {}

class FinisedSliderEvent extends SliderEvent {}
