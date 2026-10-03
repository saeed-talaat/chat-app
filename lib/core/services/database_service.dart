abstract class DatabaseService {
  Future<void> addData({
     String? secondRecordId,
     String? secondPath,
    required String path,
    required Map<String, dynamic> data,
    required String? recordId,
  });

  Future<dynamic> getData({
    required String path,
    String? recordId,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists({
    required String path,
    required String recordId,
  });
}
