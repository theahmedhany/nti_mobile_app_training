import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/services/dio/dio_service.dart';
import 'configs/services/dio/dio_service_impl.dart';
import 'data/repositories/auth/auth_repository.dart';
import 'data/repositories/products/products_repository.dart';
import 'presentation/cubits/auth/auth_cubit.dart';
import 'presentation/cubits/observer/observer.dart';
import 'routes/app_routes.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        RepositoryProvider<DioService>(create: (_) => DioServiceImpl()),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(context.read<DioService>()),
        ),
        RepositoryProvider<ProductsRepository>(
          create: (context) =>
              ProductsRepositoryImpl(context.read<DioService>()),
        ),
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
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        ),
      ),
    );
  }
}
