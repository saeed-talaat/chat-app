import 'package:chat_app/features/contacts/data/models/contact_model.dart';

class ContactEntity {
  final String uid;
  final String name;
  final bool isOnline;
  final String imageUrl;
  final String lastSeen;
  final String phoneNumber;

  ContactEntity({
    required this.phoneNumber,
    required this.uid,
    required this.name,
    required this.isOnline,
    required this.imageUrl,
    required this.lastSeen,
  });

  factory ContactEntity.fromModel({required ContactModel contact}) {
    return ContactEntity(
      phoneNumber: contact.phoneNumber,
      uid: contact.uid,
      name: contact.name,
      isOnline: contact.isOnline,
      imageUrl: contact.imageUrl,
      lastSeen: contact.lastSeen,
    );
  }
}
