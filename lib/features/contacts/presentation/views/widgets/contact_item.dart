import 'package:chat_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final ContactEntity contactEntity;

  const ContactItem({super.key, required this.contactEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  contactEntity.imageUrl,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 52,
                    height: 52,
                    color: Colors.grey[300],
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ),

              if (contactEntity.isOnline)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contactEntity.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  contactEntity.isOnline ? 'Online' : contactEntity.lastSeen,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
