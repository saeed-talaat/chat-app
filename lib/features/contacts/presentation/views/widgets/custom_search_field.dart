import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomSearchField({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: const Color(0xFF8F9BB3), 
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF7F8FA), 
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Color(0xFF8F9BB3), 
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 12.0, right: 8.0),
          child: Icon(
            Icons.search,
            color: Color(0xFF8F9BB3), 
            size: 26,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
      ),
    );
  }
}