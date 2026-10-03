class UserEntity {
  final String uid;
  String? firstName;
  String? lastName;
  String? phoneNumber;

  UserEntity({
    required this.uid,
    required String? firstName,
    required String? lastName,
    required this.phoneNumber,
  });

  factory UserEntity.fromMap({required Map<String , dynamic> data}) {
    return UserEntity(
      uid: data['uid'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      phoneNumber: data['phoneNumber'],
    );
  }

  Map<String, String?> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
    };
  }
}
