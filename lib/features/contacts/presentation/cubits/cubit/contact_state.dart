part of 'contact_cubit.dart';


abstract class ContactState {}

final class ContactInitial extends ContactState {}
final class ContactLoading extends ContactState {}
final class ContactFailure extends ContactState {
  final String errorMessage;

  ContactFailure({required this.errorMessage});
}
final class ContactSuccess extends ContactState {}

