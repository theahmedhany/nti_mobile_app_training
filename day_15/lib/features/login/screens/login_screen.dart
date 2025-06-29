import 'package:day_14/features/login/widgets/custom_button.dart';
import 'package:day_14/features/login/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: GlobalKey<FormState>(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/Icon.svg',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome To Lafyuu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff223263),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'sign in to continue',
                    style: TextStyle(fontSize: 16, color: Color(0xff9098B1)),
                  ),

                  const SizedBox(height: 40),

                  CustomTextField(
                    hintText: 'Email',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff223263),
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    inputTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff223263),
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff9098B1),
                    ),
                    isObscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  CustomTextField(
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff223263),
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    inputTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff223263),
                    ),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff9098B1),
                    ),

                    isObscureText: isObscureText,

                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  CustomButton(onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
