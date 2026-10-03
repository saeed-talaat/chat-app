import 'package:chat_app/core/utils/widgets/build_app_bar.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/enter_phone_view_bloc_builder.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/enter_phone_view_body.dart';
import 'package:flutter/material.dart';

class EnterPhoneView extends StatelessWidget {
  const EnterPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: EnterPhoneViewBlocBuilder(
        child: SafeArea(child: EnterPhoneViewBody()),
      ),
    );
  }
}
