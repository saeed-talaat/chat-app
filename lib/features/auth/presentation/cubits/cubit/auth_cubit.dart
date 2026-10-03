import 'package:bloc/bloc.dart';
import 'package:chat_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;
  late String verificationId;
  bool isNewUser = true;
  Future<void> sendSmsCode({required String phoneNumber}) async {
    emit(AuthLoading());
    final result = await authRepo.sendSmsCode(phoneNumber: phoneNumber);

    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.errorMessage)),
      (userVerificationId) {
        verificationId = userVerificationId;
        return emit(AuthSuccess());
      },
    );
  }

  Future<void> signInWithCredentialSmsCode({required String smsCode}) async {
    emit(AuthLoading());
    final result = await authRepo.signInWithSmsCode(
      smsCode: smsCode,
      verificationId: verificationId,
    );
    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.errorMessage)),
      (success) async {
        final result = await authRepo.fetchUserData(
          uid: FirebaseAuth.instance.currentUser!.uid,
        );
        result.fold(
          (failure) => emit(AuthFailure(errorMessage: failure.errorMessage)),
          (success) {
            isNewUser = success;
            return emit(AuthSuccess());
          },
        );
      },
    );
  }

  Future<void> saveUserData({
    required String firstName,
    required String lastName,
  }) async {
    emit(AuthLoading());
    final userInfo = FirebaseAuth.instance.currentUser!;
    final data = {
      'uid': userInfo.uid,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': userInfo.phoneNumber,
    };
    final result = await authRepo.addUserData(uid: userInfo.uid, data: data);
    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.errorMessage)),
      (success) => emit(AuthSuccess()),
    );
  }
}
