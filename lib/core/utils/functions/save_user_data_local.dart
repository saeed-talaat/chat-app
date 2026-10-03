import 'dart:convert';

import 'package:chat_app/core/constants/app_constatns.dart';
import 'package:chat_app/core/entities/user_entity.dart';
import 'package:chat_app/core/services/sharedpreferences_service.dart';

Future<void> saveUserDataLocal({required UserEntity userEntity}) async{
  String data = jsonEncode(userEntity.toMap());
  await Prefs.setString(AppConstatns.userData, data);
}