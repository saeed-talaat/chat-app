import 'package:chat_app/features/contacts/presentation/cubits/cubit/contact_cubit.dart';
import 'package:chat_app/features/contacts/presentation/views/widgets/add_contact_header.dart';
import 'package:chat_app/features/contacts/presentation/views/widgets/contact_list_view.dart';
import 'package:chat_app/features/contacts/presentation/views/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContactViewBody extends StatelessWidget {
  const AddContactViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const AddContactHeader(),
          const SizedBox(height: 8),
          CustomSearchField(
            onChanged: (value) {
              context.read<ContactCubit>().searchUserByPhoneNumber(
                phoneNumber: value,
              );
            },
          ),
          const SizedBox(height: 16),
          Expanded(child: ContactListView()),
        ],
      ),
    );
  }
}
