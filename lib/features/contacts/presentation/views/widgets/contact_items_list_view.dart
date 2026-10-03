import 'package:chat_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:chat_app/features/contacts/presentation/views/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactItemsListView extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return ContactItem(
          contactEntity: ContactEntity(
            phoneNumber: '010',
            uid: 'S',
            name: 'Saeed Talaat',
            isOnline: true,
            imageUrl: '',
            lastSeen: 'Last Seen 0 min',
          ),
        );
      },
    );
  }
}
