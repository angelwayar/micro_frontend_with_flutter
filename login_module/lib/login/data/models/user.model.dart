import 'package:login_module/login/domain/entities/user.entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required final String email,
    required final String password,
  }) : super(email: email, password: password);
}
