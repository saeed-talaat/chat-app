import 'package:chat_app/core/utils/widgets/note_widget.dart';
import 'package:chat_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/custom_pin_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterCodeViewBody extends StatelessWidget {
  const EnterCodeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              'Enter Code',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff0F1828),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We have sent you an SMS with the code to 0',
              style: TextStyle(fontSize: 16, color: Color(0xff0F1828)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48),
            CustomPinCode(onCompleted: (String userValue) {
              context.read<AuthCubit>().signInWithCredentialSmsCode(smsCode: userValue);
            }),
            SizedBox(height: 77),
            NoteWidget(
              text: 'You\'ll receive an SMS code shortly (may take 1-2 mins). Didn\'t get it? Please go back and verify your phone number',
            ),
          ],
        ),
      ),
    );
  }
}
