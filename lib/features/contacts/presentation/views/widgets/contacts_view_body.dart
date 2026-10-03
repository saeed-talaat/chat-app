import 'package:chat_app/features/contacts/presentation/views/widgets/contact_items_list_view.dart';
import 'package:chat_app/features/contacts/presentation/views/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class ContactsViewBody extends StatelessWidget {
  const ContactsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 16),
          CustomSearchField(),
          SizedBox(height: 16),
          Expanded(child: ContactItemsListView()),
        ],
      ),
    );
  }
}
