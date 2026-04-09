import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Habits {
  Habits({required this.title, required this.createdAt, id})
    : id = id ?? uuid.v4();
  final String id;
  final String title;
  final DateTime createdAt;

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'createdAt': createdAt}; 
  }

  factory Habits.fromMap(Map<String, dynamic> map) {
    return Habits(
      id: map['id'],
      title: map['title'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
