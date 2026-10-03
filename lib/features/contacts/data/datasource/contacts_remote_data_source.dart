import 'package:chat_app/core/services/database_service.dart';
import 'package:chat_app/core/utils/database_endpoints.dart';
import 'package:chat_app/features/contacts/data/models/contact_model.dart';

abstract class ContactsRemoteDataSource {
  Future<List<ContactModel>> searchUserByPhoneNumber({
    required String phoneNumberPrefix,
  });

  Future<void> addContact({required String currentUid ,required String contactUid});
}

class ContactsRemoteDataSourceImpl implements ContactsRemoteDataSource {
  final DatabaseService databaseService;

  ContactsRemoteDataSourceImpl({required this.databaseService});

  @override
  Future<List<ContactModel>> searchUserByPhoneNumber({
    required String phoneNumberPrefix,
  }) async {
    final data = await databaseService.getData(
      path: DatabaseEndpoints.userData,
      query: {
        'phoneNumber': {
          'isGreaterThanOrEqualTo': phoneNumberPrefix,
          'isLessThan': '$phoneNumberPrefix\uf8ff',
        },
      },
    ) as List<Map<String, dynamic>>;

    final result = data.map((e) => ContactModel.fromMap(data: e)).toList();

    return result;
  }

  @override
  Future<void> addContact({required String currentUid ,required String contactUid}) async {
    final addedAt = DateTime.now();
    await databaseService.addData(
      secondPath: DatabaseEndpoints.myContacts,
      path: DatabaseEndpoints.userData,
      data: {'addedAt': addedAt},
      recordId: currentUid, secondRecordId: contactUid ,
    );
  }
}
