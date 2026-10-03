import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFA0A5BA),
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: const Color(0xFFF4F5F9),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        border: buildOutlineInputBorder(false),
        enabledBorder: buildOutlineInputBorder(false),
        focusedBorder: buildOutlineInputBorder(true),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([bool? enableBorderSide ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: enableBorderSide != false
          ? const BorderSide(color: Color(0xFF131926), width: 1.0)
          : BorderSide.none,
    );
  }
}
