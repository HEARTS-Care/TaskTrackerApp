import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TaskModel extends Equatable {
  final String? id;
  final String title;
  final String description;
  String status;

  TaskModel(
      {this.id,
      required this.title,
      required this.description,
      this.status = "Incomplete"});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [id, title, description, status];
}
