import 'package:login_module/login/data/datasources/remote.datasource.dart';
import 'package:login_module/login/data/models/user.model.dart';
import 'package:login_module/login/domain/repositories/remote.repository.dart';

class RemoteRepositoryImp implements RemoteRepository {
  final RemoteDataSource remoteDataSource;

  const RemoteRepositoryImp({required this.remoteDataSource});

  @override
  Future<void> loginWithCredentials({
    required final String email,
    required final String password,
  }) async {
    final user = UserModel(email: email, password: password);
    await remoteDataSource.loginWithCredentials(userModel: user);
  }
}
