import 'package:chat_app/core/entities/user_entity.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  factory UserModel.fromMap({required Map<String, dynamic> data}) {
    return UserModel(
      uid: data['uid'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      phoneNumber: data['phoneNumber'],
    );
  }

  Map<String, String> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
  }
}
