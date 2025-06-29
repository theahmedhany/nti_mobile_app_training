import 'package:day_14/core/routes/app_routes.dart';
import 'package:day_14/features/login/manager/auth_cubit.dart';
import 'package:day_14/features/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<AuthCubit>().checkIsLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final isLoggedIn = snapshot.data ?? false;

        if (isLoggedIn) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, AppRoutesNames.home);
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, AppRoutesNames.login);
          });
        }

        return const LoginScreen();
      }, //
    );
  }
}
