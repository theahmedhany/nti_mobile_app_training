import 'package:day_14/features/login/manager/auth_cubit.dart';
import 'package:day_14/features/login/manager/auth_states.dart';
import 'package:day_14/features/login/widgets/custom_button.dart';
import 'package:day_14/features/login/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                SvgPicture.asset('assets/images/Icon.svg'),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  isObscureText: true,
                  controller: _passwordController,
                  hintText: 'Password', //
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
                                'assets/animations/loading.json',
                                repeat: true,
                                animate: true,
                              ),
                            ),
                          );
                        }, //
                      );
                    }
                    if (state is AuthLoggedInState) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home', // Replace with your home route name
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
                        ), //
                      );
                    }
                  },
                  child: CustomButton(
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
              ], //
            ),
          ),
        ),
      ),
    );
  }
}
