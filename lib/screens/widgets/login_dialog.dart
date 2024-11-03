import 'package:beauty_places/bloc/cubit/user_session_cubit.dart';
import 'package:beauty_places/utils/validators.dart';
import 'package:flutter/material.dart';

import '../../services/injection.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: CloseButton(),
                ),
                TextFormField(
                  controller: _emailController,
                  validator: Validators.validateEmail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  validator: Validators.validatePassword,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                    ),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final isSuccess = await getIt<UserSessionCubit>().loginOrRegister(_emailController.text, _passwordController.text);
                        if (context.mounted && isSuccess) Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
