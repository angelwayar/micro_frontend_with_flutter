import 'package:login_module/login/domain/repositories/remote.repository.dart';

class LoginWithCredentialsUseCase {
  final RemoteRepository remoteRepository;

  const LoginWithCredentialsUseCase({required this.remoteRepository});

  Future<void> call(String email, String password) async {
    await remoteRepository.loginWithCredentials(
      email: email,
      password: password,
    );
  }
}
