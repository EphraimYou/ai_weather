// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final DateTime? birthDate;
  final String? gender;
  final String? image;
  final double? length;
  final double? width;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.birthDate,
    this.gender,
    this.image,
    this.length,
    this.width,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      gender: json['gender'],
      image: json['image'],
      email: json['email'],
      name: json['name'],
      birthDate: json['birth_date'],
      phone: json['phone'],
      length: json['length'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'image': image,
      'birth_date': birthDate,
      'phone': phone,
      'length': length,
      'width': width,
    };
  }

  @override
  List<Object?> get props =>
      [id, name, birthDate, phone, length, width, image, gender, email];
}
