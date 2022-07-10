import 'package:login_module/login/data/models/user.model.dart';

abstract class RemoteDataSource {
  Future<void> loginWithCredentials({required final UserModel userModel});
}
