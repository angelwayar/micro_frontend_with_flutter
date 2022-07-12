import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_module/login/presentation/cubit/login_cubit.dart';

class LoginFormWidget extends StatefulWidget {
  final Widget child;

  const LoginFormWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  late final TextEditingController emailTextEditingController;
  late final TextEditingController passwordTextEditingController;

  @override
  void initState() {
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: emailTextEditingController,
            decoration: const InputDecoration(
              label: Text('Email'),
            ),
          ),
          TextFormField(
            controller: passwordTextEditingController,
            decoration: const InputDecoration(
              label: Text('Password'),
            ),
          ),
          BlocConsumer<LoginCubit, LoginState>(
            bloc: BlocProvider.of<LoginCubit>(context),
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => widget.child,
                  ),
                );
              }
            },
            builder: (context, state) {
              final status = context.watch<LoginCubit>().state;
              return ElevatedButton(
                onPressed: status is LoginLoading
                    ? null
                    : () {
                        BlocProvider.of<LoginCubit>(context)
                            .loginWithCredentialsCubit(
                          emailTextEditingController.text,
                          passwordTextEditingController.text,
                        );
                      },
                child: status is LoginLoading
                    ? const Center(child: CircularProgressIndicator())
                    : const Text('Login'),
              );
            },
          ),
        ],
      ),
    );
  }
}
