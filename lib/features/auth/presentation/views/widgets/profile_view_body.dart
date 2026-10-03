import 'package:chat_app/core/utils/widgets/custom_button.dart';
import 'package:chat_app/core/utils/widgets/custom_text_field.dart';
import 'package:chat_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/add_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  String? firstName, lastName;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            SizedBox(height: 48),
            AddAvatarWidget(),
            SizedBox(height: 31),
            CustomTextField(
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Field is Required';
                } else {
                  return null;
                }
              },
              onSaved: (value) => firstName = value!,
              hintText: 'First Name (Required)',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 12),
            CustomTextField(
              onSaved: (value) => lastName = value,
              hintText: 'Last Name (Optional)',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 68),
    
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<AuthCubit>().saveUserData(
                    firstName: firstName!,
                    lastName: lastName ?? '',
                  );
                  
                }
                else{
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
