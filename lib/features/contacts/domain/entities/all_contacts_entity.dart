import 'package:chat_app/features/contacts/domain/entities/contact_entity.dart';

class AllContactsEntity {
  final List<ContactEntity> contacts;

  AllContactsEntity({required this.contacts});

  bool addContact({required ContactEntity contact}) {
    for (var element in contacts) {
      if (element.uid == contact.uid) {
        return false;
      }
    }

    contacts.add(contact);
    return true;
  }



  bool deleteContact({required  ContactEntity contact}){
      for (var element in contacts) {
      if (element.uid == contact.uid) {
       return contacts.remove(contact);
      }
    }
    return false;
  }



}
