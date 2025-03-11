import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String username;
  final String email;

  const UserModel({this.id, required this.username, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'email': email};
  }

  @override
  List<Object?> get props => [id, username, email];
}
