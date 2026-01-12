// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
final String userId;
final String userName;
final String email;
final String password;
UserModel({required this.userId,required this.userName,required this.email,required this.password});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

}
