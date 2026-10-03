import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ContactRepo {
  Future<Either<Failure, List<ContactEntity>>> searchContactByPhoneNumber({
    required String phoneNumber,
  });

  Future<Either<Failure, void>> addContact({
    required String uid,
  });
}
