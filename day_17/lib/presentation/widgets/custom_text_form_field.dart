import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _showPassword = false;

  void changeShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator, //
      controller: widget.controller,
      style: const TextStyle(color: Colors.black, fontSize: 16.0),
      obscureText: widget.isPassword && !_showPassword, //
      decoration: InputDecoration(
        hintText: widget.hint, //
        hintStyle: const TextStyle(
          color: Colors.grey, // Hint text color
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: changeShowPassword,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.blue, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
}
