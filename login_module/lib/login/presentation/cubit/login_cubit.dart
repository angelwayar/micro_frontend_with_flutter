import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:login_module/login/domain/usecases/login_with_credentials.usecase.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginWithCredentialsUseCase loginWithCredentialsUseCase;

  LoginCubit({required this.loginWithCredentialsUseCase})
      : super(const LoginInitial());

  Future<void> loginWithCredentialsCubit(String email, String password) async {
    try {
      emit(const LoginLoading());
      await loginWithCredentialsUseCase.call(email, password);
      emit(const LoginSuccess());
    } catch (e) {
      emit(const LoginError());
    }
  }
}
