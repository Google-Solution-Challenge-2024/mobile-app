import 'package:get_it/get_it.dart';
import 'package:solution_app/core/service-locator/service_locator.dart';
import 'package:solution_app/feature/slider/bloc/bloc/slider_bloc.dart';

class SliderServiceLocator extends ServiceLocator {
  /// Factory will generate new instance every time when requested
  /// Singleton will generate only one instance and will give it to every caller
  /// Lazy will generate instance when it is called for the first time
  @override
  Future<void> call(GetIt sl) async {
    sl.registerLazySingleton<SliderBloc>(
      () => SliderBloc(),
    );
  }
}
