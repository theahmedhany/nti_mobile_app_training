import 'package:day_14/core/configs/services/dio/dio_service.dart';
import 'package:day_14/core/configs/services/dio/dio_service_impl.dart';
import 'package:day_14/core/routes/app_routes.dart';
import 'package:day_14/features/login/data/repos/auth_repository.dart';
import 'package:day_14/features/login/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        RepositoryProvider<DioService>(create: (_) => DioServiceImpl()),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(context.read<DioService>()),
        ),
        //
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit(context.read<AuthRepository>())..checkIsLoggedIn(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
