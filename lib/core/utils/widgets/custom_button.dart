import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.onPressed, required this.text,
  });

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff002DE3),
        minimumSize: const Size(double.infinity, 56),
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Color(0xffF7F7FC), fontSize: 16),
      ),
    );
  }
}
