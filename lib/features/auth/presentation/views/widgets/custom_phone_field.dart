import 'package:flutter/material.dart';
import 'package:intl_phone_field_v2/intl_phone_field.dart';
import 'package:intl_phone_field_v2/phone_number.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(PhoneNumber)? onChanged;
  final String initialCountryCode;
  final String hintText;

  const CustomPhoneField({
    super.key,
    this.controller,
    this.onChanged,
    this.initialCountryCode = 'EG',
    this.hintText = 'Phone Number',
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: initialCountryCode,
      showDropdownIcon: false,
      disableLengthCheck: true,
      flagsButtonPadding: const EdgeInsets.only(left: 16, right: 8),

      dropdownTextStyle: const TextStyle(
        color: Color(0xFF9EA3B0),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      style: const TextStyle(fontSize: 16, color: Colors.black87),

      onChanged: onChanged,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFB4B9C5), fontSize: 16),
        filled: true,
        fillColor: const Color(0xFFF5F6FA),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        counterText: "",
      ),
    );
  }
}
