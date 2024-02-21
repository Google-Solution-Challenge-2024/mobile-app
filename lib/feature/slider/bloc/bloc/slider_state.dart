part of 'slider_bloc.dart';

@immutable
sealed class SliderState {}

final class LoadingSliderState extends SliderState {}

final class DontShowSliderState extends SliderState {}

final class ShowSliderState extends SliderState {}
