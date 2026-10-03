import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinCode extends StatelessWidget {
  final void Function(String)? onCompleted;

  const CustomPinCode({
    super.key,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color(0xFF3B82F6); // لون أزرق أنيق للإطار
    const fillColor = Color(0xFFF3F4F6); // لون رمادي فاتح للخلفية
    const textColor = Color(0xFF111827); // كحلي غامق مريح للعين للأرقام

    // 1. تصميم الدائرة العادية (الفارغة)
    final defaultPinTheme = PinTheme(
      // تم تصغير الحجم قليلاً ليناسب 6 أرقام بدون Overflow
      width: 45, 
      height: 45,
      textStyle: const TextStyle(
        fontSize: 22, // تم تصغير الخط قليلاً ليتناسب مع الحجم الجديد
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        shape: BoxShape.circle, // المحافظة على الشكل الدائري
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04), // ظل خفيف جداً يعطي عمق
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );

    // 2. تصميم الدائرة النشطة (التي يقف عليها المستخدم الآن)
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        border: Border.all(color: focusedBorderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: focusedBorderColor.withValues(alpha: .15), // توهج خفيف باللون الأزرق
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
    );

    // 3. تصميم الدائرة بعد كتابة الرقم فيها
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white, // خلفية بيضاء لتبرز الرقم
        border: Border.all(color: Colors.grey.shade300, width: 1.5), // إطار رمادي خفيف
      ),
    );

    return Pinput(
      length: 6, // ✨ تم التعديل إلى 6 أرقام لدعم Firebase
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      
      // ✨ تم تقليل المسافة لتناسب حجم الشاشة مع 6 دوائر
      separatorBuilder: (index) => const SizedBox(width: 12), 
      
      autofillHints: const [AutofillHints.oneTimeCode],
      showCursor: true,
      
      // تخصيص شكل مؤشر الكتابة (Cursor) ليكون أنيق داخل الدائرة
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 2,
            height: 20, // تصغير طول المؤشر ليتناسب مع الدائرة الجديدة
            color: focusedBorderColor,
          ),
        ],
      ),
      
      onCompleted: onCompleted,
    );
  }
}