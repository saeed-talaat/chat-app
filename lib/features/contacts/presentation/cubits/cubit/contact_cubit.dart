import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity.dart';
import 'package:chat_app/features/contacts/domain/repos/contact_repo.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit({required this.contactRepo}) : super(ContactInitial());
  final ContactRepo contactRepo;
  Timer? _debounce;

  List<ContactEntity> contactsSearch = [];
  void searchUserByPhoneNumber({required String phoneNumber}) {
    _onSearchChanged(phoneNumber);
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();

    if (value.trim().isEmpty) {
      emit(ContactInitial());
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 1200), () async {
      await _searchUsers(value.trim());
    });
  }

  Future<void> _searchUsers(String phoneNumber) async {
    emit(ContactLoading());

    final result = await contactRepo.searchContactByPhoneNumber(
      phoneNumber: phoneNumber,
    );

    result.fold(
      (failure) {
        emit(ContactFailure(errorMessage: failure.errorMessage));
      },
      (users) {
        contactsSearch = users;
        emit(ContactSuccess());
      },
    );
  }

  Future<void> addContact({required String uid}) async {
    emit(ContactLoading());
    final result = await contactRepo.addContact(uid: uid);
    result.fold(
      (failure) => emit(ContactFailure(errorMessage: failure.errorMessage)),
      (success) => emit(ContactSuccess()),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
