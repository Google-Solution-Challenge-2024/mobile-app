import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SharedPreferences? prefs;

  AuthBloc() : super(AuthInitial()) {
    on<AppStartedAuthEvent>((event, emit) async {
      emit(LoadingAuthState());
      if (await getSigninData()) {
        emit(AuthenticatedAuthState());
      } else {
        emit(UnauthenticatedAuthState());
      }
    });
    on<LoginAuthEvent>((event, emit) async {
      emit(LoadingAuthState());
      await setSigninData();
      emit(AuthenticatedAuthState());
    });
    on<LogoutAuthEvent>((event, emit) async {
      emit(LoadingAuthState());
      prefs ??= await SharedPreferences.getInstance();
      await prefs!.setBool('signin', false);
      await prefs!.setBool('slider', false);
      emit(UnauthenticatedAuthState());
    });
  }

  setSigninData() async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs!.setBool('signin', true);
  }

  Future<bool> getSigninData() async {
    prefs ??= await SharedPreferences.getInstance();
    final bool? signin = prefs!.getBool('signin');
    return signin ?? false;
  }
}
