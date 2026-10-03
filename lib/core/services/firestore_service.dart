import 'package:chat_app/core/services/database_service.dart';
import 'package:chat_app/core/utils/functions/get_user_data_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    String? secondRecordId,
    String? secondPath,
    required String path,
    required Map<String, dynamic> data,
    required String? recordId,
  }) async {
    if (secondPath != null && recordId != null) {
      if (secondRecordId != null) {
        await _firebaseFirestore
            .collection(path)
            .doc(recordId)
            .collection(secondPath)
            .doc(secondRecordId)
            .set(data);
      } else {
        await _firebaseFirestore
            .collection(path)
            .doc(recordId)
            .collection(secondPath)
            .add(data);
      }
    } else if (recordId != null) {
      await _firebaseFirestore.collection(path).doc(recordId).set(data);
    } else {
      await _firebaseFirestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? recordId,
    Map<String, dynamic>? query,
  }) async {
    if (recordId != null) {
      final data = await _firebaseFirestore
          .collection(path)
          .doc(recordId)
          .get();

      return data.data();
    }

    Query<Map<String, dynamic>> data = _firebaseFirestore.collection(path);

    if (query != null) {
      if (query['phoneNumber'] != null) {
        final phoneQuery = query['phoneNumber'] as Map<String, dynamic>;

        final phoneNumberGreaterThan =
            phoneQuery['isGreaterThanOrEqualTo'] as String;

        final phoneNumberLessThan = phoneQuery['isLessThan'] as String;

        data = data.where(
          'phoneNumber',
          isGreaterThanOrEqualTo: phoneNumberGreaterThan,
        );

        data = data.where('phoneNumber', isLessThan: phoneNumberLessThan);

        data = data.where(
          'phoneNumber',
          isNotEqualTo: getUserDataLocal()!.phoneNumber,
        );
      }
    }
    final result = await data.get();
    return result.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String recordId,
  }) async {
    var data = await _firebaseFirestore.collection(path).doc(recordId).get();
    return data.exists;
  }
}
