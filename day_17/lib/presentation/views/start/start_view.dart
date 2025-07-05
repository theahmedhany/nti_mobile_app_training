import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../routes/app_routes.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../widgets/loader_view.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<AuthCubit>().checkIsLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoaderView();
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final isLoggedIn = snapshot.data ?? false;

        if (isLoggedIn) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, AppRoutesNames.products);
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, AppRoutesNames.login);
          });
        }

        return const LoaderView();
      }, //
    );
  }
}
