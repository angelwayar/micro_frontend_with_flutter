import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_module/login/presentation/cubit/login_cubit.dart';
import 'package:login_module/login/presentation/widgets/form_login.widget.dart';
import 'package:login_module/login/utils/injection.util.dart';

class LoginPage extends StatefulWidget {
  final Widget child;

  const LoginPage({Key? key, required this.child}) : super(key: key);

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
    return Material(
      child: Scaffold(
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
                child: LoginFormWidget(child: widget.child),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
