import 'package:chat_app/core/utils/widgets/custom_button.dart';
import 'package:chat_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/custom_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPhoneViewBody extends StatefulWidget {
  const EnterPhoneViewBody({super.key});

  @override
  State<EnterPhoneViewBody> createState() => _EnterPhoneViewBodyState();
}

class _EnterPhoneViewBodyState extends State<EnterPhoneViewBody> {
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 80),
          const Text(
            'Enter Your Phone Number',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xff0F1828),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please confirm your country code and enter your phone number',
            style: TextStyle(fontSize: 16, color: Color(0xff0F1828)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          CustomPhoneField(
            onChanged: (value) {
              phoneNumber = '${value.countryCode}${value.number}';
            },
          ),
          const Spacer(),
          CustomButton(
            onPressed: () async {
              if (phoneNumber.isNotEmpty) {
                context.read<AuthCubit>().sendSmsCode(phoneNumber: phoneNumber);
              }
            },
            text: 'Continue',
          ),
          const SizedBox(height: 44),
        ],
      ),
    );
  }
}
