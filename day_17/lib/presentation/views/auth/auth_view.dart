import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants/images_manager.dart';
import '../../../routes/app_routes.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/auth/auth_states.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SvgPicture.asset(AssetsManager.logo),
                const SizedBox(height: 30),
                CustomTextFormField(
                  controller: _emailController,
                  hint: 'Email',
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  isPassword: true,
                  controller: _passwordController,
                  hint: 'Password',
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (password.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                BlocListener<AuthCubit, AuthStates>(
                  listener: (context, state) {
                    if (state is AuthLoadingState) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Lottie.asset(
                                AssetsManager.loadingAnimation,
                                repeat: true,
                                animate: true,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    if (state is AuthLoggedInState) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutesNames.products,
                        (route) => false,
                      );
                    } else if (state is AuthLoggedInErrorState) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          margin: const EdgeInsets.all(20.0),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          content: Text(
                            'Login Fialed, Please make sure that you entered the correct email and password',
                          ),
                        ),
                      );
                    }
                  },
                  child: CustomButtonWidget(
                    title: 'Login',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        BlocProvider.of<AuthCubit>(context).login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
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
