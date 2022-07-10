import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_app/main_app/presentation/cubit/login_cubit.dart';
import 'package:main_app/main_app/presentation/widgets/form_login.widget.dart';
import 'package:main_app/main_app/utils/injection.util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit _loginCubit;
  @override
  void initState() {
    InjectionLogin().initInjectionLogin();
    _loginCubit = InjectionLogin().getIt.get<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Page',
              style: TextStyle(fontSize: 40.0),
            ),
            BlocProvider<LoginCubit>(
              create: (context) => _loginCubit,
              child: const LoginFormWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
