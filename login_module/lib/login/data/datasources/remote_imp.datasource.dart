import 'dart:developer';

import 'package:login_module/login/data/datasources/remote.datasource.dart';
import 'package:login_module/login/data/models/user.model.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  @override
  Future<void> loginWithCredentials({required UserModel userModel}) async {
    await Future.delayed(const Duration(seconds: 2));

    if ((userModel.email == 'angelmanuelwayar@gmail.com') &&
        (userModel.password == '@ngelWayar1994')) {
      log('Login con exito');
    } else {
      throw ('Verificar credenciales');
    }
  }
}
