import 'package:chat_app/features/contacts/presentation/views/widgets/contacts_view_body.dart';
import 'package:chat_app/features/contacts/presentation/views/widgets/custom_contacts_app_bar.dart';
import 'package:flutter/material.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomContactsAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(child: ContactsViewBody()),
    );
  }
}

