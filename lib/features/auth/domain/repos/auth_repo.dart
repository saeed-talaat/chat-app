import 'package:chat_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> sendSmsCode({required String phoneNumber});
  Future<Either<Failure, void>> signInWithSmsCode({
    required String smsCode,
    required String verificationId,
  });

  Future<Either<Failure , bool>> fetchUserData({required String uid});
  Future<Either<Failure , void>> addUserData({required String uid   , required Map<String , dynamic> data});

}
