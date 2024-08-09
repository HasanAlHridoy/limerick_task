import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_task/controller/repositories.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    bool isEyeButtonPressed = false;
    bool isChecked = false;

    on<LoginIsEyeButtonClickEvent>((event, emit) {
      isEyeButtonPressed = !isEyeButtonPressed;
      // obscureText = !obscureText;
      emit(LoginScreenState(isEyeButtonPressed, isChecked));
    });
    on<LoginIsPrivacyButtonCheckEvent>((event, emit) {
      isChecked = !isChecked;
      emit(LoginScreenState(isEyeButtonPressed, isChecked));
    });
    on<LoginSignInButtonEvent>((event, emit) async {
      emit(LoginLoadingState());
      await Repositories().getAuthData(event.email, event.password);
      emit(LoginScreenState(isEyeButtonPressed, isChecked));
    });
  }
}
