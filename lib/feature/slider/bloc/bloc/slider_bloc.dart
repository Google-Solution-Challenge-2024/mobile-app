import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(LoadingSliderState()) {
    on<InitSliderEvent>((event, emit) async {
      emit(LoadingSliderState());
      var prefs = await SharedPreferences.getInstance();
      bool isShown = prefs.getBool("slider") ?? false;
      if (!isShown) {
        emit(ShowSliderState());
      } else {
        emit(DontShowSliderState());
      }
    });

    on<FinisedSliderEvent>((event, emit) async {
      emit(LoadingSliderState());
      var prefs = await SharedPreferences.getInstance();
      await prefs.setBool("slider", true);
      emit(DontShowSliderState());
    });
  }
}
