import 'package:chat_app/features/contacts/presentation/views/widgets/add_contact_view_body.dart';
import 'package:flutter/material.dart';

class AddContactView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AddContactViewBody()),
    );
  }
}

