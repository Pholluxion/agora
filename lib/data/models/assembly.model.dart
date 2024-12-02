import 'package:equatable/equatable.dart';

class Assembly extends Equatable {
  final String id;
  final String name;
  final String description;
  final String date;
  final String status;

  const Assembly({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.status,
  });

  factory Assembly.initial() {
    return const Assembly(id: '', name: '', description: '', date: '', status: '');
  }

  factory Assembly.fromJson(Map<String, dynamic> json) {
    return Assembly(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      date: json['date'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'status': status,
    };
  }

  @override
  List<Object?> get props => [id, name, description, date, status];
}
