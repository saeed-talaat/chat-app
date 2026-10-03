import 'package:chat_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:chat_app/features/contacts/presentation/cubits/cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListItem extends StatefulWidget {
  const ContactListItem({super.key, required this.contactEntity});
  final ContactEntity contactEntity;

  @override
  State<ContactListItem> createState() => _ContactListItemState();
}

class _ContactListItemState extends State<ContactListItem> {

  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.black38, size: 28),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.contactEntity.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                widget.contactEntity.phoneNumber,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black45, fontSize: 13),
              ),
            ],
          ),
          Spacer(),
          Visibility(
            visible: !isTapped,
            child: GestureDetector(
              onTap: () {
                setState(() {
                   isTapped = true;   
                });
               
                context.read<ContactCubit>().addContact(uid: widget.contactEntity.uid);
            
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFF2B7DE9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}