import 'dart:async';
import 'package:chat_app/core/errors/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  
  Future<String> verifyPhoneNumber({required String phoneNumber}) async {
    Completer<String> completer = Completer<String>();
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (!completer.isCompleted) {
          if (e.code == 'invalid-phone-number') {
            completer.completeError(
              CustomException(
                errorMessage: 'The provided phone number is not valid.',
              ),
            );
          } else {
            completer.completeError(
              CustomException(errorMessage: e.message ?? 'An error occurred.'),
            );
          }
        }
      },

      codeSent: (String verificationId, int? resendToken) {
        if (!completer.isCompleted) {
          completer.complete(verificationId);
        }
      },

      codeAutoRetrievalTimeout: (String verificationId) {
        if (!completer.isCompleted) {
          completer.completeError(
            CustomException(
              errorMessage: 'Timeout reached. Please request a new code.',
            ),
          );
        }
      },
    );
    return completer.future;
  }

   Future<void> signInWithCredentialSmsCode({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      
      await auth.signInWithCredential(credential);
     
    } catch (e) {
      throw CustomException(errorMessage: 'error try again later!');
    }
  }
}
