// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserSignupEntity extends Equatable {
  final String? uId;
  final String name;
  final String email;
  final String phone;
  final String? password;

  const UserSignupEntity({
    required this.name,
    required this.email,
    required this.phone,
    this.password,
    this.uId,
  });

  @override
  List<Object?> get props => [name, email, phone, password, uId];
}
