import 'dart:developer';

import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/utils/functions/get_user_data_local.dart';
import 'package:chat_app/features/contacts/data/datasource/contacts_remote_data_source.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:chat_app/features/contacts/domain/repos/contact_repo.dart';
import 'package:dartz/dartz.dart';

class ContactRepoImple implements ContactRepo {
  final ContactsRemoteDataSource contactsRemoteDataSource;

  ContactRepoImple({required this.contactsRemoteDataSource});

  @override
  Future<Either<Failure, List<ContactEntity>>> searchContactByPhoneNumber({
    required String phoneNumber,
  }) async {
    try {
      final data = await contactsRemoteDataSource.searchUserByPhoneNumber(
        phoneNumberPrefix: phoneNumber,
      );
      return right(
        data.map((e) => ContactEntity.fromModel(contact: e)).toList(),
      );
    } catch (e) {
      log(
        'Exception in ContactRepoImple.searchContactByPhoneNumber : ${e.toString()} ',
      );
      return left(ServerFailure(errorMessage: 'error try again later!'));
    }
  }

  @override
  Future<Either<Failure, void>> addContact({required String uid}) async {
    try {
      contactsRemoteDataSource.addContact(
        currentUid: getUserDataLocal()!.uid,
        contactUid: uid,
      );
      return right(null);
    } catch (e) {
      log(
        'Exception in ContactRepoImple.searchContactByPhoneNumber : ${e.toString()} ',
      );
      return left(ServerFailure(errorMessage: 'error try again later!'));
    }
  }
}
