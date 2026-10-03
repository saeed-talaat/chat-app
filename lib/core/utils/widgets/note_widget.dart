import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  final String text;

  const NoteWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // لضمان أخذ العرض المتاح
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB), // لون خلفية هادئ جداً
        borderRadius: BorderRadius.circular(12), // حواف دائرية ناعمة
        border: Border.all(
          color: Colors.grey.withValues(alpha: .2), // إطار خفيف جداً
          width: 1,
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center, // توسيط النص كما في الصورة
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF333333), // رمادي غامق مريح للعين
          height: 2, // مسافة بين السطور لسهولة القراءة
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
