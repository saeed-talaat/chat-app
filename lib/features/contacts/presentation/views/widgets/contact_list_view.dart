import 'package:chat_app/features/contacts/presentation/cubits/cubit/contact_cubit.dart';
import 'package:chat_app/features/contacts/presentation/views/widgets/contact_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = context.watch<ContactCubit>().contactsSearch;
    return contacts.isNotEmpty
        ? ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return ContactListItem(contactEntity: contacts[index]);
            },
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Start your search by entering a valid number ex(+201060976376).',
              ),
            ),
          );
  }
}
