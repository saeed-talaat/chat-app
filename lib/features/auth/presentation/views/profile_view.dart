import 'package:chat_app/core/utils/widgets/build_app_bar.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/profile_view_bloc_builder.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Your Profile'),
      body: ProfileViewBlocBuilder(child: SafeArea(child: ProfileViewBody())),
    );
  }
}
