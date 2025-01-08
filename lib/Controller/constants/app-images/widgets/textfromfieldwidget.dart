import 'package:flutter/material.dart';
import '../../app-colors/app-colors.dart';

class TextFromFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword; // Add a flag to indicate if this is a password field

  TextFromFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false, // Default is not a password field
  });

  @override
  State<TextFromFieldWidget> createState() => _TextFromFieldWidgetState();
}

class _TextFromFieldWidgetState extends State<TextFromFieldWidget> {
  bool _isObscured = true; // Tracks whether the password is obscured

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: AppColors.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _isObscured : false, // Handle password visibility
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              suffixIcon: widget.isPassword
                  ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
