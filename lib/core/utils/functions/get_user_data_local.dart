import 'dart:convert';

import 'package:chat_app/core/constants/app_constatns.dart';
import 'package:chat_app/core/entities/user_entity.dart';
import 'package:chat_app/core/services/sharedpreferences_service.dart';

UserEntity? getUserDataLocal() {
  String? data = Prefs.getString(AppConstatns.userData);
  Map<String, dynamic> decodedData = jsonDecode(data);
  return UserEntity.fromMap(data: decodedData);
}
