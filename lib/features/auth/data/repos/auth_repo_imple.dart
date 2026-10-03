import 'dart:developer';

import 'package:chat_app/core/entities/user_entity.dart';
import 'package:chat_app/core/errors/custom_exception.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/services/database_service.dart';
import 'package:chat_app/core/services/firebase_auth_service.dart';
import 'package:chat_app/core/utils/database_endpoints.dart';
import 'package:chat_app/core/utils/functions/save_user_data_local.dart';
import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:chat_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImple implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImple({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, String>> sendSmsCode({
    required String phoneNumber,
  }) async {
    try {
      final result = await firebaseAuthService.verifyPhoneNumber(
        phoneNumber: phoneNumber,
      );
      return right(result);
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      log('Exception in  AuthRepoImple.sendSmsCode  : ${e.toString()}');
      return left(
        ServerFailure(errorMessage: 'Failed to send code. Please try again  '),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signInWithSmsCode({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      await firebaseAuthService.signInWithCredentialSmsCode(
        smsCode: smsCode,
        verificationId: verificationId,
      );

      return right(null);
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      log('Exception in  AuthRepoImple.signInWithSmsCode  : ${e.toString()}');
      return left(
        ServerFailure(
          errorMessage: 'Incorrect verification code. Please try again.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> fetchUserData({required String uid}) async {
    try {
      final data = await databaseService.getData(
        path: DatabaseEndpoints.userData,
        recordId: uid,
      );

      if (data != null) {
        UserEntity userEntity = UserModel.fromMap(data: data).toEntity();
        saveUserDataLocal(userEntity: userEntity);
        return right(false);
      }
      return right(true);
    } catch (e) {
      log('Exception in  AuthRepoImple.fetchUserData  : ${e.toString()}');
      return left(ServerFailure(errorMessage: 'CANT FETCH USER DATA'));
    }
  }

  @override
  Future<Either<Failure, void>> addUserData({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    try {
      await databaseService.addData(
        path: DatabaseEndpoints.userData,
        data: data,
        recordId: uid,
      );
       saveUserDataLocal(userEntity: UserEntity.fromMap(data: data));
      return right(null);
    } catch (e) {
      log('Exception in  AuthRepoImple.addUserData  : ${e.toString()}');
      return left(ServerFailure(errorMessage: 'Error tray again later!'));
    }
  }
}
